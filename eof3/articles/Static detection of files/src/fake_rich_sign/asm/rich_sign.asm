.386
.model flat, stdcall                     
option casemap:none

include windows.inc
include kernel32.inc
include user32.inc

includelib kernel32.lib
includelib user32.lib



;m1x
;pr0mix
;EOF


 
.data
szCheckROk		db	'Check Rich = OK', 0
szCheckRNo		db	'Check Rich = FAULT', 0
szChangeROk		db	'Change Rich = OK', 0
szChangeRNo		db	'Change Rich = FAULT', 0
szGenROk		db	'Generate Rich = OK', 0
szGenRNo		db	'Generate Rich = FAULT', 0 
szPath1			db	'C:\Games\123\xtest.exe', 0
szPath2			db	'C:\Games\123\xtest1.exe', 0
szPath3			db	'C:\Games\123\xrich.bin', 0

MAGIC_NUMBER	equ	10000h												;������ �᫮ ���� ��室� ⮫쪮 � 䠩���, ᮡ࠭��� �� msvc (VC++ (6)). �� masm etc - ⠪��� �᫠ ������ ���;  
                     

comp_id			dd  00021C6Ah, 00041F6Fh, 00041FE8h, 000420FFh			;�� ����� �뫨 ����� �� ���७��� ��-ᨣ����� ࠧ����� PE-䠩���, ᮡ࠭��� � VC ++ (6); 
            	dd  000520FFh, 000606C7h, 0006082Ah, 00060856h
            	dd  000A1F6Fh, 000A1FE8h, 000A20FFh, 000A225Fh
            	dd  000A2306h, 000B1F6Fh, 000B2306h, 000C1C7Bh
            	dd  000E1C83h, 000F0C05h, 001220FCh, 00131F62h
            	dd  00131F8Eh, 00131FBCh, 00132359h, 00192353h
            	dd  001923FAh, 001C23DAh, 001C24FAh, 001D24FAh
            	dd  0023209Eh, 002723CAh, 002A2263h, 003D23FAh
            	dd  003D24FAh, 004023FAh, 004024FAh, 00452397h
            	dd  005A0C05h, 005C0C05h, 005D0813h, 005D0883h
            	dd  005D0C05h, 005F088Eh, 005F0C05h, 005F0D0Fh
            	dd  005F0D15h, 00600C05h, 00600C7Ah, 00600C84h
            	dd  00600D0Fh, 00600D15h, 00690813h, 007B7920h
            	
            	dd	00162306h, 000A2636h, 000B2636h, 00302354h 
            	dd	005F0FC3h, 005D0FC3h, 000B2179h, 00042179h 
            	
            	dd  007B9D76h, 007B9DEAh, 007C9FC8h, 0

            	 
mzhdr_dosstub	db	04Dh, 05Ah, 090h, 000h, 003h, 000h, 000h, 000h 
				db	004h, 000h, 000h, 000h, 0FFh, 0FFh, 000h, 000h 
				db	0B8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h 
				db	040h, 000h, 000h, 000h, 000h, 000h, 000h, 000h 
				db	000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h  
				db	000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h 
				db	000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h 
				db	000h, 000h, 000h, 000h, 0D8h, 000h, 000h, 000h 
				db	00Eh, 01Fh, 0BAh, 00Eh, 000h, 0B4h, 009h, 0CDh 
				db	021h, 0B8h, 001h, 04Ch, 0CDh, 021h, 054h, 068h 
				db	069h, 073h, 020h, 070h, 072h, 06Fh, 067h, 072h 
				db	061h, 06Dh, 020h, 063h, 061h, 06Eh, 06Eh, 06Fh 
				db	074h, 020h, 062h, 065h, 020h, 072h, 075h, 06Eh 
				db	020h, 069h, 06Eh, 020h, 044h, 04Fh, 053h, 020h 
				db	06Dh, 06Fh, 064h, 065h, 02Eh, 00Dh, 00Dh, 00Ah 
				db	024h, 000h, 000h, 000h, 000h, 000h, 000h, 000h

size_md			equ	$ - mzhdr_dosstub 			  


.code

