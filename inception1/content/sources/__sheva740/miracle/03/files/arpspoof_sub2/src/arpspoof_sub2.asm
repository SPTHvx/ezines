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
atoi		proto c:DWORD
malloc		proto c:DWORD
free		proto c:DWORD
;time		proto c:DWORD
;localtime	proto c:DWORD

param_i		proto :DWORD 	; ������� ��������� ���������  "-i"
param_r		proto :DWORD 	; ������� ��������� ���������  "-r"
;param_s		proto :DWORD, :DWORD, :DWORD ; ������� ��������� ���������  "-s"
InitARPSpoof	proto
StartARPSpoof	proto
GetLocalIP	proto :DWORD
GetLocalMAC	proto :DWORD, :DWORD
SpoofThread	proto :DWORD
SpoofInfo		proto :DWORD
SendingARP	proto :DWORD
ResetSpoof	proto
CtrlHandler	proto :DWORD


show_error	proto :DWORD 	; �������������� ����� ������
show_help		proto		; ����� ������ ����. �� ������������� �����
StrToDWORD	proto :DWORD 	; ������� �������������� ������ MAC ������ � ������������������ ����
HexStrToDWORD	proto :DWORD	; ������� �� DEEP/wasm.ru ������� ������� StrToDWORD() 
StaticARP		proto :DWORD, :DWORD; �������	��������� ���������� ARP - ������������
GetMAC		proto :DWORD, :DWORD; �������	���������� MAC ������ �� IP ������ ����� 
checksum		proto :DWORD, :DWORD; ������� �������� ����������� ����� ������ ICMP 
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
		szSelfIP		db 16 dup(0)	; mySelf IP
		ucPretendMAC	db 6 dup(0)	; IP2's Pretend MAC
		hInterface	dd 0
	ARPSPOOF	ends

	arpspoof	ARPSPOOF <>	


;struct _PACKET_OID_DATA {
;    ULONG Oid;	///< OID code. See the Microsoft DDK documentation or the file ntddndis.h
;		///< for a complete list of valid codes.
;    ULONG Length;	///< Length of the data field
;    UCHAR Data[1];	///< variable-lenght field that contains the information passed to or received 
;		///< from the adapter.
;	}; 
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
	console_up		dd -1	; ���� "�������" ������������ ���������� �� ICMP ��������� ���������


	szhelper	db ' Usage: arpspoof [-h] -i [[N] [-r] [-p IP_A IP_B [port]]]',13,10,\
		'	-h - show help',13,10,\
		'	-i - output list of interfaces',13,10,0
	szhelper1	db	'	 N - number of intresting interface',13,10,\
		'	-r - reset spoofing and restore local static ARP table on sniffing hosts',13,10,\
		'	-p IP_A IP_B - listen to the traffic from A up to B and back',13,10,0

	szerror_i			db 'param -i',13,10,0 ; ������ ��������� "-i"
	szerror_r			db 'param -r',13,10,0 ; ������ ��������� "-r"
	szerror_s			db 'param -s',13,10,0 ; ������ ��������� "-s"
	szerror_p			db 'param -p',13,10,0 ; ������ ��������� "-p"
	szerror_template		db '[-] Error in %s',0 ; ������ ������ ���������� 
	szparam_r			db '-r ',0
	szparam_s			db '-s ',0
	szparam_p			db '-p ',0
	szErrOpenDev 		db 'Unable to open the adapter.',0
	crlf			db 13,10,0
	szErrpcap_findalldevs 	db '[-] Error in pcap_findalldevs',0
	DevSelection		dd 0
	DevCounter		dd 0
	PortNumb			dd 0
	compteur			dd 0
	locIP			db 20 dup (0) ; ����� ��� �������� ���������� IP 

	errbuf			db [PCAP_ERRBUF_SIZE] dup (0)
	buff			db [MAX_PATH] 	dup (0)

	hThread1			dd 0
	hThread2			dd 0
	dwCode1			dd 0
	dwCode2			dd 0

	pMemory			dd 0
	pMemory2			dd 0
 	;  pTreadBuff			dd 0
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


;;;;;;;;;;;;;;;;;;;;;		
		;---------------------------------------------------------------
	@@:	cmp	word ptr[edi], 's-'	; ������������ ������ "-s". 
		jne	__next

		pop	ecx
		inc	ecx
		push	ecx

		assume	esi:ptr ARPSPOOF
		lea	esi,arpspoof
		;lea	eax,[esi].szIP
		;invoke	ParamStr, ecx, eax, 16			
		invoke	ParamStr, ecx, addr buff, MAX_PATH	; ��������� 1-� �������� ��������� "-s".
							; ��� ������ ���� IP - ����� ����������� ������.
							; �������� ��� � [buff]

		.if	ecx == 0			; ���� ��� ��� �� ������� ��������� �� ������ � ��������� "-s".
			invoke	show_error,addr szerror_s 
			jmp	__Exit

		.else
			;lea	eax,[esi].szIP	
			invoke	inet_addr,addr buff	; �������� ���������� IP - ������ � ���� ��� ��, 
						; �� �������� ��� � ������� ��������� ���������. 
			.if	eax==INADDR_NONE
				; ���� IP-����� �������, �� ������� ��������� �� ������ � ��������� "-s".  
				invoke	show_error,addr szerror_s	
			.else
				;int 3					
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
				invoke	lstrcpyn, eax, addr buff,16					; ��������� �� ������ � ��������� "-s".  
			.endif
		.endif
		;---------------
		pop	ecx		; ��������� �������� �������� ��������� "-p" �����.
		inc	ecx
		push	ecx

		invoke	ParamStr, ecx, addr buff, MAX_PATH	; ������� �������� ����� 
							; ��� ������� ������ 
		invoke    atoi, addr buff
		.if	eax !=0
			invoke	atodw, addr buff		; ����������� ������ ������ ����� � ����� 
			mov	dword ptr [PortNumb], eax	; ������� ��� ����� � ���������� [PortNumb]
	;
			;invoke	param_s, (ARPSPOOF ptr [esi]).szIP, (ARPSPOOF ptr [esi]).szTarget ,addr temp
			;SetConsoleCtrlHandler((PHANDLER_ROUTINE) CtrlHandler, TRUE);
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
			jne	__next
		.else
			invoke	show_error,addr szerror_p	; ����� �� ������� 
							; ��������� �� ������ � ��������� "-p". 
			jne	__next
		.endif	
	__next:
		pop	ecx
	.endw
__Exit:	;invoke	pcap_freealldevs,alldevs
	;add	esp, 4*1
	invoke	ExitProcess,0
;===================================================================
;===================================================================
;===================================================================
end start	