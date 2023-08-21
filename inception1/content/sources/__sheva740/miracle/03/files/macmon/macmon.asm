.586
.model flat,stdcall
option casemap:none
include \masm32\include\windows.inc
irp lb,<kernel32,wsock32,user32,masm32,iphlpapi,msvcrt>
include \masm32\include\lb.inc
includelib \masm32\lib\lb.lib
endm

memcpy			PROTO c:DWORD,:DWORD,:DWORD
SendARP_fake		PROTO :DWORD,  :DWORD, :DWORD, :DWORD
PutInQueue		PROTO :DWORD,:DWORD
ShowStruct		PROTO 
FreeStruct		PROTO 
Print_MAC			PROTO :DWORD,:DWORD
Search_infringer		PROTO :DWORD,:DWORD
ShowProgress		PROTO
Arp_IP2MAC		PROTO :DWORD
CtrlHandler		PROTO :DWORD
Stoping			PROTO	
gen			PROTO :DWORD

; ============================ Настроечные параметры 
.const
	SHOW_PROGRESS	EQU 1
	SHOW_MESSAGE	EQU 0
	SHOW_STRUCT	EQU 0
	DO_FREESTRUCT	EQU 1
	DO_THREAD		EQU 1
	DO_PROC		EQU 0

	IP_ADDR_NUMB	EQU 110
	TWAIT		EQU 500 ; Ожидание между циклами
.data
	IP_MAC STRUCT
		szIP		dd 0
		szMAC		dd 0
		ddNextAddr	dd 0
	IP_MAC ENDS
	IP_MACQueue	IP_MAC <>

	szMessage_added	db '[+] Record added!',13,10,0
	szCompName	db 25 dup (0)
	sztempbuff	db 16 dup (0)
	szpsuf		db 5 dup (0)
	szIP		db 16 dup (0)
	lf		db 13,10,0
	tab		db '	',0
	wsaData		WSADATA <0>
;ARP ---------------
	szMac		db '%02X:%02X:%02X:%02X:%02X:%02X',0
	dwCounter		dd 0
	bflag		dd 1
; Threads -------------------
.data?
	flag		dd    ?
	hThread		dd    ?
	context		CONTEXT    <>
; Show --------------
.data
	szwait		db '[+] in progress: .... ',0
	szstar		db '-\|/', 0
	sztemplate	db 0dh, '%s%c', 0
	szBuff		db 50 dup (0)
	szHome		db 0dh,0
	dwThread		dd 0
.data?
	cci		CONSOLE_CURSOR_INFO <>
	chand		dd ?
	_i		dd ?
	_wait		dd ?
	_star		dd ?
.data?
	stCS_output	CRITICAL_SECTION <?>
	stCS_search	CRITICAL_SECTION <?>
	pThreadHandleBuf	dd ?
	dwThreadCount	dd ?
.code
;===================================================================
;===================================================================
;===================================================================
Start:
	invoke	SetConsoleCtrlHandler, addr CtrlHandler, TRUE
	invoke	InitializeCriticalSection,ADDR stCS_output
	invoke	InitializeCriticalSection,ADDR stCS_search
	
	invoke	WSAStartup,010001, offset wsaData
	invoke	gethostname, offset szCompName,25
	invoke	gethostbyname, addr szCompName
	mov	eax,[eax + 12]
	mov	eax,[eax]
	mov	eax,[eax]
	invoke	inet_ntoa, eax
	invoke	lstrcpy, addr sztempbuff, eax
	invoke	StdOut, addr sztempbuff
	invoke	StdOut, addr lf

	IF	SHOW_PROGRESS
	invoke	CreateThread, 0, 0, offset ShowProgress, 0, 0, 0  ;создаем 
							;поток с красивой звездочкой
	mov	hThread,eax
	ENDIF

	.while bflag
		xor	eax,eax
		IF	DO_THREAD
		mov	eax,IP_ADDR_NUMB
		inc	eax
		sal	eax,2
		invoke	GlobalAlloc,GPTR,eax
		mov	pThreadHandleBuf,eax
		mov	dwThreadCount,0
		ENDIF
		xor	ecx,ecx

		.while	ecx != IP_ADDR_NUMB	
			inc	ecx
			push	ecx
			xor	eax,eax
			xor	ebx,ebx
			xor	ecx,ecx
			lea	edi,sztempbuff
			mov	cx,16      ;длину строки — в cx
			mov	al,'.'
			mov	ebx,0    ;счетчик для подсчета '.' в строке
			cld
		cycl:	repne	scasb
			cmp	ecx,0
			je	exit	;переход на exit, если цепочка 
					;просмотрена полностью
			inc	ebx
			cmp	bx,3
			jne	cycl
			mov	byte ptr [edi],0
			pop	ecx
			push	ecx
			invoke	dwtoa,ecx,addr szpsuf
			invoke	lstrcat, addr sztempbuff, addr szpsuf
			;invoke	StdOut, addr sztempbuff
			;invoke	StdOut, addr tab	
			;====================================
    			invoke	inet_addr, addr sztempbuff
			IF	DO_THREAD
			invoke	CreateThread,NULL,0,\
					offset Arp_IP2MAC,\
					eax,THREAD_PRIORITY_NORMAL,NULL
			;invoke	Sleep,300	;для Отладки
			lea	edi, pThreadHandleBuf
			pop	ecx
			push	ecx
			mov	dwThreadCount, ecx	
			mov	ebx, dwThreadCount
			mov	[edi+4*ebx], eax
			inc	dwThreadCount
			invoke	CloseHandle,eax
			ENDIF

			IF	DO_PROC
			invoke	Arp_IP2MAC, eax
			ENDIF
			;====================================
			pop	ecx
		.endw
		IF	DO_THREAD
		invoke	WaitForMultipleObjects,dwThreadCount,\
				addr pThreadHandleBuf,\
				TRUE,INFINITE
		invoke	GlobalFree,pThreadHandleBuf
		ENDIF

		IF	SHOW_STRUCT
		invoke	Sleep,TWAIT/2
		invoke	ShowStruct
		ENDIF

		IF	DO_FREESTRUCT
		invoke	Sleep,TWAIT/2
		invoke	FreeStruct
		ENDIF

		invoke	Sleep,TWAIT
	.endw

