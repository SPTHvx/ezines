/***********************************************************************************************************************\
*																														*
*			xxxxxxxxxxxxx											    xxxxxxxxxxxxxxx     xxxxxxxxxxxxxxx				*
*	       xxxxxxxxxxxxxxx											    xxxxxxxxxxxxxxx		xxxxxxxxxxxxxxx				*
*		   xxxxx	   xxxx													 xxxxx				 xxxxx					*
*		   xxxxx	   xxxx		   xxxxx			 xxxxxxxxxxxx			 xxxxx				 xxxxx					*
*		   xxxxx				   xxxxx		    xxxxxxxxxxxxxx			 xxxxx				 xxxxx					*
*		   xxxxx				   xxxxx		   xxxxx	  xxxxx			 xxxxx				 xxxxx					*
*		   xxxxxxxxxxxxxx		   xxxxx		   xxxxx	  xxxxx			 xxxxx				 xxxxx					*
*		    xxxxxxxxxxxxxx		xxxxxxxxxxx		   xxxxx	  xxxxx			 xxxxx				 xxxxx					*
*				     xxxxx		xxxxxxxxxxx		   xxxxx xxxx xxxxx			 xxxxx				 xxxxx					*
*					 xxxxx		   xxxxx		   xxxxx xxxx xxxxx			 xxxxx				 xxxxx					*
*		   xxxx	     xxxxx		   xxxxx		   xxxxx	  xxxxx			 xxxxx				 xxxxx					*
*		   xxxx		 xxxxx		   xxxxx		   xxxxx	  xxxxx			 xxxxx				 xxxxx					*
*		   xxxxxxxxxxxxxxx		   xxxxxxxxxxx	   xxxxx	  xxxxx		xxxxxxxxxxxxxxx			 xxxxx					*
*			xxxxxxxxxxxxx		   xxxxxxxxxxx     xxxxx	  xxxxx     xxxxxxxxxxxxxxx			 xxxxx					*
*																														*
*************************************************************************************************************************
*																														*
*													=)!																	*
*																														*
************************************************************************************************************************* 
*																														*
*												   StaIT																*
*								STatistical Analysis of the Import Table												*
*								Статистический анализ(атор) таблицы импорта												* 
*																														*
*												    v1.0																*
*																														*
*												   МУЛЬКИ																*
*																														*
*																														*
*[+] статистический анализ PE-файлов: exe, dll, scr, - и запись собранной инфы в лог-файл;								*
*[+] инфа отсортирована в порядке убывания количеств длл и функций (list_dll_node.count & list_func_node.count)			* 
*[+] считаются разлиные данные/соотношения;																				*
*[+] использование таймера (видимость, что прога не зависла, а работает);												*
*[+] поиск файлов в указанной директории и во всех ее субдиректориях;													*
*[+] что-то еще =)!																										*
*																														*
*************************************************************************************************************************
*																														*
*												  ЗАМЕТКИ																*
*																														*
*																														*
*ВЫЗОВ ПРОГИ (+ ReadME.txt):																							* 
*	StaIT.exe	-	и увидишь все параметры; + смотри в сорцы )															*
*																														*
*************************************************************************************************************************
*																														*
*	Вирмэйкинг для себя...искусство вечно																				*
*																														*
\***********************************************************************************************************************/ 


																						//m1x
																						//pr0mix@mail.ru
																						//EOF 




 
#define _WIN32_WINNT 0x0500



//#include "xlist.h" 
#include "pefunc.h" 



#define MILSEC 1000	//1 секундa;



typedef WAITORTIMERCALLBACKFUNC WAITORTIMERCALLBACK;	//если ч0, можно эту строку нахер закоментить; 
typedef BOOL (WINAPI *CTQT)(PHANDLE phNewTimer, HANDLE TimerQueue, WAITORTIMERCALLBACK Callback, 
							 PVOID Parameter, DWORD DueTime, DWORD Period, ULONG Flags);
typedef BOOL (WINAPI *DTQT)(HANDLE TimerQueue, HANDLE Timer, HANDLE CompletionEvent);



list_dll ld;	//прежде была объявлена как extern в xlist.h; 
HANDLE g_hEvent;	//глобальная переменнпя, нужна для "отключения таймера"; 
//BOOL f_exit;