include		rang32.asm													;������砥� ᮡ�⢥��� ���  

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪� xReadFile
;�⥭�� 䠩�� � ������
;�室:
;	szFileName - ���� � 䠩��
;��室:
;	EAX		   - ���� � �����, �㤠 ᪮��஢�� 䠩� (���� 0)
;	ECX		   - ࠧ��� 䠩��
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xReadFile proc szFileName:DWORD
	push	0
	push	FILE_ATTRIBUTE_NORMAL 
	push	OPEN_EXISTING
	push	0
	push	FILE_SHARE_READ + FILE_SHARE_WRITE 
	push	GENERIC_READ
	push	szFileName
	call	CreateFile													;���뢠�� 䠩� �� �⥭��

	inc		eax
	je		_ret_xrf_													;㤠筮?
	dec		eax
	push	ebx
	push	esi
	push	edi 
	xor		esi,esi
	xchg	eax,ebx
;--------------------------------------------------------------------------------------------------------
	push	esi
	push	ebx
	call	GetFileSize													;����砥� ࠧ��� 䠩��

	push	eax
	push	eax  
;--------------------------------------------------------------------------------------------------------
	push	eax
	push	0
	call	GlobalAlloc													;�뤥�塞 ������
;--------------------------------------------------------------------------------------------------------
 	xchg	eax,edi
 	pop		eax
 	lea		ecx,dword ptr [esp-04]

 	push	0 
 	push	ecx
 	push	eax
 	push	edi
 	push	ebx
 	call	ReadFile													;�⠥� 䠩� � �뤥������ ������

 	push	ebx
 	call	CloseHandle													;����뢠�� ���

  	xchg	eax,edi														;EAX - ���� � �����
  	pop		ecx															;ECX - ࠧ��� 䠩��  
  	pop		edi
  	pop		esi
  	pop		ebx     
_ret_xrf_: 
	ret
xReadFile endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 xReadFile
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪� xWriteFile
;ᮧ����� 䠩�� � ������ � 䠩� ������
;�室:
;	szFileName - ���� � 䠩��;
;	pMem	   - ���� ������ � �����, ����� ���� ������� � 䠩�
;	DataSize   - ࠧ��� ��� ������
;��室:
;	(+)
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xWriteFile proc szFileName:DWORD, pMem:DWORD, DataSize:DWORD  
	push	0
	push	FILE_ATTRIBUTE_NORMAL 
	push	CREATE_ALWAYS 
	push	0
	push	FILE_SHARE_READ + FILE_SHARE_WRITE
	push	GENERIC_READ + GENERIC_WRITE
	push	szFileName
	call	CreateFile													;ᮧ���� 䠩�

	inc		eax
	je		_ret_xwf_
	dec		eax
	push	ebx
	push	edi 
	xchg	eax,ebx 
 	lea		ecx,dword ptr [esp-04]
;--------------------------------------------------------------------------------------------------------
 	push	0    
 	push	ecx
 	push	DataSize 
 	push	pMem
 	push	ebx
 	call	WriteFile													;��襬 � ���� 

 	push	ebx
 	call	CloseHandle													;� ����뢠�� ����� ���㦭� ��� 

  	xchg	eax,edi
  	pop		edi
  	pop		ebx
_ret_xwf_: 
	ret
xWriteFile endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 xWriteFile 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx




	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪�� CheckRich
;�஢�ઠ rich-ᨣ������ �� "�ࠢ��쭮���"
;�室:
;	pMem - ���� � �����, ��� �ᯮ������ rich-signature
;��室:
;	1    - �᫨ rich-signature "�ࠢ��쭠�", ���� 0
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
CheckRich proc pMem:DWORD
	xor		eax,eax 
	pushad
	mov		esi,pMem
	xor		edi,edi
	xchg	edi,dword ptr [esi+3Ch]										;��࠭塞 ���� e_lfanew, � �� ��� ���� ��襬 0
	mov		eax,80h														;ࠧ��� �������� IMAGE_DOS_HEADER + DOS Stub 
	mov		ebx,eax 
	xor		ecx,ecx
;--------------------------------------------------------------------------------------------------------
_check_mzhdr_:      
	movzx	edx,byte ptr [esi+ecx]
	rol		edx,cl
	add		ebx,edx
	inc		ecx
	cmp		ecx,eax
	jne		_check_mzhdr_
