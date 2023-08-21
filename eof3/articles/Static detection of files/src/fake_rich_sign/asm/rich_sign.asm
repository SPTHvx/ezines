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

MAGIC_NUMBER	equ	10000h												;данное число есть походу только в файлах, собранных на msvc (VC++ (6)). На masm etc - такого числа видимо нет;  
                     

comp_id			dd  00021C6Ah, 00041F6Fh, 00041FE8h, 000420FFh			;эти данные были взяты из расксоренных рич-сигнатур различных PE-файлов, собранных в VC ++ (6); 
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

include		rang32.asm													;подключаем собственный ГСЧ  

;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;функа xReadFile
;чтение файла в память
;Вход:
;	szFileName - путь к файлу
;Выход:
;	EAX		   - адрес в памяти, куда скопирован файл (либо 0)
;	ECX		   - размер файла
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xReadFile proc szFileName:DWORD
	push	0
	push	FILE_ATTRIBUTE_NORMAL 
	push	OPEN_EXISTING
	push	0
	push	FILE_SHARE_READ + FILE_SHARE_WRITE 
	push	GENERIC_READ
	push	szFileName
	call	CreateFile													;открываем файл на чтение

	inc		eax
	je		_ret_xrf_													;удачно?
	dec		eax
	push	ebx
	push	esi
	push	edi 
	xor		esi,esi
	xchg	eax,ebx
;--------------------------------------------------------------------------------------------------------
	push	esi
	push	ebx
	call	GetFileSize													;получаем размер файла

	push	eax
	push	eax  
;--------------------------------------------------------------------------------------------------------
	push	eax
	push	0
	call	GlobalAlloc													;выделяем память
;--------------------------------------------------------------------------------------------------------
 	xchg	eax,edi
 	pop		eax
 	lea		ecx,dword ptr [esp-04]

 	push	0 
 	push	ecx
 	push	eax
 	push	edi
 	push	ebx
 	call	ReadFile													;читаем файл в выделенную память

 	push	ebx
 	call	CloseHandle													;закрываем хэндл

  	xchg	eax,edi														;EAX - адрес в памяти
  	pop		ecx															;ECX - размер файла  
  	pop		edi
  	pop		esi
  	pop		ebx     
_ret_xrf_: 
	ret
xReadFile endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;конец функции xReadFile
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;функа xWriteFile
;создание файла и запись в файл данных
;Вход:
;	szFileName - путь к файлу;
;	pMem	   - адрес данных в памяти, которые надо записать в файл
;	DataSize   - размер этих данных
;Выход:
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
	call	CreateFile													;создаем файл

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
 	call	WriteFile													;пишем в него 

 	push	ebx
 	call	CloseHandle													;и закрываем больше ненужный хэндл 

  	xchg	eax,edi
  	pop		edi
  	pop		ebx
_ret_xwf_: 
	ret
xWriteFile endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;конец функции xWriteFile 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx




	
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;функция CheckRich
;проверка rich-сигнатуры на "правильность"
;Вход:
;	pMem - адрес в памяти, где расположена rich-signature
;Выход:
;	1    - если rich-signature "правильная", иначе 0
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
CheckRich proc pMem:DWORD
	xor		eax,eax 
	pushad
	mov		esi,pMem
	xor		edi,edi
	xchg	edi,dword ptr [esi+3Ch]										;сохраняем поле e_lfanew, а на его место пишем 0
	mov		eax,80h														;размер структуры IMAGE_DOS_HEADER + DOS Stub 
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
	xchg	edi,dword ptr [esi+3Ch]										;проверяем вычисленную нихитрым образом сумму байт мз-заголовка и дос-стаба с данным числом
	cmp		ebx,0884F3421h												;если равны, то все в порядке 
	jne		_fuck_rich_
	add		esi,80h														;перемещаемся на саму rich-сигнатуру
	mov		eax,dword ptr [esi+04]										;проверим 1-ый дворд на 'DanS'
	xor		eax,dword ptr [esi]
	xor		eax,0AA559966h
	cmp		eax,0F93BF822h												;если все ок, то движемся дальше 
	jne		_fuck_rich_
	mov		eax,dword ptr [esi+08]										;2-ой dword - это xor-маска; и 3-ий dword - это должна быть та же самая xor-mask
	xor		eax,dword ptr [esi+0Ch]
	jne		_fuck_rich_
	xor		ecx,ecx 
