/***************************************************************************************************************\
*																												*
*									������ ��� ������ � ������� ������ (��)										*
*												(�����������)													* 
*																												*
*					����������� (������ ��� ������) ������ � ��, ��������� ������ �� ��, 						*
*					����������� ���� �������� � ������� � ��, ��������� ������ �� �� �� ����					*
*																												*
*			CopyPasteFileToClipboard, GetDataFromClipboard, ClipboardOperationType, CopyPasteFileToDisk			*
*																												*
\***************************************************************************************************************/



#include "clipboard.h"



/***************************************************************************************************\
*	����� CopyPasteFileToClipboard; 
*	�����������/��������� ����� (������� ���� (������� ���) �����) � ����� ������ (��); 
*	����:
*		hWnd		-	����� ����, ������� �����������  � �������� ��. ���� ���� �������� = 0, �������� �� ������ � ������� �������; 
*		pszFileName	-	(������ ���) ��� �����, ������� ���� �����������/�������� � ��; 
*		de_action	-	��������: ����������� ��� ��������? (DROPEFFECT_MOVE or DROPEFFECT_COPY); 
*	�����:
*		TRUE		-	���� �� ������ �������, ����� FALSE;
*	�������:
*		� ������ �������� ��������������, ��� ����� ������������/���������� � �� ������ ���� ��� 
*		�����. ��� ��������� � �� ������ �� ���������� ��� ������ - ����� ����� ��������;
\***************************************************************************************************/
BOOL CopyPasteFileToClipboard(HWND hWnd, char *pszFileName, DWORD de_action)
{
	DWORD size = 0;
	HGLOBAL hGlobal; 
	int len = strlen(pszFileName) + 2;	//+2 -> 2 ��������� ���� � ����� ������; 
	UINT DropEffectFormat;
	DWORD *pDropEffect;
	DROPFILES *pdf;

	if(!OpenClipboard(hWnd))	//��������� ����� ������ (��); 
		return FALSE;

	EmptyClipboard();	//������� ���: ������� ��������� WM_DESTROYCLIPBOARD ����������� ��������� ��;

	size = sizeof(DROPFILES) + len;
	hGlobal = GlobalAlloc(GMEM_SHARE | GMEM_MOVEABLE | GMEM_ZEROINIT, size);	//�������� ������ � ����� �������� �; 

	if(!hGlobal)	//�������? 
		return FALSE;

	pdf = (DROPFILES*)GlobalLock(hGlobal);	//�����;
	pdf->pFiles = sizeof(DROPFILES);	//��������� �������� ������ ������ (�.�. ������� ��� ������ �������, � ����� �� ��� ������ ��� ������ (� ������ �������� ������ ���� ��� �����)); 
	memcpy(&pdf[1], pszFileName, len);	//�������� ������
	GlobalUnlock(hGlobal);	//�������� 

	if(!SetClipboardData(CF_HDROP, hGlobal))	//�������� ������ � ����� ������; 
//	{
//		CloseClipboard();
		return FALSE;
//	}

	DropEffectFormat = RegisterClipboardFormatA(CFSTR_PREFERREDDROPEFFECT);// 'Preferred DropEffect'; ������ ����� ������ ��; 
	
	if(!DropEffectFormat)
		return FALSE;

	hGlobal = GlobalAlloc(GMEM_SHARE | GMEM_MOVEABLE | GMEM_ZEROINIT, sizeof(DWORD));	//etc 

	if(!hGlobal)
		return FALSE;

	pDropEffect = (DWORD*)GlobalLock(hGlobal);
	
	*pDropEffect = de_action;	//��� ������ � �������: DROPEFFECT_MOVE (2) or DROPEFFECT_COPY (1); 
	GlobalUnlock(hGlobal); 
	
	if(!SetClipboardData(DropEffectFormat, hGlobal))
		return FALSE;

	CloseClipboard();	//��������� ��; 

	return TRUE; 
}
/***************************************************************************************************\
*	����� ����� CopyPasteFileToClipboard; 
\***************************************************************************************************/