;--------------------------------------------------------------------------------------------------------
	xchg	edi,dword ptr [esi+3Ch]										;�஢��塞 ���᫥���� ������ ��ࠧ�� �㬬� ���� ��-��������� � ���-�⠡� � ����� �᫮�
	cmp		ebx,0884F3421h												;�᫨ ࠢ��, � �� � ���浪� 
	jne		_fuck_rich_
	add		esi,80h														;��६�頥��� �� ᠬ� rich-ᨣ������
	mov		eax,dword ptr [esi+04]										;�஢�ਬ 1-� ���� �� 'DanS'
	xor		eax,dword ptr [esi]
	xor		eax,0AA559966h
	cmp		eax,0F93BF822h												;�᫨ �� ��, � �������� ����� 
	jne		_fuck_rich_
	mov		eax,dword ptr [esi+08]										;2-�� dword - �� xor-��᪠; � 3-�� dword - �� ������ ���� � �� ᠬ�� xor-mask
	xor		eax,dword ptr [esi+0Ch]
	jne		_fuck_rich_
	xor		ecx,ecx 
;--------------------------------------------------------------------------------------------------------
_search_rich_: 
	cmp		dword ptr [esi+ecx*4],'hciR' 								;��᫥ �饬 ᫮�� 'Rich'
	je		_ok_rich_
	inc		ecx
	cmp		ecx, 4 * 10													;������ ���祭�� ����� 㬥�����/㢥�����;   
	jne		_search_rich_  
	jmp		_fuck_rich_													;�᫨ ��-ᨣ�� �� ������� � �������� ��ࢠ��, � �� ��室;  
;--------------------------------------------------------------------------------------------------------
_ok_rich_: 
	inc		ecx 	
	mov		edi,dword ptr [esi+04]										;��࠭塞 xor-mask � edi 
	push	08															;� ����塞, ᪮�쪮 蠣�� �� 8 ���� �� ᫮�� 'Rich'
	pop		eax
	imul	ecx,4
	add		esi,eax 
	sub		ecx,eax          
	xchg	eax,ecx
	xor		edx,edx 
	div		ecx
	push	00h
;--------------------------------------------------------------------------------------------------------
_check_rich_:															;��⥬, � 横�� ⠪�� ����塞 ������ ��ࠧ�� �㬬� ���� rich-signature,    
	mov		edx,dword ptr [esi]											;᪫��뢠� �� � ࠭�� ����祭��� ��㣮� �㬬�� (�. ���)
	xor		edx,edi
	cmp		edx,MAGIC_NUMBER ;10000h									;����� ᤥ���� ����� ����७��� �஢��� �� ���-�� �⮣� �᫠ � ��-ᨣ��: �᫨ ����� 1, � ��; 
	jne		_nmn1_
	add		dword ptr [esp],edx 	 
_nmn1_:
	mov		ecx,dword ptr [esi+04] 
	xor		ecx,edi
	rol		edx,cl
	add		ebx,edx 
	add		esi,08 
	dec		eax
	jne		_check_rich_
	pop		edx
	;cmp		edx,MAGIC_NUMBER ;10000h 
	;jne		_fuck_rich_  
	cmp		ebx,edi														;� �஢��塞 ����祭��� ����� �㬬� � �᫮� (xor-��᪮�)
	jne		_fuck_rich_													;�᫨ ࠢ��, � �� ��
	cmp		ebx,dword ptr [esi+04]										;� �஢��塞 ��� �� �㬬� � �᫮�, �ᯮ������� ��᫥ ᫮�� 'Rich' (�� ������ ���� ⠦� xor-mask)
	jne		_fuck_rich_													;�᫨ �� ����� ࠢ��, � �� ��  
	inc		dword ptr [esp+1Ch]											;rich-signature = "correct" =)! (�� ������� ����� �������� �஢��� �� �㫨, ���ਬ��, �� ��⭮��� 8, �� �� ���� ����易⥫쭮);   	  	  
_fuck_rich_:
	popad 
_ret_cr_:  
	ret