;--------------------------------------------------------------------------------------------------------
_search_rich_: 
	cmp		dword ptr [esi+ecx*4],'hciR' 								;после ищем слово 'Rich'
	je		_ok_rich_
	inc		ecx
	cmp		ecx, 4 * 10													;данное значение можно уменьшить/увеличить;   
	jne		_search_rich_  
	jmp		_fuck_rich_													;если рич-сигна не найдена в заданном итервале, то на выход;  
;--------------------------------------------------------------------------------------------------------
_ok_rich_: 
	inc		ecx 	
	mov		edi,dword ptr [esi+04]										;сохраняем xor-mask в edi 
	push	08															;и вычисляем, сколько шагов по 8 байт до слова 'Rich'
	pop		eax
	imul	ecx,4
	add		esi,eax 
	sub		ecx,eax          
	xchg	eax,ecx
	xor		edx,edx 
	div		ecx
	push	00h
;--------------------------------------------------------------------------------------------------------
_check_rich_:															;затем, в цикле также вычисляем нихитрым образом сумму байт rich-signature,    
	mov		edx,dword ptr [esi]											;складывая ее с ранее полученной другой суммой (см. выше)
	xor		edx,edi
	cmp		edx,MAGIC_NUMBER ;10000h									;можно сделать более изощренную проверку на кол-во этого числа в рич-сигне: если больше 1, то фэйк; 
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
	cmp		ebx,edi														;и проверяем полученную общую сумму с числом (xor-маской)
	jne		_fuck_rich_													;если равны, то все ок
	cmp		ebx,dword ptr [esi+04]										;и проверяем эту же сумму с числом, расположенным после слова 'Rich' (это должна быть таже xor-mask)
	jne		_fuck_rich_													;если эти дворды равны, то все ок  
	inc		dword ptr [esp+1Ch]											;rich-signature = "correct" =)! (при желании можно добавить проверку на нули, например, на кратность 8, но это пока необязательно);   	  	  
_fuck_rich_:
	popad 
_ret_cr_:  
	ret
CheckRich endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;конец функи CheckRich
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 





;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;function GetRndCID
;получение рэндомного числа из массива comp_id
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
GetRndCID:
	push	ecx
	push	52 ;56 
	call	RANG32														;получаем случайное число в диапазоне [0..51]

	lea		ecx,comp_id
	mov		eax,dword ptr [ecx+eax*4]									;получаем дворд из массива comp_id  
	pop		ecx
	ret
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;конец функции GetRndCID
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
  



 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;function ChangeRich
;подделка данных в rich-signature
;Вход:
;	pMem - адрес в памяти, где расположена rich-signature
;Выход:
;	1    - если подделка прошла успешно, иначе 0
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
ChangeRich proc pMem:DWORD
	xor		eax,eax
	pushad
	mov		esi,pMem 

	push	esi
	call	CheckRich													;проверим rich-сигнатуру на целостность
;--------------------------------------------------------------------------------------------------------
	test	eax,eax
	je		_f_r_   	  
	add		esi,80h														;если все отлично, то перейдем на саму рич-сигну
	xor		ecx,ecx
	push	esi