exit:	invoke	WSACleanup
	invoke	DeleteCriticalSection,ADDR stCS_output
	invoke	DeleteCriticalSection,ADDR stCS_search
	invoke	ExitProcess,-1

;===================================================================
;===================================================================
;===================================================================
;Функия PutInQueue (char* szip_str, byte[6]* dbmac_byts)
;Вход:	szip_str	- указатель на строку с IP-адресом найденного хоста
;	dbmac_byts- указатель на строку 6-байт с MAC-адресом хоста
;Выход:	строка IP-MAC будет помещена в таблицу  
;
PutInQueue  PROC  szip_str:DWORD, dbmac_byts:DWORD
	lea	edi,IP_MACQueue
	assume	esi:ptr IP_MAC  
@@:	mov	esi,edi
	mov	eax, dword ptr [esi].ddNextAddr
	cmp	dword ptr [esi].ddNextAddr, 0
	jz	@F
	mov	edi, dword ptr [esi].ddNextAddr
	jmp	@B
@@: 
	mov	ebx, edi
	invoke	LocalAlloc,LMEM_FIXED,sizeof(IP_MAC)
	.if eax == 0
		;invoke	StdOut, addr szMemErrorQ
		jmp	__errAllocMem
	.endif

	mov	[ebx+8],eax
	mov	dword ptr [eax], 0
	mov	dword ptr [eax+4], 0
	mov	dword ptr [eax+8], 0
	; Выделим память под имя плагина и сообщения  
	mov	ebx, edi
	mov	eax, 16
	invoke	LocalAlloc,LMEM_FIXED,eax
	.if eax == 0
		;invoke	StdOut, addr szMemErrorQ
		jmp	__errAllocMem
	.endif
	mov	[ebx], eax		; сохраним адрес

	mov	ebx, edi
	mov	eax, 6
	invoke	LocalAlloc,LMEM_FIXED,eax
	.if eax == 0
		;invoke	StdOut, addr szMemErrorQ
		jmp	__errAllocMem
	.endif
	mov	[ebx+4], eax		; сохраним адрес
	; Скопируем имя плагина и сообщение в эти новые 
	; выделенные участки памяти 
	mov	eax, 16
	push	eax
	mov	eax, szip_str
	push	eax
	mov	eax, edi
	mov	eax, dword ptr [eax]
	push	eax
	call	memcpy

	mov	eax, 6
	push	eax
	mov	eax, dbmac_byts
	push	eax
	mov	eax, edi
	mov	eax, dword ptr [eax+4]
	push	dword ptr eax
	call	memcpy
	IF	SHOW_MESSAGE
	invoke	StdOut, addr szMessage_added
	ENDIF
	assume	esi:NOTHING
__errAllocMem:
	ret
PutInQueue  ENDP
;===================================================================
;===================================================================
;===================================================================
;Функия ShowStruct 
;Вход:	нет
;
;Выход:	Вывод на экран содержимого таблицы IP-MAC 
;
.data
	template	db "[+] show record ip: %s	- mac:%s",13,10,0
	TextBuf	db 100 dup( 0 )
	sztemp	db 128 dup( 0 )
