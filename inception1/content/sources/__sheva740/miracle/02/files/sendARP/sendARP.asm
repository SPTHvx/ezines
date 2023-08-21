.486
.model flat, stdcall
option casemap:none


include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\iphlpapi.inc;for SendARP
include \masm32\include\wsock32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\iphlpapi.lib;for SendARP
includelib \masm32\lib\wsock32.lib
includelib \masm32\lib\masm32.lib


Print_MAC			PROTO :DWORD,:DWORD


.data
	szMac		db '%02X:%02X:%02X:%02X:%02X:%02X',0
	lpMacbuf		db  150 dup(0)
	pulMAC		db 8
	sztab		db '	- ',0
	szError		db 'Input IP address please',13,10,0
	szbuffer		dd 50 dup(0)
.data?
	ulLen		ULONG ?
	dwIpaddr		dd ?
.code
start:	
	invoke GetCL,1,ADDR szbuffer          ; возьмем первый аргумент командной строки
	.if eax == 1                          ; если нет ни одного аргумента выход
 		invoke	inet_addr, addr szbuffer
		mov	dwIpaddr, eax
		mov	ulLen, 6
	
		invoke	StdOut, addr szbuffer
		invoke	StdOut, addr sztab 		
	
		invoke	SendARP, dwIpaddr, 0, ADDR pulMAC, ADDR ulLen
		invoke	Print_MAC, addr pulMAC, addr lpMacbuf 
		invoke	StdOut, addr lpMacbuf
	.else
		invoke StdOut,ADDR szError
	.endif
	invoke	ExitProcess, NULL
;===============================================================
Print_MAC proc param1:DWORD, outstr:DWORD
local	locbuff[128]:BYTE
	mov	edx,param1	
	movzx	eax, byte ptr [edx+5]
	push	eax
	movzx	eax, byte ptr [edx+4]
	push	eax
	movzx	eax, byte ptr [edx+3]
	push	eax
	movzx	eax, byte ptr [edx+2]
	push	eax
	movzx	eax, byte ptr [edx+1]
	push	eax
	movzx	eax, byte ptr [edx+0]
	push	eax
	invoke	wsprintf, addr locbuff, addr szMac
	invoke	lstrcpyn, outstr, addr locbuff,18
	ret
Print_MAC endp
end start