;--------------------------------------------------------------------------------------------------------
_s_r_:
	cmp		dword ptr [esi+ecx*4],'hciR'								;найдем слово 'Rich'
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
	div		ecx															;получим кол-во шагов (по 8 байт каждый) до слова 'Rich'
	mov		edi,dword ptr [esi+04]										;edi = 2-ой дворд в рич-сигне (xor-mask) 
	add		esi,10h														;пропустим первые 4 дворда
	xchg	eax,ecx
	mov		ebx,0884F3421h 
	push	ecx
	push	esi 
;--------------------------------------------------------------------------------------------------------
_c_chg_: 	
	xor		dword ptr [esi],edi											;и далее, в цикле сначала расксорим первый дворд из 2-х двордов  
	;xor		dword ptr [esi+04],edi
	
	push	255 ;31
	call	RANG32

	inc		eax	 
	mov		dword ptr [esi+04],eax										;2-ой дворд можем смело заменить на число [1..255]   
	cmp		dword ptr [esi],MAGIC_NUMBER ;10000h						;если 1-ый дворд равен 0x10000 - то оставим это число (оно обязательно должно быть в рич-сигне: походу только для msvc, для masm etc - необязательно, отсутствует)  
	je		_no_chg_

	call	GetRndCID													;иначе получим рандомом число из массива comp_id 
	     
	mov		dword ptr [esi],eax											;и сохраним его в 1-ом дворде
_no_chg_: 
_nxt_chg_:																;здесь же подсчитываем нихитрым способом сумму этих двордов (+ число 0884F3421h) 
	mov		edx,dword ptr [esi]
	push	ecx
	mov		ecx,dword ptr [esi+04]
	rol		edx,cl 
	add		ebx,edx 
	pop		ecx
	add		esi,8 
	loop	_c_chg_														;в итоге в ebx - получится новая xor-маска
;--------------------------------------------------------------------------------------------------------
	pop		esi 
	pop		ecx
	pop		edx 
	mov		eax,ebx
	xor		eax,0AA559966h
	xor		eax,0F93BF822h
	mov		dword ptr [edx],eax											;в самый 1-ый дворд рич-сигны запишем полученное в eax число 
	mov		dword ptr [edx+04],ebx										;в остальные 3 дворда запишем полученную в ebx xor-mask
	mov		dword ptr [edx+08],ebx
	mov		dword ptr [edx+12],ebx
;--------------------------------------------------------------------------------------------------------
_xor_mask_: 
	xor		dword ptr [esi],ebx											;и затем поксорим измененные данные новой xor-маской
	xor		dword ptr [esi+04],ebx
	add		esi,8 
	loop	_xor_mask_
;-------------------------------------------------------------------------------------------------------- 
	mov		dword ptr [esi+04],ebx										;это все, блё 
	inc		dword ptr [esp+1Ch]        	  
_f_r_:
	popad 
_ret_chr_:
	ret
ChangeRich endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;конец функи ChangeRich 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 

 


  
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;функа GenRich
;генерация фэйковой "правильной" рич-сигны
;Вход:
;	pMem - адрес в памяти, где сгенерить рич-сигну
;Выход:
;	возвращает адрес, который был передан в параметре функи, но если же произошла какая-т0 хуйня, то 0 
;Заметки:
;	эта функа позволяет генерить рич-сигну:
;	1) разного размера (кратного 8)
;	2) с разными данными 
;	3) само-собой с разной xor-mask'ой
;	4) с нулями в конце (их кол-во также кратно 8)
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
GenRich proc pMem:DWORD
	xor		eax,eax 
	pushad
	lea		esi,mzhdr_dosstub
	mov		edi,pMem
	mov		ecx,size_md
	cld
	rep		movsb														;сначала запишем структуру IMAGE_DOS_HEADER & DOS Stub 
