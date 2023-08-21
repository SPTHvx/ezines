/***************************************************************************************************************\
*																												*
*									������ �� ���������������� �������											*
*												(�����������)													* 
*																												*
*				��������� Process ID �� ����, ��������� (�����������) ������ �� (�����.) ��������,				*
*				����������� ����������� ���� ��� ���������� �����������,										*
*				���� ����� ���� � �������� ������� �����. ����													*
*																												*
*				GetPIDOnWindow, GetStringFromProcess, IsWindowSuitable, ClickLBM								*
*																												*
\***************************************************************************************************************/


 
#include "misc.h"



/***************************************************************************************************\
*	����� GetPIDOnWindow; 
*	��������� ID �������� �� ����, ������� �� ������;
*	����:
*		pszWindowName	-	��� ����;
*	�����:
*		pid				-	Process ID (���� �� ������ �������); 
*		return HWND		-	HWND ���������� ���� (�� �����); 
\***************************************************************************************************/
HWND GetPIDOnWindow(char *pszWindowName, DWORD *pid)
{
	HWND hWnd = (HWND)0;

	hWnd = FindWindowA(0, pszWindowName);	//������� ������ ��� ����

	if(!hWnd)
		return 0;

	GetWindowThreadProcessId(hWnd, pid);	//� �� ������ �������� ID ��������, ������� ������ ��� ����; 

	return hWnd;
}
/***************************************************************************************************\
*	����� ����� ChangeRegKey; 	
\***************************************************************************************************/



/***************************************************************************************************\
*	����� GetStringFromProcess; 
*	��������� ������ ������ �� ������� ��������;
*	����:
*		pid			-	Process ID;
*		str_type	-	����� ��� ������, ������� ���� �������� (����������, ��� ����� �������� 
*						� ������ �� ������ ������� PRTL_USER_PROCESS_PARAMETERS);
*						��������� ����: STR_CURDIR, STR_DLLPATH, STR_IMAGEPATHNAME, STR_CMDLINE;
*	�����:
*		char *		-	������� ������ ��� 0, ���� � �� ������� ��������; 
*	�������: 
*		������ ��� �������� �� x86 OS. ��� x64 - ������� �������� ����� �������� � ������ ��; 
*		�����, ����� � ������ ������ ���������� ��������� �� ������. �� ��������� ������ ����� 
*		��� ��� ������ �����������, ��������, ���: free(char *); 
\***************************************************************************************************/
char *GetStringFromProcess(DWORD pid, DWORD str_type)
{
	HANDLE hProcess;
	PROCESS_BASIC_INFORMATION pbi;
	DWORD rupp_addr; 
	UNICODE_STRING us_curdir;
	wchar_t *pwBuffer;
	char *pcBuffer; 
	int len = 0;
	_NtQueryInformationProcess NtQueryInformationProcess = 
		(_NtQueryInformationProcess)GetProcAddress(GetModuleHandleA("ntdll.dll"), "NtQueryInformationProcess");	//������� ����� ������ ����� � ntdll.dll; 

	if(!NtQueryInformationProcess)	//���� �� ����������, �������; 
		return 0;

	hProcess = OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ, FALSE, pid);	//��������� (������������) ������ �������� � ������� �� ��������� ��������� ���� � ��, � ����� ������ ��� ������ (��0�����); 

	if(!hProcess)
	{
		return 0; 
	}

	NtQueryInformationProcess(hProcess, 0, &pbi, sizeof(pbi), 0);	//�������� ���� � �������� -> ��������� ������ �� ������ ����� ����������� ������� PROCESS_BASIC_INFORMATION (� ��� ��� ����� ����� PEB); (ProcessBasicInformation); 

	if(!ReadProcessMemory(hProcess, (DWORD*)((DWORD)pbi.PebBaseAddress + 0x10), &rupp_addr, sizeof(DWORD), 0))	//� PEB ��� ���������� ���� (PRTL_USER_PROCESS_PARAMETERS) ProcessParameters, ������� ��� ��������; 
	{
		CloseHandle(hProcess);
		return 0;
	}

	if(!ReadProcessMemory(hProcess, (DWORD*)(rupp_addr + str_type), &us_curdir, sizeof(us_curdir), 0))	//� PRTL_USER_PROCESS_PARAMETERS (ProcessParameters) ��� ���������� (UNICODE_STRING) CurrentDirectoryPath; ������, ��������� ������ ��������� �� �������� + 0x40 =)! 
	{
		CloseHandle(hProcess);
		return 0;
	}

	pwBuffer = (wchar_t*)malloc(sizeof(wchar_t) * us_curdir.Length + sizeof(wchar_t));	//������� ������ ��� unicode-������ - �� ����� ��������� ������ - ������� ���������� ������� ��������; 

	if(!pwBuffer)
	{
		CloseHandle(hProcess);
		return 0;
	}

	if(!ReadProcessMemory(hProcess, us_curdir.Buffer, pwBuffer, us_curdir.Length, 0))	//� UNICODE_STRING (CurrentDirectoryPath) ��� ���������� ���� (PWSTR) Buffer; 
	{
		free(pwBuffer);
		CloseHandle(hProcess);
		return 0;
	}

	len = sizeof(char) * (us_curdir.Length / sizeof(wchar_t)) + sizeof(char);	//��������� ������ ������ ��� �������� ���������� ������, ������ � ansi-���������; 
	pcBuffer = (char*)malloc(len);	//������� �����; 

	if(!pcBuffer)
	{
		free(pwBuffer);
		CloseHandle(hProcess);
		return 0;
	}

	WideCharToMultiByte(CP_ACP, 0, pwBuffer, us_curdir.Length, pcBuffer, len, 0, 0);	//��������� unicode � ansi; 
	pcBuffer[len - 1] = 0;	//����������� ������ (0); 
	free(pwBuffer);	//��������� ����� ���������� ������;
	CloseHandle(hProcess);	//��������� ������ �������� �����; 

	return pcBuffer;	//�� �����; -> ���������� ansi-������ -> ������� ���������� ������� ��������; 
}
/***************************************************************************************************\
*	����� ����� GetStringFromProcess; 	
\***************************************************************************************************/