/***************************************************************************************************\
*	Функия обратного вызова для таймера (колбак-функа) MyWaitOrTimerCallback
*	после запуска таймера каждый определенный период времени выводит в консоль точки. Это сделано 
*		для того, чтобы было видно, что прога нормально работает (не зависла); 
*	ВХОД:
*		lpParam				-	передаваемые данные в момент срабатывания таймера (в данном случае 
*									это символ '.';
*		TimerOrWaitFired	-	всегда труЪ, сообщая тем самым, что таймер сработал;
*	ВЫХОД:
*		(+);
\***************************************************************************************************/
VOID CALLBACK MyWaitOrTimerCallback(PVOID lpParam, BOOLEAN TimerOrWaitFired)
{
	if(!lpParam)
	{
		printf("NULL lpParam!\n");
	}
	else
	{
		printf("%c", (*(char*)lpParam));	//отображаем в консоли символ '.'; 
	}
} 
/***************************************************************************************************\
*	конец функии обратного вызова для таймера (колбак-функа) MyWaitOrTimerCallback
\***************************************************************************************************/



/***************************************************************************************************\
*	Функция потока MyThreadProc - c нее начнет работу создаваемый поток;
*	Создает "ожидаемый таймер"; 
*	ВХОД:
*		lpParam	-	передаваемые данные в момент запуска (создания) потока;
*	ВЫХОД:
*		1		-	если все прошло отлично, иначе 0; 
\***************************************************************************************************/
DWORD WINAPI MyThreadProc(LPVOID lpParam)
{
	HANDLE hTimer = NULL; 
	HMODULE hKernel32 = GetModuleHandle("kernel32.dll");	//получаем адрес загрузки kernel32.dll в адресном пространстве нашего процесса (извлекает дескриптор указанного модуля); 
	char ch = '.';	//вот этот символ мы будем периодически отображать в консоли, тем самым показывая, что прога норм работает; 

	if(!hKernel32)	//хехе )
	{
	//	printf(" ERROR: KERNEL32.dll not found (GetModuleHandle)\n");
		return 0;
	}
 
	CTQT xCreateTimerQueueTimer = (CTQT)GetProcAddress(hKernel32, "CreateTimerQueueTimer");	//здесь тоже можно сделать без херни. А написано здесь так потому, что стоял задрыпанный SDK;
	DTQT xDeleteTimerQueueTimer = (DTQT)GetProcAddress(hKernel32, "DeleteTimerQueueTimer"); 

	if(!xCreateTimerQueueTimer || !xDeleteTimerQueueTimer)
	{
	//	printf(" ERROR: CreateTimerQueueTimer & DeleteTimerQueueTimer not found (GetProcAddress)\n");
		return 0;
	}

	// g_hEvent = CreateEvent(0, 1, 0, 0); //создаем объект "событие" со сбросом вручную (в занятом состоянии)

	if(!xCreateTimerQueueTimer(&hTimer, 0, MyWaitOrTimerCallback, &ch, 1, MILSEC, 0))
	{
	//	printf(" ERROR: Cannot create a timer (CreateTimerQueueTimer)\n");
		return 0;
	}

	if(WaitForSingleObject(g_hEvent, INFINITE) != WAIT_OBJECT_0)	//будем ждать, когда объект освободится; пока он занят - будет срабатывать таймер; (APC); 
	{
	//	printf(" ERROR: Timeout or invalid handle (WaitForSingleObject)\n");
		return 0; 
	}

	if(!xDeleteTimerQueueTimer(0, hTimer, 0))
	{
	//	printf(" ERROR: Cannot delete a timer (DeleteTimerQueueTimer)\n");
		return 0;
	}

	CloseHandle(hTimer);

	return 1;
}
/***************************************************************************************************\
*	конец функции потока MyThreadProc 
\***************************************************************************************************/




 
/***************************************************************************************************\
*											VX!
\***************************************************************************************************/
int main(int argc, char **argv)
{	//везде по дэфолту юзаются ANSI-строки;  
	DWORD hThID; 
	HANDLE hThread;  
	char *pszDir;	//здесь будем храниться переданный через командную строку путь к папке;
	char szMask[] = "\\*.*";	//маска для поиска;
	
	//эта строка будет выводиться, например, если вызвать через командную строку прогу без параметров; 
	char szMsg[] = 
		"StaIT v1.0 by pr0mix\n\
mail: pr0mix@mail.ru | vxrulez@gmail.com\n\n\
Usage: stait.exe -file InputFile -log LogFile\n\
 -file\t\t specify directory for input\n\
 -log\t\t specify log-file for output\n\n\
Examples:\n\
1. Stait.exe -file \"C:\\Program Files\" -log C:\\mylog.txt\n\
2. Stait.exe -file C:\\Games -log C:\\mylog.log\n\
3. Stait.exe -file C:\\ -log C:\\01.txt\n\n\n\
Enjoy!\n\n\n"; 

	GIFL gifl;	//объект структуры GIFL; 
	
//	f_exit = 0;

	if(argc == 5)	//например, StaIT.exe -file C:\Games -log C:\Logs\xImp.txt
	{		
		if((strcmp(argv[1], "-file") == 0) && (strcmp(argv[3], "-log") == 0))
		{
			int len = strlen(argv[2]);

			if((len >= MAX_LEN) || (strlen(argv[4]) >= MAX_LEN))
			{
				printf("ERROR: maximum length of string = %d (MAX_LEN)\n", MAX_LEN);
				return 0;
			}
			
			printf("Initialization ");
			pszDir = (char*)malloc(sizeof(char) * len + 1);	//выделяем память для хранения сроки (пути для поиска PE32-файлов);
			strcpy(pszDir, argv[2]);	//копируем;

			if(pszDir[len - 1] == '\\')	//у нас в итоге должно быть так (например): pszDir = "C:\\Games" & szMask = "\\*.*"; После все это объединится в "C:\\Games\\*.*";
				pszDir[len - 1] = 0;	//а если вдруг pszDir = "C:\\Games\\", тогда мы должны затереть последний обратный слэш ("\\"), чтобы все было супер )
		}
		else
		{
			printf("%s", szMsg);	//иначе покажем строку в консоли;
			return 0; 
		}
	}
	else
	{
		printf("%s", szMsg);
		return 0;
	}

	g_hEvent = CreateEvent(0, 1, 0, 0); //создаем объект "событие" со сбросом вручную (в занятом состоянии)
	hThread = CreateThread(0, 0, MyThreadProc, 0, 0, &hThID);	//создаем и сразу запускаем наш новый поток; (кстати, 2-ой поток можно и не создавать, а все делать в одном потоке) 
	memset(&gifl, 0, sizeof(GIFL));	//для начала обнулим объект GIFL;
	InitList(&ld);	//и проинициализируем список;
	printf(" OK\nSearch for files ... processing import table "); 

	if(FindPE(pszDir, szMask, (LPVOID)PrImport))	//начинаем искать нужные файлы по маске;
	{	
		printf(" OK\nProcessing the linked list ");		 
		BubbleSortAll(&ld);	//отсортируем полученный список в порядке убывания кол-тв длл (а внутри каждой также отсортируем список в порядке убывания кол-тв фунок);   
		GetInfoAll(&ld, &gifl);	//получим некоторую инфу из списка;
		printf(" OK\nWrite to the file ");
		FILE *file = fopen(argv[4], "w");	//если поиск вообще состоялся, тогда создадим файл для записи, в который запишем весь полученный  
											//связный список, состоящий из данных таблиц импортов различных найденных PE32-файлов; 
		 
		if(!file)
		{
			CloseHandle(g_hEvent);	//закрываем больше ненужные хэндлы; 
			CloseHandle(hThread);
			DestroyListAll(&ld);	//освободим всю память, занятую списками;
			free(pszDir);	//освободим ранее занятую память; 
			printf(" ERROR: Cannot create a file (fopen)\n");
			return 0;
		}

		WriteListAll(&ld, file, &gifl);	//запишем уже полностью готовый список в лог-файл;
		fclose(file);	//закрываем указатель на открытый файлик; 		
	}
	else
		printf(" ERROR: Incorrect path to locate files (FindPE)\n");

	// Sleep(MILSEC + (MILSEC >> 1));	//делаем задержку чуть больше, чем время срабатывания таймера, чтобы новый поток точно был запущен, иначе мы можем освободить еще не занятое состояние события (дохуя будем ждать, когда новый поток завершится);   
	SetEvent(g_hEvent);	//сделаем состояние события свободным (отключим таймер (удалим), тем самым выполнение созданного ранее потока продолжится и быстро закончится); 
	printf(" OK\nCompletion of the program "); 
	
	if(WaitForSingleObject(hThread, INFINITE) != WAIT_OBJECT_0)	//ждем завершения работы нового потока; 
		printf(" ERROR: Timeout or invalid handle (WaitForSingleObject)\n");
	else
		printf(" OK\n"); 

	CloseHandle(g_hEvent);	//закрываем больше ненужные хэндлы; 
	CloseHandle(hThread);  
	DestroyListAll(&ld);	//освободим всю память, занятую списками;
	free(pszDir);	//освободим ранее занятую память; 

	return 0;	//все, хули ж вы хотели ) 
}
/***************************************************************************************************\
*										   RULEZ!
\***************************************************************************************************/



//Будь сильным - слабым всегда не везет