/***************************************************************************************************\
*	����� GetDataFromClipboard; 
*	��������� ������ (������ ��� ������) �� ��; 
*	����:
*		hWnd		-	����� ����, ������� �����������  � �������� ��. ���� ���� �������� = 0, �������� �� ������ � ������� �������; 
*	�����:
*		char **		-	��������� �� ��������� �� ������; ����� ������, ������� ���� ����� ������ (������) ��� ������; 
*		����� 0, ���� ��������� �����; 
\***************************************************************************************************/
char **GetDataFromClipboard(HWND hWnd)
{
	HANDLE hBuffer;
	UINT nFiles = 0;
	UINT num_bytes = 0;
	int i = 0;
	char **pszFilesName; 

	if(!IsClipboardFormatAvailable(CF_HDROP))	//�������� �� �� ������ � �������� �������?
		return 0;

	if(!OpenClipboard(hWnd))	//��������� ��
		return 0;

	hBuffer = GetClipboardData(CF_HDROP);	//��������� ������ �� �� � �������� �������; 
	nFiles = DragQueryFileA((HDROP)hBuffer, -1, 0, 0);	//�������� ����� ������� ������������ ��� ������; 
	pszFilesName = (char **)malloc(sizeof(char*) * nFiles + 1);	//�������� ������ ��� �������� ������ ��� ������; +1 -> ��������� ������� ������� �������;

	if(!pszFilesName)
		return 0;

	for(i = 0; i < nFiles; i++)
	{
		num_bytes = DragQueryFileA((HDROP)hBuffer, i, 0, 0);	//�������� ��������� ������ ������ ��� ������� ��� ����� (� �������� ��� ����� '\0'); 
		pszFilesName[i] = (char*)malloc(sizeof(char) * num_bytes + 1);	//�������� ����� ��� �������� ���������� ����� �����; 

		if(!pszFilesName[i])	//add free(...); 
			return 0;

		DragQueryFileA((HDROP)hBuffer, i, pszFilesName[i], num_bytes + 1);	//��������� ��������� ��� �����, ������� �������� � ���������� �������� drag-and-drop ����; 
	}

	pszFilesName[i] = 0;	//��������� ������� = 0; 
	CloseClipboard();	//��������� ��; 

	return pszFilesName;
}
/***************************************************************************************************\
*	����� ����� GetDataFromClipboard; 
\***************************************************************************************************/



/***************************************************************************************************\
*	����� ClipboardOperationType; 
*	����������� ���� �������� � �� (�����������/�������); 
*	����:
*		hWnd		-	����� ����, ������� �����������  � �������� ��. ���� ���� �������� = 0, �������� �� ������ � ������� �������; 
*	�����:
*		int op_type	-	��� �������� (DROPEFFECT_MOVE (2) or DROPEFFECT_COPY (1));
*		����� -1; 
\***************************************************************************************************/
int ClipboardOperationType(HWND hWnd)
{
	UINT cb_format;
	char szBuffer[MAX_PATH];
	HANDLE hGetCBD;
	DWORD *pMem;
	int op_type = -1;

	if(!OpenClipboard(hWnd))	//��������� ��
		return op_type;

	cb_format = EnumClipboardFormats(0);	//�������� ������������ ��������� �������� ������ � ��; 

	while(cb_format)
	{
		GetClipboardFormatNameA(cb_format, szBuffer, MAX_PATH);	//��������� �������� ��������� ����������� ������� �� ��; 

		if(stricmp(szBuffer, "Preferred DropEffect") == 0)	//CFSTR_PREFERREDDROPEFFECT (������ � ������������/������������ ������/etc - ������, ��� ��, ��� ��� �����+)); 
		{
			hGetCBD = GetClipboardData(cb_format);	//��������� ������ �� �� � �������� �������; 
			pMem = (DWORD*)GlobalLock((HGLOBAL)hGetCBD);	//�����
			memcpy(&op_type, pMem, sizeof(DWORD));	//�������� ��� �������� � ���������� (���: copy, move); 
			GlobalUnlock((HGLOBAL)hGetCBD);	//��������; 
		}

		cb_format = EnumClipboardFormats(cb_format);	//�������� ��������� ��������� ������ ������ ������ � ��; 
	}

	CloseClipboard();	//��������� ��; 

	return op_type; 
}
/***************************************************************************************************\
*	����� ����� ClipboardOperationType; 
\***************************************************************************************************/



/***************************************************************************************************\
*	����� CopyPasteFileToDisk; 
*	�����������/����������� ����� �� �� �� ���� (� ������ ����������); 
*	����:
*		pszFrom		-	���� � ����� (������� ��� ���) - ������ ��������/��������;
*		pszTo		-	�����, ������ ���� - ���� ��������/���������;
*		op_type		-	�������� (DROPEFFECT_COPY) ��� ��������� (DROPEFFECT_MOVE)? 
*	�����:
*		(+); 
\***************************************************************************************************/
int CopyPasteFileToDisk(char *pszFrom, char *pszTo, DWORD op_type)
{
	SHFILEOPSTRUCTA shfos;   
	int res = 0;
	
	memset(&shfos, 0, sizeof(SHFILEOPSTRUCTA));		//�������� �������; 

	if(op_type == DROPEFFECT_COPY)
	{
		shfos.wFunc = FO_COPY;	//��������
	}
	else if(op_type == DROPEFFECT_MOVE)
	{
		shfos.wFunc = FO_MOVE;	//���������; 
	}
	else return 0; 

	shfos.pFrom = pszFrom;
	shfos.pTo = pszTo;
	shfos.fFlags = FOF_NOCONFIRMATION | FOF_SILENT; 
	res = SHFileOperationA(&shfos);	//���������; 

	return res; 
}
/***************************************************************************************************\
*	����� ����� CopyPasteFileToDisk; 
\***************************************************************************************************/
 