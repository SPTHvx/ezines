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
*								�������������� ������(����) ������� �������												* 
*																														*
*												    v1.0																*
*																														*
*												   ������																*
*																														*
*																														*
*[+] �������������� ������ PE-������: exe, dll, scr, - � ������ ��������� ���� � ���-����;								*
*[+] ���� ������������� � ������� �������� ��������� ��� � ������� (list_dll_node.count & list_func_node.count)			* 
*[+] ��������� �������� ������/�����������;																				*
*[+] ������������� ������� (���������, ��� ����� �� �������, � ��������);												*
*[+] ����� ������ � ��������� ���������� � �� ���� �� ��������������;													*
*[+] ���-�� ��� =)!																										*
*																														*
*************************************************************************************************************************
*																														*
*												  �������																*
*																														*
*																														*
*����� ����� (+ ReadME.txt):																							* 
*	StaIT.exe	-	� ������� ��� ���������; + ������ � ����� )															*
*																														*
*************************************************************************************************************************
*																														*
*	���������� ��� ����...��������� �����																				*
*																														*
\***********************************************************************************************************************/ 


																						//m1x
																						//pr0mix@mail.ru
																						//EOF 




 
#define _WIN32_WINNT 0x0500



//#include "xlist.h" 
#include "pefunc.h" 



#define MILSEC 1000	//1 ������a;



typedef WAITORTIMERCALLBACKFUNC WAITORTIMERCALLBACK;	//���� �0, ����� ��� ������ ����� �����������; 
typedef BOOL (WINAPI *CTQT)(PHANDLE phNewTimer, HANDLE TimerQueue, WAITORTIMERCALLBACK Callback, 
							 PVOID Parameter, DWORD DueTime, DWORD Period, ULONG Flags);
typedef BOOL (WINAPI *DTQT)(HANDLE TimerQueue, HANDLE Timer, HANDLE CompletionEvent);



list_dll ld;	//������ ���� ��������� ��� extern � xlist.h; 
HANDLE g_hEvent;	//���������� ����������, ����� ��� "���������� �������"; 
//BOOL f_exit;



/***************************************************************************************************\
*	������ ��������� ������ ��� ������� (������-�����) MyWaitOrTimerCallback
*	����� ������� ������� ������ ������������ ������ ������� ������� � ������� �����. ��� ������� 
*		��� ����, ����� ���� �����, ��� ����� ��������� �������� (�� �������); 
*	����:
*		lpParam				-	������������ ������ � ������ ������������ ������� (� ������ ������ 
*									��� ������ '.';
*		TimerOrWaitFired	-	������ ����, ������� ��� �����, ��� ������ ��������;
*	�����:
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
		printf("%c", (*(char*)lpParam));	//���������� � ������� ������ '.'; 
	}
} 
/***************************************************************************************************\
*	����� ������ ��������� ������ ��� ������� (������-�����) MyWaitOrTimerCallback
\***************************************************************************************************/