CheckRich endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� CheckRich
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;function GetRndCID
;����祭�� �������� �᫠ �� ���ᨢ� comp_id
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
GetRndCID:
	push	ecx
	push	52 ;56 
	call	RANG32														;����砥� ��砩��� �᫮ � ��������� [0..51]

	lea		ecx,comp_id
	mov		eax,dword ptr [ecx+eax*4]									;����砥� ���� �� ���ᨢ� comp_id  
	pop		ecx
	ret
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 GetRndCID
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
  



 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;function ChangeRich
;�������� ������ � rich-signature
;�室:
;	pMem - ���� � �����, ��� �ᯮ������ rich-signature
;��室:
;	1    - �᫨ �������� ��諠 �ᯥ譮, ���� 0
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
ChangeRich proc pMem:DWORD
	xor		eax,eax
	pushad
	mov		esi,pMem 

	push	esi
	call	CheckRich													;�஢�ਬ rich-ᨣ������ �� 楫��⭮���
;--------------------------------------------------------------------------------------------------------
	test	eax,eax
	je		_f_r_   	  
	add		esi,80h														;�᫨ �� �⫨筮, � ��३��� �� ᠬ� ��-ᨣ��
	xor		ecx,ecx
	push	esi
;--------------------------------------------------------------------------------------------------------
_s_r_:
	cmp		dword ptr [esi+ecx*4],'hciR'								;������ ᫮�� 'Rich'
	je		_k_r_
	inc		ecx
	jmp		_s_r_
;--------------------------------------------------------------------------------------------------------
_k_r_:
	inc		ecx
	imul	ecx,4 
	sub		ecx,14h
	push	8
	pop		eax
	xchg	eax,ecx
	xor		edx,edx
	div		ecx															;����稬 ���-�� 蠣�� (�� 8 ���� �����) �� ᫮�� 'Rich'
	mov		edi,dword ptr [esi+04]										;edi = 2-�� ���� � ��-ᨣ�� (xor-mask) 
	add		esi,10h														;�ய��⨬ ���� 4 ���ठ
	xchg	eax,ecx
	mov		ebx,0884F3421h 
	push	ecx
	push	esi 
;--------------------------------------------------------------------------------------------------------
_c_chg_: 	
	xor		dword ptr [esi],edi											;� �����, � 横�� ᭠砫� ���ਬ ���� ���� �� 2-� ���म�  
	;xor		dword ptr [esi+04],edi
	
	push	255 ;31
	call	RANG32

	inc		eax	 
	mov		dword ptr [esi+04],eax										;2-�� ���� ����� ᬥ�� �������� �� �᫮ [1..255]   
	cmp		dword ptr [esi],MAGIC_NUMBER ;10000h						;�᫨ 1-� ���� ࠢ�� 0x10000 - � ��⠢�� �� �᫮ (��� ��易⥫쭮 ������ ���� � ��-ᨣ��: ��室� ⮫쪮 ��� msvc, ��� masm etc - ����易⥫쭮, ���������)  
	je		_no_chg_

	call	GetRndCID													;���� ����稬 ࠭����� �᫮ �� ���ᨢ� comp_id 
	     
	mov		dword ptr [esi],eax											;� ��࠭�� ��� � 1-�� ���थ
_no_chg_: 
_nxt_chg_:																;����� �� ������뢠�� ������ ᯮᮡ�� �㬬� ��� ���म� (+ �᫮ 0884F3421h) 
	mov		edx,dword ptr [esi]
	push	ecx
	mov		ecx,dword ptr [esi+04]
	rol		edx,cl 
	add		ebx,edx 
	pop		ecx
	add		esi,8 
	loop	_c_chg_														;� �⮣� � ebx - �������� ����� xor-��᪠
;--------------------------------------------------------------------------------------------------------
	pop		esi 
	pop		ecx
	pop		edx 
	mov		eax,ebx
	xor		eax,0AA559966h
	xor		eax,0F93BF822h
	mov		dword ptr [edx],eax											;� ᠬ� 1-� ���� ��-ᨣ�� ����襬 ����祭��� � eax �᫮ 
	mov		dword ptr [edx+04],ebx										;� ��⠫�� 3 ���ठ ����襬 ����祭��� � ebx xor-mask
	mov		dword ptr [edx+08],ebx
	mov		dword ptr [edx+12],ebx