.code
ShowStruct  PROC
	xor	ecx,ecx
	mov	ecx,1

	assume	esi:ptr IP_MAC
	assume	edi:ptr IP_MAC
	lea	esi,IP_MACQueue
		
@@:	cmp	[esi].ddNextAddr,0
	je	__exit
	mov	edi,[esi].ddNextAddr
	push	edi

	lea	eax,[esi].szMAC
	mov	eax,[eax]
	invoke	Print_MAC, eax, addr sztemp
	lea	edi, sztemp
	push	edi

	lea	eax,[esi].szIP
	mov	eax,[eax]
	push	eax

	push	offset	template
	push	offset	TextBuf
	call	wsprintf
	add	esp,4*4
	invoke	StdOut,addr TextBuf
	pop	edi	
	mov	esi,edi
	jmp 	@B
__exit:
	assume	edi:NOTHING
	assume	esi:NOTHING
	ret
ShowStruct  ENDP
;===================================================================
;===================================================================
;===================================================================
;Функия Search_infringer (char* param1, char* param2)
;Вход:	param1	- указатель на строку с IP-адресом найденного хоста
;	param2	- указатель на строку 6-байт с MAC-адресом хоста
;Выход:	Если пара param1-param2 отсутствует в таблице, 
;	то эта пара будет помещена в таблицу по  PutInQueue(param1,param2)
;	если уже есть, то ничего не делать
;	если у пары совпали IP, но не совпали MAC, то вывод сообщения на экран
;
.data
	szOk	db ' OK +',10,13,0
	template1	db 0dh,'[!] ip:%s has chenged the MAC address %s for %s',10,13,0

.code
Search_infringer proc param1:DWORD, param2:DWORD
local szstr1[50]:BYTE
local szstr2[50]:BYTE
local szstr3[50]:BYTE

	assume	esi:ptr IP_MAC
	assume	edi:ptr IP_MAC
	lea	esi,IP_MACQueue
@@:	mov	eax,[esi].ddNextAddr
	cmp	[esi].ddNextAddr,0
	je	__exit
	mov	edi,[esi].ddNextAddr
	push	edi
		lea	eax,[esi].szIP
		mov	eax,[eax]
;int 3
		invoke	lstrcmp,param1,eax
		.if	eax == 0; Да?
			lea	eax,[esi].szMAC
			mov	eax,[eax]
			push	esi
			mov	esi,eax
			xor	ecx,ecx	
			mov	ecx,7
			lea	edi,szstr3
			rep movsb
			pop	esi

			invoke	Print_MAC, addr szstr3,addr szstr1
			invoke	Print_MAC, param2, addr szstr2
			invoke	lstrcmp, addr szstr1, addr szstr2
			.if	eax == 0; Да? Нет?
				IF SHOW_MESSAGE
				invoke	StdOut, addr szOk
				ENDIF
			.else
				IF	SHOW_PROGRESS
				invoke	SuspendThread, hThread  ;замораживаемся звездочку
				invoke	Sleep,100
				ENDIF
				lea	eax,szstr2
				push	eax
				lea	eax,szstr1
				push	eax
				mov	eax,param1
				push	eax
				push	offset	template1
				push	offset	TextBuf
				call	wsprintf
				add	esp,4*5
				invoke	StdOut,addr TextBuf
				IF	SHOW_PROGRESS
				invoke	Sleep, 100
				invoke	ResumeThread, hThread   ;отпускаем звездочку крутиться
				ENDIF
				jmp	__quit
			.endif 	
		.endif
	pop	edi	
	mov	esi,edi
	jmp 	@B



__exit:	assume	edi:NOTHING
	assume	esi:NOTHING	
	xor	eax,eax
	ret

__quit:	assume	edi:NOTHING
	assume	esi:NOTHING
	xor	eax,eax
	mov	eax,-1
	ret
Search_infringer  ENDP
;===================================================================
;===================================================================
;===================================================================
;Функия Print_MAC (char* param1, char* outstr)
;Вход:	param1	- указатель на строку 6-байт с MAC-адресом хоста
;	outstr	- указатель на строку вывода 
;Выход:	В строку  outstr будет помещена строка в виде
;	XX-XX-XX-XX-XX-XX
;
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
;===================================================================
;===================================================================
;===================================================================
;Функия FreeStruct 
;Вход:	нет
;
;Выход:	Очистка содержимого таблицы IP_MACQueue<> содержащей строки IP-MAC  
;
.data
	template2	db '[+] record whis ip=%s and mac=%s > dev\null',10,13,0
