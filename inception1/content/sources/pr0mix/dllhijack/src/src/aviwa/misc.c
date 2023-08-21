/***************************************************************************************************************\
*																												*
*									МОДУЛЬ СО ВСПОМОГАТЕЛЬНЫМИ ФУНКАМИ											*
*												(ОПРЕДЕЛЕНИЯ)													* 
*																												*
*				получение Process ID по окну, получение (определённой) строки из (опред.) процесса,				*
*				определение пригодности окна для дальнейших манипуляций,										*
*				клик левой мыши в заданной области опред. окна													*
*																												*
*				GetPIDOnWindow, GetStringFromProcess, IsWindowSuitable, ClickLBM								*
*																												*
\***************************************************************************************************************/


 
#include "misc.h"



/***************************************************************************************************\
*	Функа GetPIDOnWindow; 
*	получение ID процесса по окну, которое он создал;
*	Вход:
*		pszWindowName	-	имя окна;
*	Выход:
*		pid				-	Process ID (если всё прошло успешно); 
*		return HWND		-	HWND найденного окна (по имени); 
\***************************************************************************************************/
HWND GetPIDOnWindow(char *pszWindowName, DWORD *pid)
{
	HWND hWnd = (HWND)0;

	hWnd = FindWindowA(0, pszWindowName);	//находим нужное нам окно

	if(!hWnd)
		return 0;

	GetWindowThreadProcessId(hWnd, pid);	//и по хэндлу получаем ID процесса, который создал это окно; 

	return hWnd;
}
/***************************************************************************************************\
*	конец функи ChangeRegKey; 	
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа GetStringFromProcess; 
*	получение нужной строки из нужного процесса;
*	Вход:
*		pid			-	Process ID;
*		str_type	-	задаём тип строки, которую надо получить (фактически, тут задаём смещение 
*						в байтах от начала структы PRTL_USER_PROCESS_PARAMETERS);
*						доступные типы: STR_CURDIR, STR_DLLPATH, STR_IMAGEPATHNAME, STR_CMDLINE;
*	Выход:
*		char *		-	искомая строка или 0, если её не удалось получить; 
*	Заметки: 
*		данный код работает на x86 OS. Для x64 - изучаем смещения полей структур и правим их; 
*		также, функа в случае успеха возвращает указатель на строку. По окончанию работы памть 
*		под эту строку освобождаем, например, так: free(char *); 
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
		(_NtQueryInformationProcess)GetProcAddress(GetModuleHandleA("ntdll.dll"), "NtQueryInformationProcess");	//находим адрес данной функи в ntdll.dll; 

	if(!NtQueryInformationProcess)	//если не получилось, выходим; 
		return 0;

	hProcess = OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ, FALSE, pid);	//открываем (существующий) объект процесса с правами на получение некоторой инфы о нём, а также чтения его памяти (пр0цесса); 

	if(!hProcess)
	{
		return 0; 
	}

	NtQueryInformationProcess(hProcess, 0, &pbi, sizeof(pbi), 0);	//получаем инфу о процессе -> конкретно сейчас на выходе будет заполненная структа PROCESS_BASIC_INFORMATION (в ней нам нужен адрес PEB); (ProcessBasicInformation); 

	if(!ReadProcessMemory(hProcess, (DWORD*)((DWORD)pbi.PebBaseAddress + 0x10), &rupp_addr, sizeof(DWORD), 0))	//в PEB нас интересует поле (PRTL_USER_PROCESS_PARAMETERS) ProcessParameters, получим его значение; 
	{
		CloseHandle(hProcess);
		return 0;
	}

	if(!ReadProcessMemory(hProcess, (DWORD*)(rupp_addr + str_type), &us_curdir, sizeof(us_curdir), 0))	//в PRTL_USER_PROCESS_PARAMETERS (ProcessParameters) нас интересует (UNICODE_STRING) CurrentDirectoryPath; кстати, командная строка находится по смещению + 0x40 =)! 
	{
		CloseHandle(hProcess);
		return 0;
	}

	pwBuffer = (wchar_t*)malloc(sizeof(wchar_t) * us_curdir.Length + sizeof(wchar_t));	//выделим память для unicode-буфера - он будет содержать строку - текущую директорию нужного процесса; 

	if(!pwBuffer)
	{
		CloseHandle(hProcess);
		return 0;
	}

	if(!ReadProcessMemory(hProcess, us_curdir.Buffer, pwBuffer, us_curdir.Length, 0))	//в UNICODE_STRING (CurrentDirectoryPath) нас интересует поле (PWSTR) Buffer; 
	{
		free(pwBuffer);
		CloseHandle(hProcess);
		return 0;
	}

	len = sizeof(char) * (us_curdir.Length / sizeof(wchar_t)) + sizeof(char);	//посчитаем размер буфера для хранения полученной строки, только в ansi-кодировке; 
	pcBuffer = (char*)malloc(len);	//выделим буфер; 

	if(!pcBuffer)
	{
		free(pwBuffer);
		CloseHandle(hProcess);
		return 0;
	}

	WideCharToMultiByte(CP_ACP, 0, pwBuffer, us_curdir.Length, pcBuffer, len, 0, 0);	//переводим unicode в ansi; 
	pcBuffer[len - 1] = 0;	//завершающий символ (0); 
	free(pwBuffer);	//освободим ранее выделенную память;
	CloseHandle(hProcess);	//закрываем больше ненужный хэндл; 

	return pcBuffer;	//на выход; -> возвращаем ansi-строку -> текущая директория нужного процесса; 
}
/***************************************************************************************************\
*	конец функи GetStringFromProcess; 	
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа IsWindowSuitable; 
*	определяем, пригодное ли окно для наших фич?
*	Вход:
*		hWnd		-	хэндл окна, которое будем чекать; 
*	Выход:
*		1			-	если всё ок, иначе 0; 
\***************************************************************************************************/
BOOL IsWindowSuitable(HWND hWnd)
{
	if(!hWnd || !IsWindowVisible(hWnd) || !IsWindowEnabled(hWnd))	//валидный хэндл, окно видно и оно активировано;
	{
		return FALSE; 
	}
	else return TRUE; 
}
/***************************************************************************************************\
*	конец функи IsWindowSuitable; 
\***************************************************************************************************/



/***************************************************************************************************\
*	Функа ClickLBM; 
*	кликаем по заданной области в окне (1 раз); 
*	Вход:
*		hWnd		-	хэндл окна, по области которого будем кликать мышкой;  
*		x			-	x-координата для щелчка (экранная);
*		y			-	y-координата для щелчка (экранная); 
*	Выход:
*		(+)
\***************************************************************************************************/
void ClickLBM(HWND hWnd, int x, int y)
{
	POINT pt;
	
	GetCursorPos(&pt);	//получаем позицию курсора в экранных координатах; 
	SetCursorPos(x, y);	//ставим мышь в нужную позицию
	mouse_event(MOUSEEVENTF_LEFTDOWN, x, y, 0, 0);	//нажимаем левую кнопку мыши по заданным координатам; 
	mouse_event(MOUSEEVENTF_LEFTUP, x, y, 0, 0);	//отпускаем левую кнопку мыши 
	SetCursorPos(pt.x, pt.y);	//ставим мышь обратно на место; 
}
/***************************************************************************************************\
*	конец функи ClickLBM; 
\***************************************************************************************************/
