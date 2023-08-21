;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;                                                                                                   
;                                                                                                      	 ;
;                                                                                                    	 ;
;      xxxxxxxxxxx      xxxxxxxx     xxxx    xxxx     xxxxxxxxxx          xxxxxxxx      xxxxxxxxx        ;  
;      xxxxxxxxxxxx    xxxx  xxxx    xxxx    xxxx    xxxxxxxxxxx         xxxxxxxxxx    xxxxxxxxxxx       ; 
;      xxxx    xxxx   xxxx    xxxx   xxxxx   xxxx   xxxx    xxxx         xxx    xxxx   xxx    xxxx       ;    
;      xxxx    xxxx   xxxx    xxxx   xxxxxx  xxxx   xxxx                        xxxx          xxxx       ;   
;      xxxx    xxxx   xxxx    xxxx   xxxxxxx xxxx   xxxx                   xxxxxxxx     xxxxxxxxxx       ;   
;      xxxxxxxxxxx    xxxx xx xxxx   xxxx xxxxxxx   xxxx                   xxxxxxxx    xxxxxxxxxx        ;  
;      xxxxxxxxxxxx   xxxx xx xxxx   xxxx  xxxxxx   xxxx   xxxxx                xxxx   xxxx              ;     
;      xxxx    xxxx   xxxx    xxxx   xxxx   xxxxx   xxxx    xxxx                xxxx   xxxx    xxx       ;   
;      xxxx    xxxx   xxxx    xxxx   xxxx    xxxx    xxxxxxxxxxx         xxxxxxxxxx    xxxxxxxxxxx       ;   
;      xxxx    xxxx   xxxx    xxxx   xxxx    xxxx     xxxxxxxxxx         xxxxxxxxx     xxxxxxxxxxx       ;   
;																										 ;
;																										 ; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;																										 ;
;								RAndom Numbers Generator 											 	 ; 
;																										 ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;																										 ;
;										:)!																 ;
;																										 ; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;																										 ;
;									�㭪�� RANG32														 ;
;							  ��������� ��������� ����� (���)  											 ;
;																										 ;
;																										 ;
;����:																									 ;
;1 ��ࠬ��� - �᫮ (N). �㤥� �ந������ ���� ��砩���� �᫠ � ��������� [0..N-1] 					 ;
;--------------------------------------------------------------------------------------------------------;
;�����:																									 ;
;EAX - ����� �᫮ � ��������� [0..N-1]  															 ;
;																										 ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;         
;																										 ;
;										y0p!															 ;
;																										 ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;																										 ;
;									  	����															 ;
;																										 ;
;(+) ����������ᨬ����																					 ;
;(+) ���� � �ᯮ�짮�����																				 ;
;(+) �� �ᯮ���� WinApi'襪 																			 ;
;																										 ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
;																										 ;
;									�������������: 														 ;
;																										 ;
;1) ������祭��:																						 ;
;		rang32.asm																						 ;
;2) �맮� (�ਬ�� stdcall):																				 ;
;		push 5					;������ � ��� �᫮													 ;
;		call RANG32				;��뢠�� ��� -> � EAX ��᫥ �맮�� �㤥� ���祭�� [0..5-1]				 ;
;																										 ;
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;v1.0.1                                                                                                        



													;m1x
												;pr0mix@mail.ru
                                       		;EOF 
                                                                                                                                                                                          
                                                                                   

                                                                                                                                                   								                          
RANG32:                                                                            
	pushad										;��࠭塞 ॣ�����                                                                     
	mov		ecx,dword ptr [esp+24h]				;ecx=�᫮, �� ��।��� � ���
	db		0fh,31h      					             
	imul	eax,eax,1664525						;���� ࠧ�� ���᫥��� ��� ����祭��                                                   
	add		eax,1013904223						;����� ��砩���� �᫠ 
	add		eax,edx
	adc		eax,esp 
	rcr		eax,16                                  
	imul	eax,[esp+32] 
	xor		edx,edx 	
	mul		ecx									;mul ������� ��� div 
	mov		dword ptr [esp+1ch],edx                                            
	popad                                                                      
	ret		04
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
;����� �㭪樨 RANG32 																					       
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