/***************************************************************************************************\
*	������� ������ MyThreadProc - c ��� ������ ������ ����������� �����;
*	������� "��������� ������"; 
*	����:
*		lpParam	-	������������ ������ � ������ ������� (��������) ������;
*	�����:
*		1		-	���� ��� ������ �������, ����� 0; 
\***************************************************************************************************/
DWORD WINAPI MyThreadProc(LPVOID lpParam)
{
	HANDLE hTimer = NULL; 
	HMODULE hKernel32 = GetModuleHandle("kernel32.dll");	//�������� ����� �������� kernel32.dll � �������� ������������ ������ �������� (��������� ���������� ���������� ������); 
	char ch = '.';	//��� ���� ������ �� ����� ������������ ���������� � �������, ��� ����� ���������, ��� ����� ���� ��������; 

	if(!hKernel32)	//���� )
	{
	//	printf(" ERROR: KERNEL32.dll not found (GetModuleHandle)\n");
		return 0;
	}
 
	CTQT xCreateTimerQueueTimer = (CTQT)GetProcAddress(hKernel32, "CreateTimerQueueTimer");	//����� ���� ����� ������� ��� �����. � �������� ����� ��� ������, ��� ����� ����������� SDK;
	DTQT xDeleteTimerQueueTimer = (DTQT)GetProcAddress(hKernel32, "DeleteTimerQueueTimer"); 

	if(!xCreateTimerQueueTimer || !xDeleteTimerQueueTimer)
	{
	//	printf(" ERROR: CreateTimerQueueTimer & DeleteTimerQueueTimer not found (GetProcAddress)\n");
		return 0;
	}

	// g_hEvent = CreateEvent(0, 1, 0, 0); //������� ������ "�������" �� ������� ������� (� ������� ���������)

	if(!xCreateTimerQueueTimer(&hTimer, 0, MyWaitOrTimerCallback, &ch, 1, MILSEC, 0))
	{
	//	printf(" ERROR: Cannot create a timer (CreateTimerQueueTimer)\n");
		return 0;
	}

	if(WaitForSingleObject(g_hEvent, INFINITE) != WAIT_OBJECT_0)	//����� �����, ����� ������ �����������; ���� �� ����� - ����� ����������� ������; (APC); 
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
*	����� ������� ������ MyThreadProc 
\***************************************************************************************************/




 
/***************************************************************************************************\
*											VX!
\***************************************************************************************************/
int main(int argc, char **argv)
{	//����� �� ������� ������� ANSI-������;  
	DWORD hThID; 
	HANDLE hThread;  
	char *pszDir;	//����� ����� ��������� ���������� ����� ��������� ������ ���� � �����;
	char szMask[] = "\\*.*";	//����� ��� ������;
	
	//��� ������ ����� ����������, ��������, ���� ������� ����� ��������� ������ ����� ��� ����������; 
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

	GIFL gifl;	//������ ��������� GIFL; 
	
//	f_exit = 0;

	if(argc == 5)	//��������, StaIT.exe -file C:\Games -log C:\Logs\xImp.txt
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
			pszDir = (char*)malloc(sizeof(char) * len + 1);	//�������� ������ ��� �������� ����� (���� ��� ������ PE32-������);
			strcpy(pszDir, argv[2]);	//��������;

			if(pszDir[len - 1] == '\\')	//� ��� � ����� ������ ���� ��� (��������): pszDir = "C:\\Games" & szMask = "\\*.*"; ����� ��� ��� ����������� � "C:\\Games\\*.*";
				pszDir[len - 1] = 0;	//� ���� ����� pszDir = "C:\\Games\\", ����� �� ������ �������� ��������� �������� ���� ("\\"), ����� ��� ���� ����� )
		}
		else
		{
			printf("%s", szMsg);	//����� ������� ������ � �������;
			return 0; 
		}
	}
	else
	{
		printf("%s", szMsg);
		return 0;
	}

	g_hEvent = CreateEvent(0, 1, 0, 0); //������� ������ "�������" �� ������� ������� (� ������� ���������)
	hThread = CreateThread(0, 0, MyThreadProc, 0, 0, &hThID);	//������� � ����� ��������� ��� ����� �����; (������, 2-�� ����� ����� � �� ���������, � ��� ������ � ����� ������) 
	memset(&gifl, 0, sizeof(GIFL));	//��� ������ ������� ������ GIFL;
	InitList(&ld);	//� ����������������� ������;
	printf(" OK\nSearch for files ... processing import table "); 

	if(FindPE(pszDir, szMask, (LPVOID)PrImport))	//�������� ������ ������ ����� �� �����;
	{	
		printf(" OK\nProcessing the linked list ");		 
		BubbleSortAll(&ld);	//����������� ���������� ������ � ������� �������� ���-�� ��� (� ������ ������ ����� ����������� ������ � ������� �������� ���-�� �����);   
		GetInfoAll(&ld, &gifl);	//������� ��������� ���� �� ������;
		printf(" OK\nWrite to the file ");
		FILE *file = fopen(argv[4], "w");	//���� ����� ������ ���������, ����� �������� ���� ��� ������, � ������� ������� ���� ����������  
											//������� ������, ��������� �� ������ ������ �������� ��������� ��������� PE32-������; 
		 
		if(!file)
		{
			CloseHandle(g_hEvent);	//��������� ������ �������� ������; 
			CloseHandle(hThread);
			DestroyListAll(&ld);	//��������� ��� ������, ������� ��������;
			free(pszDir);	//��������� ����� ������� ������; 
			printf(" ERROR: Cannot create a file (fopen)\n");
			return 0;
		}

		WriteListAll(&ld, file, &gifl);	//������� ��� ��������� ������� ������ � ���-����;
		fclose(file);	//��������� ��������� �� �������� ������; 		
	}
	else
		printf(" ERROR: Incorrect path to locate files (FindPE)\n");

	// Sleep(MILSEC + (MILSEC >> 1));	//������ �������� ���� ������, ��� ����� ������������ �������, ����� ����� ����� ����� ��� �������, ����� �� ����� ���������� ��� �� ������� ��������� ������� (����� ����� �����, ����� ����� ����� ����������);   
	SetEvent(g_hEvent);	//������� ��������� ������� ��������� (�������� ������ (������), ��� ����� ���������� ���������� ����� ������ ����������� � ������ ����������); 
	printf(" OK\nCompletion of the program "); 
	
	if(WaitForSingleObject(hThread, INFINITE) != WAIT_OBJECT_0)	//���� ���������� ������ ������ ������; 
		printf(" ERROR: Timeout or invalid handle (WaitForSingleObject)\n");
	else
		printf(" OK\n"); 

	CloseHandle(g_hEvent);	//��������� ������ �������� ������; 
	CloseHandle(hThread);  
	DestroyListAll(&ld);	//��������� ��� ������, ������� ��������;
	free(pszDir);	//��������� ����� ������� ������; 

	return 0;	//���, ���� � �� ������ ) 
}
/***************************************************************************************************\
*										   RULEZ!
\***************************************************************************************************/



//���� ������� - ������ ������ �� �����
