/***************************************************************************************************\
*																									*
*									DIZAHEX DISASSEMBLER ENGINE										*
*																									*
*											  EXAMPLE												*
*																									*
\***************************************************************************************************/



																			//pr0mix
																			//вирмэйкинг для себя - искусство вечно



#include <stdio.h>
#include <stdlib.h>
#include "dizahex.h"





int main()
{
	DIZAHEX_STRUCT dhs;
	uint8_t code_disasm[] = {0xBF, 0x11, 0x22, 0x33, 0x44, 0x55}; 
	uint8_t *code_asm;
	int i, len = 0; 
	
	dhs.mode = DISASM_MODE_32; 
//	dhs.mode = DISASM_MODE_64;

	len = dizahex_disasm(code_disasm, &dhs); 

	if(!len)
	{
		printf("ERROR: len = 0\n");
		return 0;
	}

	printf("len = %X\n\n", len); 
	printf("============DIZAHEX_STRUCT BEG============\n");
	printf("flags = %X\n", dhs.flags); 
	printf("len = %X\n", dhs.len); 
	printf("pfx_66 = %X\n", dhs.pfx_66); 
	printf("pfx_67 = %X\n", dhs.pfx_67); 
	printf("pfx_seg = %X\n", dhs.pfx_seg);
	printf("pfx_rep = %X\n", dhs.pfx_rep); 
	printf("pfx_lock = %X\n", dhs.pfx_lock); 
	printf("pfx_rex = %X\n", dhs.pfx_rex); 
	printf("opcode = %X\n", dhs.opcode); 
	printf("opcode_2 = %X\n", dhs.opcode_2); 
	printf("modrm = %X\n", dhs.modrm); 
	printf("sib = %X\n", dhs.sib); 
	printf("disp_8 = %X\n", dhs.disp.disp_8); 
	printf("disp_16 = %X\n", dhs.disp.disp_16); 
	printf("disp_32 = %X\n", dhs.disp.disp_32);
	printf("imm_8 = %X\n", dhs.imm.imm_8); 
	printf("imm_16 = %X\n", dhs.imm.imm_16); 
	printf("imm_32 = %X\n", dhs.imm.imm_32);
	printf("imm_64 = %llX\n", dhs.imm.imm_64);
	printf("============DIZAHEX_STRUCT END============\n\n");

	code_asm = (uint8_t *)malloc(sizeof(uint8_t) * len + sizeof(uint8_t)); 

	if(!code_asm)
	{
		printf("ERROR: code_asm = 0\n");
		return 0;
	}

	for(i = 0; i < len; i++)
		code_asm[i] = 0;

	printf("============code_asm [1] beg============\n");

	for(i = 0; i < len; i++)
		printf("code_asm[%d] = %X\n", i, code_asm[i]);

	printf("============code_asm [1] end============\n\n");

	len = dizahex_asm(code_asm, &dhs); 

	printf("============code_asm [2] beg============\n");

	for(i = 0; i < len; i++)
		printf("code_asm[%d] = %X\n", i, code_asm[i]); 

	printf("============code_asm [2] beg============\n"); 

	return 0;
}