/***************************************************************************************************************\
*																												*
*									МОДУЛЬ ДЛЯ РАБОТЫ С БУФЕРОМ ОБМЕНА (БО)										*
*												(ОПРЕДЕЛЕНИЯ)													* 
*																												*
*					копирование (списка имён файлов) данных в БО, получение данных из БО, 						*
*					определение типа операции с данными в БО, помещение данных из БО на диск					*
*																												*
*			CopyPasteFileToClipboard, GetDataFromClipboard, ClipboardOperationType, CopyPasteFileToDisk			*
*																												*
\***************************************************************************************************************/



#include "clipboard.h"



/***************************************************************************************************\
*	Функа CopyPasteFileToClipboard; 
*	копирование/вырезание файла (полного пути (включая имя) файла) в Буфер Обмена (БО); 
*	Вход:
*		hWnd		-	хэндл окна, который связывается  с открытым БО. Если этот параметр = 0, открытый БО связан с текущей задачей; 
*		pszFileName	-	(список имён) имя файла, которое надо скопировать/вырезать в БО; 
*		de_action	-	действие: скопировать или вырезать? (DROPEFFECT_MOVE or DROPEFFECT_COPY); 
*	Выход:
*		TRUE		-	если всё прошло успешно, иначе FALSE;
*	Заметки:
*		в данной ситуации предполагается, что будет копироваться/вырезаться в БО только одно имя 
*		файла. Для помещения в БО списка из нескольких имён файлов - можно легко допилить;
\***************************************************************************************************/
BOOL CopyPasteFileToClipboard(HWND hWnd, char *pszFileName, DWORD de_action)
{
	DWORD size = 0;
	HGLOBAL hGlobal; 
	int len = strlen(pszFileName) + 2;	//+2 -> 2 последних нуля в конце строки; 
	UINT DropEffectFormat;
	DWORD *pDropEffect;
	DROPFILES *pdf;

	if(!OpenClipboard(hWnd))	//открываем буфер обмена (БО); 
		return FALSE;

	EmptyClipboard();	//очищаем его: посылка сообщения WM_DESTROYCLIPBOARD предыдущему владельцу БО;

	size = sizeof(DROPFILES) + len;
	hGlobal = GlobalAlloc(GMEM_SHARE | GMEM_MOVEABLE | GMEM_ZEROINIT, size);	//выделяем память и сразу обнуляем её; 

	if(!hGlobal)	//успешно? 
		return FALSE;

	pdf = (DROPFILES*)GlobalLock(hGlobal);	//лочим;
	pdf->pFiles = sizeof(DROPFILES);	//указываем смещение списка файлов (т.е. сначала идёт данная структа, и сразу за ней список имён файлов (в данной ситуации только одно имя файла)); 
	memcpy(&pdf[1], pszFileName, len);	//копируем данные
	GlobalUnlock(hGlobal);	//разлочим 

	if(!SetClipboardData(CF_HDROP, hGlobal))	//помещаем данные в буфер обмена; 
//	{
//		CloseClipboard();
		return FALSE;
//	}

	DropEffectFormat = RegisterClipboardFormatA(CFSTR_PREFERREDDROPEFFECT);// 'Preferred DropEffect'; регаем новый формат БО; 
	
	if(!DropEffectFormat)
		return FALSE;

	hGlobal = GlobalAlloc(GMEM_SHARE | GMEM_MOVEABLE | GMEM_ZEROINIT, sizeof(DWORD));	//etc 

	if(!hGlobal)
		return FALSE;

	pDropEffect = (DWORD*)GlobalLock(hGlobal);
	
	*pDropEffect = de_action;	//что делаем с данными: DROPEFFECT_MOVE (2) or DROPEFFECT_COPY (1); 
	GlobalUnlock(hGlobal); 
	
	if(!SetClipboardData(DropEffectFormat, hGlobal))
		return FALSE;

	CloseClipboard();	//закрываем БО; 

	return TRUE; 
}
/***************************************************************************************************\
*	конец функи CopyPasteFileToClipboard; 
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа GetDataFromClipboard; 
*	получение данных (списка имён файлов) из БО; 
*	Вход:
*		hWnd		-	хэндл окна, который связывается  с открытым БО. Если этот параметр = 0, открытый БО связан с текущей задачей; 
*	Выход:
*		char **		-	указатель на указатель на строку; грубо говоря, получим этот самый список (строки) имён файлов; 
*		иначе 0, если произошла хуета; 
\***************************************************************************************************/
char **GetDataFromClipboard(HWND hWnd)
{
	HANDLE hBuffer;
	UINT nFiles = 0;
	UINT num_bytes = 0;
	int i = 0;
	char **pszFilesName; 

	if(!IsClipboardFormatAvailable(CF_HDROP))	//содержит ли БО данные в заданном формате?
		return 0;

	if(!OpenClipboard(hWnd))	//открываем БО
		return 0;

	hBuffer = GetClipboardData(CF_HDROP);	//извлекаем данные из БО в заданном формате; 
	nFiles = DragQueryFileA((HDROP)hBuffer, -1, 0, 0);	//получаем число успешно перемещённых имён файлов; 
	pszFilesName = (char **)malloc(sizeof(char*) * nFiles + 1);	//выделяем память для хранения списка имён файлов; +1 -> последний элемент сделаем нулевым;

	if(!pszFilesName)
		return 0;

	for(i = 0; i < nFiles; i++)
	{
		num_bytes = DragQueryFileA((HDROP)hBuffer, i, 0, 0);	//получаем требуемый размер буфера под текущее имя файла (в символах без учёта '\0'); 
		pszFilesName[i] = (char*)malloc(sizeof(char) * num_bytes + 1);	//выделяем памть для хранения очередного имени файла; 

		if(!pszFilesName[i])	//add free(...); 
			return 0;

		DragQueryFileA((HDROP)hBuffer, i, pszFilesName[i], num_bytes + 1);	//извлекаем очередное имя файла, которые получены в результате успешной drag-and-drop фичи; 
	}

	pszFilesName[i] = 0;	//последний элемент = 0; 
	CloseClipboard();	//закрываем БО; 

	return pszFilesName;
}
/***************************************************************************************************\
*	конец функи GetDataFromClipboard; 
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа ClipboardOperationType; 
*	определение типа операции в БО (копирование/вставка); 
*	Вход:
*		hWnd		-	хэндл окна, который связывается  с открытым БО. Если этот параметр = 0, открытый БО связан с текущей задачей; 
*	Выход:
*		int op_type	-	тип операции (DROPEFFECT_MOVE (2) or DROPEFFECT_COPY (1));
*		иначе -1; 
\***************************************************************************************************/
int ClipboardOperationType(HWND hWnd)
{
	UINT cb_format;
	char szBuffer[MAX_PATH];
	HANDLE hGetCBD;
	DWORD *pMem;
	int op_type = -1;

	if(!OpenClipboard(hWnd))	//открываем БО
		return op_type;

	cb_format = EnumClipboardFormats(0);	//начинаем перечисление доступных форматов данных в БО; 

	while(cb_format)
	{
		GetClipboardFormatNameA(cb_format, szBuffer, MAX_PATH);	//извлекаем название заданного зареганного формата из БО; 

		if(stricmp(szBuffer, "Preferred DropEffect") == 0)	//CFSTR_PREFERREDDROPEFFECT (связан с копированием/перемещением файлов/etc - короче, это то, что нам нужно+)); 
		{
			hGetCBD = GetClipboardData(cb_format);	//извлекаем данные из БО в заданном формате; 
			pMem = (DWORD*)GlobalLock((HGLOBAL)hGetCBD);	//лочим
			memcpy(&op_type, pMem, sizeof(DWORD));	//копируем тип операции в переменную (тип: copy, move); 
			GlobalUnlock((HGLOBAL)hGetCBD);	//разлочим; 
		}

		cb_format = EnumClipboardFormats(cb_format);	//получаем очередной доступный сейчас формат данных в БО; 
	}

	CloseClipboard();	//закрываем БО; 

	return op_type; 
}
/***************************************************************************************************\
*	конец функи ClipboardOperationType; 
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа CopyPasteFileToDisk; 
*	копирование/перемещение файла из БО на диск (в нужную директорию); 
*	Вход:
*		pszFrom		-	путь к файлу (включая его имя) - откуда копируем/вырезаем;
*		pszTo		-	также, полный путь - куда копируем/вставляем;
*		op_type		-	копируем (DROPEFFECT_COPY) или вставляем (DROPEFFECT_MOVE)? 
*	Выход:
*		(+); 
\***************************************************************************************************/
int CopyPasteFileToDisk(char *pszFrom, char *pszTo, DWORD op_type)
{
	SHFILEOPSTRUCTA shfos;   
	int res = 0;
	
	memset(&shfos, 0, sizeof(SHFILEOPSTRUCTA));		//обнуляем структу; 

	if(op_type == DROPEFFECT_COPY)
	{
		shfos.wFunc = FO_COPY;	//копируем
	}
	else if(op_type == DROPEFFECT_MOVE)
	{
		shfos.wFunc = FO_MOVE;	//вставляем; 
	}
	else return 0; 

	shfos.pFrom = pszFrom;
	shfos.pTo = pszTo;
	shfos.fFlags = FOF_NOCONFIRMATION | FOF_SILENT; 
	res = SHFileOperationA(&shfos);	//выполняем; 

	return res; 
}
/***************************************************************************************************\
*	конец функи CopyPasteFileToDisk; 
\***************************************************************************************************/
 