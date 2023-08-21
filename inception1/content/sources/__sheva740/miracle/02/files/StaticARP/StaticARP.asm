
.586
.model	flat, stdcall
option	casemap:none

include     \masm32\include\windows.inc
include     \masm32\include\user32.inc
include     \masm32\include\kernel32.inc
include     \masm32\include\masm32.inc
include     \masm32\include\IpHlpApi.inc

include	\masm32\macros\macros.asm


includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\IpHlpApi.lib


include	\masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

include	\masm32\include\wsock32.inc 
includelib \masm32\lib\wsock32.lib 
;-------------------------------------------------------------------
; ќбъ€вим некоторые "удобные" функции из библиотеки msvcrt
memset		proto c:DWORD, :DWORD, :DWORD 
memcpy		proto c:DWORD, :DWORD, :DWORD 

;-------------------------------------------------------------------
.const
	MAXLEN_PHYSADDR	equ 8
;-------------------------------------------------------------------
.data
MIB_IPFORWARDROW	struct 
	dwForwardDest	DWORD 0
	dwForwardMask	DWORD 0
	dwForwardPolicy	DWORD 0
	dwForwardNextHop	DWORD 0
	dwForwardIfIndex	DWORD 0
	dwForwardType	DWORD 0
	dwForwardProto	DWORD 0
	dwForwardAge	DWORD 0
	dwForwardNextHopAS	DWORD 0
	dwForwardMetric1	DWORD 0
	dwForwardMetric2	DWORD 0
	dwForwardMetric3	DWORD 0
	dwForwardMetric4	DWORD 0
	dwForwardMetric5	DWORD 0
MIB_IPFORWARDROW	ends

MIB_IPNETROW	struct
	dwIndex		DWORD 0
	dwPhysAddrLen	DWORD 0
	bPhysAddr		BYTE MAXLEN_PHYSADDR DUP(0)
	dwAddr		DWORD 0
	dwType		DWORD 0
MIB_IPNETROW	ends
;-------------------------------------------------------------------
pulMac	db   8
lpMacbuf	db  150 dup(0)
szMac	db  '%02X-%02X-%02X-%02X-%02X-%02X',0

szIPA	db 16 dup (0)
ucMAC	db 6 dup (0)
;-------------------------------------------------------------------
.data?
	buffer db 100 dup(?)
.code
;===================================================================
;===================================================================
;===================================================================
StaticARP  proc szIPAddr:DWORD, bPhysAddr:DWORD 
local ipfrow 	 :MIB_IPFORWARDROW
local iprow 	 :MIB_IPNETROW 
local dwIPAddr 	 :DWORD
	
	invoke	inet_addr, szIPAddr
	mov	dwIPAddr,eax
	lea	edi,ipfrow
	invoke	GetBestRoute, eax, INADDR_ANY, edi
	.if	eax != NO_ERROR
		ret -1
	.endif

	invoke	memset, addr iprow,0,sizeof iprow

	assume	esi:ptr MIB_IPFORWARDROW
	assume	edi:ptr MIB_IPNETROW
	lea	esi,ipfrow
	lea	edi,iprow
	push	[esi].dwForwardIfIndex
	pop	[edi].dwIndex
	mov	[edi].dwPhysAddrLen, 6

	push	6
	mov	eax,bPhysAddr
	push	eax
	lea	eax,[edi].bPhysAddr
	push	eax
	call	memcpy

	mov	eax, dwIPAddr	
	mov	[edi].dwAddr, eax
	mov	[edi].dwType, 4;	/* - static */

	invoke	CreateIpNetEntry, edi
	.if	eax!= NO_ERROR
		xor	eax,eax
		ret
	.endif
	mov	eax,-1
	ret


StaticARP  endp
;===================================================================
;===================================================================
;===================================================================
GetMAC  proc szIP:DWORD, ucMacAddr:DWORD 
local dwIpaddr:	DWORD
local ulLen:	DWORD

	invoke	inet_addr, szIP
	mov	dwIpaddr, eax
	mov	ulLen, 6

	invoke	SendARP, dwIpaddr, 0, addr pulMac, addr ulLen
	invoke	memcpy, ucMacAddr, addr pulMac, ulLen

	xor	eax, eax
	mov	ecx, 6
@@:	movzx	eax, byte ptr pulMac[ecx-1]
	push	eax
	loop	@b
	invoke	wsprintf, addr lpMacbuf, addr szMac
	invoke	StdOut, addr lpMacbuf 
	ret
GetMAC  endp
;===================================================================
;===================================================================
;===================================================================
start:

	invoke GetCL,1,ADDR buffer 	; возьмем первый аргумент командной строки
	.if eax == 1		; если нет ни одного аргумента выход
		invoke	memset, addr ucMAC,0,6
		invoke	GetMAC, addr buffer, addr ucMAC
		invoke	StaticARP, addr buffer, addr ucMAC
	.endif
	invoke	ExitProcess,0
end start