;--------------------------------------------------------------------------------------------------------
	push	edi															;сохраним адрес начала рич-сигны 
	add		edi,10h 													;и пропусти первые 0x10 байтов

	push	6 															;сгенериуем число  [0..5]
	call	RANG32

	add		eax,5														;и прибавим пять. Таким образом наша рич-сигна будет весить в диапазоне [0xC0..0xF8] байтов
   	push	eax 
   	xchg	eax,ebx
   	lea		ecx,dword ptr [ebx-01]

   	push	ecx
	call	RANG32														;далее определим случайным образом, где (один раз) в рич-сигне надо записать число 0x10000 

	inc		eax
	xchg	eax,ecx  
   	mov		esi,0884F3421h   
;--------------------------------------------------------------------------------------------------------
_gen_elem_: 
   	call	GetRndCID													;и начинаем генерировать данные для нашей рич-сигны 

	push	ecx
	cmp		ecx,ebx
	jne		_n_eq1_ 
	mov		eax,MAGIC_NUMBER ;10000h									;если текущая позиция в рич-сигне совпадает с ранее выбранным случайным местом в рич-сигне, то запишем здесь число 0x10000          
_n_eq1_: 																;иначе запишем число, выбранным рэндомом из массива comp_id
   	mov		edx,eax
   	stosd

	push	255 ;31
	call	RANG32														;далее сгенерим число в диапазоне [1..255]

	inc		eax
	mov		ecx,eax 
	stosd																;и запишем его
	rol		edx,cl														;по пути вычисляем нехитрым образом xor-mask (in esi)
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
 	stosd																;затем, в 1-ый дворд рич-сигны запишем 'DanS' XOR xor-mask
 	xchg	eax,esi
 	stosd																;в следующие 3 dword'a - запишем xor-mask
 	stosd
 	stosd
;--------------------------------------------------------------------------------------------------------
_xor_msk_:																;и в цикле поксорим данные на ксор-маску 
 	xor		dword ptr [edi],eax
 	xor		dword ptr [edi+04],eax
 	add		edi,8
 	loop	_xor_msk_
;-------------------------------------------------------------------------------------------------------- 
	mov		dword ptr [edi],'hciR'										;сразу после данных запишем 'Rich'
 	add		edi,4
 	stosd																;и xor-mask 

    push	2 
    call	RANG32														;также бывает, что после слова 'Rich' и идущей за ним xor-маски 
    inc		eax 

    shl		eax,1	 													;есть еще и нули, кол-во их кратно восьми (8). Сгенерим и мы эти нулики =) (можно добавить код, чтобы нули обязательно генерились);    
    xchg	eax,ecx
    rep		stosd 														;и запишем их 
    mov		ebx,pMem													;вычислим размер только что сгенерированной рич-сигны
   	sub		edi,ebx
   	mov		dword ptr [ebx+3Ch],edi										;и (как надо), запишем его в поле e_lfanew (по смещению 0x3C)   

    push	ebx
    call	CheckRich													;проверим, правильная ли получилась у нас рич-сигна? 
    
    test	eax,eax
    je		_fuck_gr_													;если да, то все отлично )
    push	ebx
    pop		dword ptr [esp+1Ch]											;EAX - адрес в памяти, где лежит сгенерированная рич-сигна   
_fuck_gr_:     
	popad																;
_ret_gr_: 
	ret																	;на выход 
GenRich endp
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;конец функи GenRich 
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
	call	xReadFile													;откроем файл на чтение, выделим память и скопируем файл туда
																		; 
	push	eax 
	push	eax 
	push	ecx 
	push	eax
	push	eax  

	push	eax       
	call	CheckRich													;проверка рич-сигны на целостность 

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
	call	ChangeRich													;подделка рич-сигны

	test	eax,eax
	je		_r_no2_

	push	offset szPath2
	call	xWriteFile													;записываем файл вместе с подделанной рич-сигной

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
	call	GenRich														;генерируем с нуля рич-сигну 

	test	eax,eax
	je		_r_no3_
	
	push	dword ptr [eax+3Ch]
	push	eax
	push	offset szPath3
	call	xWriteFile													;записываем рич-сигну в файл

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