.code
FreeStruct  PROC
	mov	ecx,dwCounter
	assume	esi:ptr IP_MAC
	assume	edi:ptr IP_MAC

.while	dwCounter!=0
	lea	esi,IP_MACQueue
@@:	cmp	dword ptr[esi].ddNextAddr,0
	je	@F
	mov	ecx,esi
	mov	edi,[esi].ddNextAddr
	mov	esi,edi
	jmp 	@B
@@:	mov	edi,ecx
	push	edi
	lea	eax,[edi].szMAC
	mov	eax,[eax]
	invoke	Print_MAC, eax, addr sztemp
	lea	esi, sztemp
	push	esi
	lea	eax,[edi].szIP
	mov	eax,[eax]
	push	eax
	push	offset	template2
	push	offset	TextBuf
	call	wsprintf
	add	esp,4*4
	;IF	SHOW_MESSAGE
	invoke	StdOut,addr TextBuf
	;ENDIF
	pop	edi
	lea	eax,[edi]
	mov	eax,[eax]
	mov	ecx,eax
	push	eax
	call	LocalFree
	mov	dword ptr[edi],0
	lea	eax,[edi]
	mov	eax,[eax+4]
	push	eax
	call	LocalFree
	mov	dword ptr[edi+4],0
	lea	eax,[edi]
	mov	eax,[eax+8]
	push	eax
	call	LocalFree
	mov	dword ptr[edi+8],0
	dec	dwCounter
.endw
	assume	edi:NOTHING
	assume	esi:NOTHING
	ret
FreeStruct  ENDP
;===================================================================
;===================================================================
;===================================================================
;Функия ShowProgress 
;Вход:	нет
;
;Выход:	Вывод на консоль симпатичной вертящейся звездочки -\|/
;	отражающей програс поиска. Чисто чтобы не было скушно ))   
;
ShowProgress  PROC
	invoke	GetStdHandle,STD_OUTPUT_HANDLE
	mov	chand,eax
	invoke	GetConsoleCursorInfo,chand,addr cci
	mov	cci.bVisible,FALSE
	invoke	SetConsoleCursorInfo,chand,addr cci
	mov	_wait, OFFSET szwait
	mov	_star, OFFSET szstar

	mov	DWORD PTR _i, 0
	jmp	__show
__for:	inc	_i
	mov	ecx, _i
	and	ecx, -2147483645
	jns	SHORT $L42201
	dec	ecx
	or	ecx, -4
	inc	ecx
$L42201:
	mov	_i, ecx
__show:	mov	edx, _star
	add	edx, _i
	movsx	eax, byte ptr [edx]
	push	eax
	mov	ecx, _wait
	push	ecx
	push	OFFSET sztemplate	
	push	OFFSET szBuff
	call	wsprintf
	add	esp, 12
	invoke	StdOut, addr szBuff

	invoke	Sleep,300
	jmp	__for
	ret
ShowProgress  ENDP
;===================================================================
;===================================================================
;===================================================================
;Функия Arp_IP2MAC (DWORD dwIpaddr) 
;Вход:	dwIpaddr - IP в представлении последовательности байт 
;
;Выход:	Получение по IP строки соответствия IP-MAC
;	Проверка наличия этой строки в таблице по Search_infringer()
;	Добавление строки в таблицу IP_MACQueue<> по PutInQueue()  
;
.data
	szMacFmt		db "%s",9,"%02X-%02X-%02X-%02X-%02X-%02X",13,10,0
.code
Arp_IP2MAC proc dwIpaddr:DWORD
local pulMac[8]:		BYTE
local ulLen:		DWORD
local lpMacbuf,lpIpbuf:	DWORD
local dwWritten:		DWORD

	mov	ulLen,6
	;invoke	SendARP_fake,dwIpaddr,0,ADDR pulMac,ADDR ulLen
	invoke	SendARP,dwIpaddr,0,ADDR pulMac,ADDR ulLen

	.IF	ulLen != 0
		invoke	GlobalAlloc,GPTR,4000
		mov	lpMacbuf,eax
		invoke	inet_ntoa,dwIpaddr
		mov	lpIpbuf,eax
		xor	eax,eax
		mov	al,pulMac[5]
		push	eax
		mov	al,pulMac[4]
		push	eax
		mov	al,pulMac[3]
		push	eax
		mov	al,pulMac[2]
		push	eax
		mov	al,pulMac[1]
		push	eax
		mov	al,pulMac[0]
		push	eax
		push	lpIpbuf
		lea	eax,szMacFmt
		push	eax
		push	lpMacbuf
		call	wsprintf

		invoke	EnterCriticalSection,ADDR stCS_output
		invoke	GetStdHandle,STD_OUTPUT_HANDLE
		push	eax
		invoke	lstrlen,lpMacbuf
		pop	ecx

		IF SHOW_MESSAGE
		lea	edx,dwWritten
		invoke	WriteFile,ecx,lpMacbuf,eax,edx,NULL
		ENDIF

		invoke	GlobalFree,lpMacbuf
		invoke	LeaveCriticalSection,ADDR stCS_output

		invoke	EnterCriticalSection,ADDR stCS_search
		invoke	Search_infringer,lpIpbuf, addr pulMac
		invoke	PutInQueue, lpIpbuf, addr pulMac
		invoke	LeaveCriticalSection,ADDR stCS_search	
	.ENDIF
	ret
