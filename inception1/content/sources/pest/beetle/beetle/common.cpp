#include <Windows.h>
#include <stdio.h>
#include "common.h"

#if _DEBUG
void m_wprintf(wchar_t *frm,...){
	  va_list list;
	  va_start(list, frm);
	  wchar_t *buf=(wchar_t*)m_malloc(1000*2+2);
	  if (!buf) return ;
	  _vsnwprintf(buf,1000,frm,list);
	  va_end(list);
	  WriteConsoleW(GetStdHandle(STD_OUTPUT_HANDLE),buf,wcslen(buf),0,0);
	  m_free(buf);
}

bool append_file(wchar_t *fname,wchar_t *s){
	bool r=false;
	if (!s) return r;
	int l=wcslen(s);
	if (!l) return r;
	HANDLE hf=CreateFileW(fname,GENERIC_WRITE,0,0,OPEN_ALWAYS,0,0);
	if (hf==INVALID_HANDLE_VALUE){
		return r;
	}
	SetFilePointer(hf,0,0,FILE_END);
	DWORD rw;
	r=WriteFile(hf,s,l*2,&rw,0);
	CloseHandle(hf);
	return r;
}
#endif

void *m_malloc(int size){
	return HeapAlloc(GetProcessHeap(),0,size);
}

void m_free(void *p){
	HeapFree(GetProcessHeap(),0,p);
}

void *m_realloc(void *p,int size){
	return HeapReAlloc(GetProcessHeap(),0,p,size);
}

bool load_file(wchar_t *fname,BLOCK *b){
	bool r=false;
	HANDLE hf=CreateFileW(fname,GENERIC_READ,0,0,OPEN_EXISTING,0,0);
	if (hf==INVALID_HANDLE_VALUE){
		return r;
	}
	b->size=GetFileSize(hf,0);
	if (!b->size){
		CloseHandle(hf);
		return r;
	}

	if (b->size>(1024*1024*100)){//MAX 100Mb
		CloseHandle(hf);
		return r;
	}

	b->data=(uint8*)m_malloc(b->size);
	if (!b->data){
		CloseHandle(hf);
		return r;
	}
	DWORD rw;
	r=ReadFile(hf,b->data,b->size,&rw,0);
	if (!r){
		m_free(b->data);
	}
	CloseHandle(hf);
	return r;
}

bool save_file(wchar_t *fname,BLOCK *b){
	bool r=false;
	if (!b->data || !b->size) return r;
	HANDLE hf=CreateFileW(fname,GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0);
	if (hf==INVALID_HANDLE_VALUE){
		return r;
	}
	DWORD rw;
	r=WriteFile(hf,b->data,b->size,&rw,0);
	CloseHandle(hf);
	return r;
}