;--------------------------------------------------------------------------------------------------------
_xor_mask_: 
	xor		dword ptr [esi],ebx											;� ��⥬ ����ਬ ��������� ����� ����� xor-��᪮�
	xor		dword ptr [esi+04],ebx
	add		esi,8 
	loop	_xor_mask_
;-------------------------------------------------------------------------------------------------------- 
	mov		dword ptr [esi+04],ebx										;�� ��, ��� 
	inc		dword ptr [esp+1Ch]        	  
_f_r_:
	popad 
_ret_chr_:
	ret
ChangeRich endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� ChangeRich 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 

 


  
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪� GenRich
;������� ������ "�ࠢ��쭮�" ��-ᨣ��
;�室:
;	pMem - ���� � �����, ��� ᣥ����� ��-ᨣ��
;��室:
;	�����頥� ����, ����� �� ��।�� � ��ࠬ��� �㭪�, �� �᫨ �� �ந��諠 �����-�0 �㩭�, � 0 
;����⪨:
;	�� �㭪� �������� ������� ��-ᨣ��:
;	1) ࠧ���� ࠧ��� (��⭮�� 8)
;	2) � ࠧ�묨 ����묨 
;	3) ᠬ�-ᮡ�� � ࠧ��� xor-mask'��
;	4) � ��ﬨ � ���� (�� ���-�� ⠪�� ��⭮ 8)
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
GenRich proc pMem:DWORD
	xor		eax,eax 
	pushad
	lea		esi,mzhdr_dosstub
	mov		edi,pMem
	mov		ecx,size_md
	cld
	rep		movsb														;᭠砫� ����襬 �������� IMAGE_DOS_HEADER & DOS Stub 
;--------------------------------------------------------------------------------------------------------
	push	edi															;��࠭�� ���� ��砫� ��-ᨣ�� 
	add		edi,10h 													;� �ய��� ���� 0x10 ���⮢

	push	6 															;ᣥ���㥬 �᫮  [0..5]
	call	RANG32

	add		eax,5														;� �ਡ���� ����. ����� ��ࠧ�� ��� ��-ᨣ�� �㤥� ����� � ��������� [0xC0..0xF8] ���⮢
   	push	eax 
   	xchg	eax,ebx
   	lea		ecx,dword ptr [ebx-01]

   	push	ecx
	call	RANG32														;����� ��।���� ��砩�� ��ࠧ��, ��� (���� ࠧ) � ��-ᨣ�� ���� ������� �᫮ 0x10000 

	inc		eax
	xchg	eax,ecx  
   	mov		esi,0884F3421h   
;--------------------------------------------------------------------------------------------------------
_gen_elem_: 
   	call	GetRndCID													;� ��稭��� �����஢��� ����� ��� ��襩 ��-ᨣ�� 

	push	ecx
	cmp		ecx,ebx
	jne		_n_eq1_ 
	mov		eax,MAGIC_NUMBER ;10000h									;�᫨ ⥪��� ������ � ��-ᨣ�� ᮢ������ � ࠭�� ��࠭�� ��砩�� ���⮬ � ��-ᨣ��, � ����襬 ����� �᫮ 0x10000          
_n_eq1_: 																;���� ����襬 �᫮, ��࠭�� ������ �� ���ᨢ� comp_id
   	mov		edx,eax
   	stosd

	push	255 ;31
	call	RANG32														;����� ᣥ��ਬ �᫮ � ��������� [1..255]

	inc		eax
	mov		ecx,eax 
	stosd																;� ����襬 ���
	rol		edx,cl														;�� ��� ����塞 ������ ��ࠧ�� xor-mask (in esi)
	pop		ecx 
	add		esi,edx   
 	dec		ebx
 	jne		_gen_elem_
;--------------------------------------------------------------------------------------------------------
 	pop		ecx
 	pop		edi 
 	mov		eax,esi
 	xor		eax,0AA559966h 
 	xor		eax,0F93BF822h
 	stosd																;��⥬, � 1-� ���� ��-ᨣ�� ����襬 'DanS' XOR xor-mask
 	xchg	eax,esi
 	stosd																;� ᫥���騥 3 dword'a - ����襬 xor-mask
 	stosd
 	stosd