/***************************************************************************************************\
*	����� IsWindowSuitable; 
*	����������, ��������� �� ���� ��� ����� ���?
*	����:
*		hWnd		-	����� ����, ������� ����� ������; 
*	�����:
*		1			-	���� �� ��, ����� 0; 
\***************************************************************************************************/
BOOL IsWindowSuitable(HWND hWnd)
{
	if(!hWnd || !IsWindowVisible(hWnd) || !IsWindowEnabled(hWnd))	//�������� �����, ���� ����� � ��� ������������;
	{
		return FALSE; 
	}
	else return TRUE; 
}
/***************************************************************************************************\
*	����� ����� IsWindowSuitable; 
\***************************************************************************************************/



/***************************************************************************************************\
*	����� ClickLBM; 
*	������� �� �������� ������� � ���� (1 ���); 
*	����:
*		hWnd		-	����� ����, �� ������� �������� ����� ������� ������;  
*		x			-	x-���������� ��� ������ (��������);
*		y			-	y-���������� ��� ������ (��������); 
*	�����:
*		(+)
\***************************************************************************************************/
void ClickLBM(HWND hWnd, int x, int y)
{
	POINT pt;
	
	GetCursorPos(&pt);	//�������� ������� ������� � �������� �����������; 
	SetCursorPos(x, y);	//������ ���� � ������ �������
	mouse_event(MOUSEEVENTF_LEFTDOWN, x, y, 0, 0);	//�������� ����� ������ ���� �� �������� �����������; 
	mouse_event(MOUSEEVENTF_LEFTUP, x, y, 0, 0);	//��������� ����� ������ ���� 
	SetCursorPos(pt.x, pt.y);	//������ ���� ������� �� �����; 
}
/***************************************************************************************************\
*	����� ����� ClickLBM; 
\***************************************************************************************************/