Arp_IP2MAC endp
;===================================================================
;===================================================================
;===================================================================
; Функция CtrlHandler (param1)
; Вход -  param1 - тип сообщения пользователя 
; 
; Выход - завершение программы
; 
;
CtrlHandler proc fdwCtrlType:DWORD 
	cmp	dword ptr fdwCtrlType,CTRL_C_EVENT 
	je	_reset
	cmp	dword ptr fdwCtrlType,CTRL_CLOSE_EVENT
	je	_reset
	cmp	dword ptr fdwCtrlType,CTRL_BREAK_EVENT
	je	_reset
	cmp	dword ptr fdwCtrlType,CTRL_LOGOFF_EVENT
	je	_reset
	cmp	dword ptr fdwCtrlType,CTRL_SHUTDOWN_EVENT
	je	_reset
	leave         
	jmp	_default	; обработка по умолчанию      
_reset:	mov	bflag,0
	invoke	Stoping	
	invoke	WSACleanup
	invoke	DeleteCriticalSection,ADDR stCS_output
	invoke	DeleteCriticalSection,ADDR stCS_search
	invoke	ExitProcess,0
_default:	mov	bflag,0

	invoke	Stoping
	invoke	WSACleanup
	invoke	DeleteCriticalSection,ADDR stCS_output
	invoke	DeleteCriticalSection,ADDR stCS_search
	invoke	ExitProcess,-1
CtrlHandler	endp
;===================================================================
;===================================================================
;===================================================================
; Функция Stoping 
; Вход -  нет 
; 
; Выход - корректное завершение программы
; 
;
.data
	szDot		db '.',0	
	szResering	db 0dh,'[+] Reseting ......',0		;
	szSleep5		db '[+] Sleep 5s ',0
.code
Stoping	proc
	invoke	TerminateThread,hThread,NULL
	invoke	StdOut, addr szResering
	invoke	StdOut, addr lf 
	invoke	StdOut, addr szSleep5
	xor	ecx,ecx
	mov	ecx,24 	
	.while	ecx !=0
		dec	ecx
		push	ecx
		invoke	StdOut, addr szDot
		invoke	Sleep,300
		pop	ecx
	.endw
Stoping	endp
;===================================================================
;===================================================================
;===================================================================
;Функия SendARP_fake ( не используется ) - Чисто для того чтобы 
; потестировать без использования настоящей SendARP() 
;Вход:	не важны )))
;
;Выход:	В строку  param3 будет помещена строка в виде
;	XX-XX-XX-XX-XX-XX с MAC = 01-02-03-04-05-06,00
;	причем первый байт будет случайным. Это как быдно
;	мы ловим изминение MAC-а
;
.data
	szMAC_fake db 01,02,03,04,05,06,00 
.code
SendARP_fake PROC  param1:DWORD,  param2:DWORD, param3:DWORD, param4:DWORD
	invoke	Sleep, 10
	invoke	GetTickCount
	mov	seed, eax
	mov	ebx, 4
	invoke	gen, 254
	lea	edi, szMAC_fake
	mov	byte ptr [edi],dl
	mov	edi, param3
	invoke	lstrcpy, param3, addr szMAC_fake
	ret
SendARP_fake  ENDP
;===================================================================
;===================================================================
;===================================================================
;Функия gen ( DWORD max_num ) 
;Вход:	max_num - генерируем псевдослуч. число <= max_num
;
;Выход:	dl = псевдослучайное число
;
.data
	numBuffer	db 128 dup (0)
	seed	dd 12345
.code
gen proc max_num:dword
	mov	eax,08088405h
	xor	edx,edx
	mul	seed
	inc	eax
	mov	seed,eax
	mul	max_num
	ret
gen endp
;===================================================================
;===================================================================
;===================================================================
end Start