;--------------------------------------------------------------------------------------------------------
_xor_msk_:																;� � 横�� ����ਬ ����� �� ���-���� 
 	xor		dword ptr [edi],eax
 	xor		dword ptr [edi+04],eax
 	add		edi,8
 	loop	_xor_msk_
;-------------------------------------------------------------------------------------------------------- 
	mov		dword ptr [edi],'hciR'										;�ࠧ� ��᫥ ������ ����襬 'Rich'
 	add		edi,4
 	stosd																;� xor-mask 

    push	2 
    call	RANG32														;⠪�� �뢠��, �� ��᫥ ᫮�� 'Rich' � ���饩 �� ��� xor-��᪨ 
    inc		eax 

    shl		eax,1	 													;���� �� � �㫨, ���-�� �� ��⭮ ���쬨 (8). �����ਬ � �� �� �㫨�� =) (����� �������� ���, �⮡� �㫨 ��易⥫쭮 ����ਫ���);    
    xchg	eax,ecx
    rep		stosd 														;� ����襬 �� 
    mov		ebx,pMem													;���᫨� ࠧ��� ⮫쪮 �� ᣥ���஢����� ��-ᨣ��
   	sub		edi,ebx
   	mov		dword ptr [ebx+3Ch],edi										;� (��� ����), ����襬 ��� � ���� e_lfanew (�� ᬥ饭�� 0x3C)   

    push	ebx
    call	CheckRich													;�஢�ਬ, �ࠢ��쭠� �� ����稫��� � ��� ��-ᨣ��? 
    
    test	eax,eax
    je		_fuck_gr_													;�᫨ ��, � �� �⫨筮 )
    push	ebx
    pop		dword ptr [esp+1Ch]											;EAX - ���� � �����, ��� ����� ᣥ���஢����� ��-ᨣ��   
_fuck_gr_:     
	popad																;
_ret_gr_: 
	ret																	;�� ��室 
GenRich endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� GenRich 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	 




;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;												xxxx
;												xxxx
;												xxxx
;												xxxx
;												xxxx
;
;												xxxx
;												xxxx 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  
start:
	push	offset szPath1
	call	xReadFile													;��஥� 䠩� �� �⥭��, �뤥��� ������ � ᪮���㥬 䠩� �㤠
																		; 
	push	eax 
	push	eax 
	push	ecx 
	push	eax
	push	eax  

	push	eax       
	call	CheckRich													;�஢�ઠ ��-ᨣ�� �� 楫��⭮��� 

	test	eax,eax  
	je		_r_no1_
	lea		eax,szCheckROk
	jmp		_r_ok1_ 
_r_no1_:
	lea		eax,szCheckRNo
_r_ok1_: 	 
_01_:
	push	0
	push	eax
	push	eax
	push	0
	call	MessageBox
;--------------------------------------------------------------------------------------------------------
	call	ChangeRich													;�������� ��-ᨣ��

	test	eax,eax
	je		_r_no2_

	push	offset szPath2
	call	xWriteFile													;�����뢠�� 䠩� ����� � ����������� ��-ᨣ���

	lea		eax,szChangeROk
	jmp		_r_ok2_
_r_no2_:
	add		esp,8 
	lea		eax,szChangeRNo 
_r_ok2_:
_02_:
	push	0
	push	eax
	push	eax
	push	0
	call	MessageBox
;--------------------------------------------------------------------------------------------------------	
	call	GenRich														;������㥬 � ��� ��-ᨣ�� 

	test	eax,eax
	je		_r_no3_
	
	push	dword ptr [eax+3Ch]
	push	eax
	push	offset szPath3
	call	xWriteFile													;�����뢠�� ��-ᨣ�� � 䠩�

	lea		eax,szGenROk     
	jmp		_r_ok3_
_r_no3_:
	lea		eax,szGenRNo
_r_ok3_:
_03_:
	push	0
	push	eax
	push	eax
	push	0
	call	MessageBox 
	
	call	GlobalFree

	ret
end start