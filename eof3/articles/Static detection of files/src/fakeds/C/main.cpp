#include <windows.h> 
#include <stdio.h>
#include <tchar.h>
#include <softpub.h>
#include <wincrypt.h>
#include <wintrust.h>
#include <mscat.h> 
#include <imagehlp.h>



#pragma comment (lib, "wintrust")	//подключаем статически нужные либы 
#pragma comment (lib, "imagehlp") 



//приходится определять оба макроса; 
#ifndef UNICODE		//данный макрос юзается в .h-файлах windows
#define XSTR_MS 1	//если будем юзать ANSI-строки 
#else
#define XSTR_MS 0	//иначе UNICODE-строки
#endif

#ifndef _UNICODE	//данный макрос юзается в .h-файлах библиотеки C; 
#define XSTR_C 1	//аналогично 
#else
#define XSTR_C 0	//etc 
#endif


#define RVATOVA(Base, Rva)	((DWORD)Base + (DWORD)Rva)	//дэфайн - получение из RVA -> VA (k.0.) )
#define ALIGN_UP(x, y)	((x + (y - 1)) & (~(y - 1)))	//выравнивание вверх; 
#define ALIGN_DOWN(x, y)	(x & (~(y - 1)))	//вниз; 
#define XALIGN 0x1000	//дэфолтовое файловое выравнивание файла; 





/***************************************************************************************************\
*	Функа ValidPE;
*	проверка файла на соответствие формату PE32;
*	ВХОД:
*		pExe	-	база мэппинга (адрес файла в памяти (MapViewOfFile) aka начальный адрес 
*						отображаемого представления); 
*	ВЫХОД: 
*		1		-	если файл валидный, иначе 0;  
\***************************************************************************************************/
BOOL ValidPE(LPVOID pExe)
{
	IMAGE_DOS_HEADER *imDh = (IMAGE_DOS_HEADER*)pExe;  
	IMAGE_NT_HEADERS *imNTh;

	if((imDh->e_magic == IMAGE_DOS_SIGNATURE) && ((DWORD)imDh->e_lfanew <= 0x200))	//обязательно привести к DWORD'у, иначе будет неправильно сравнивать с числами, где установлен самый старший разряд в 1 (например, 0x8E888857 etc);  
	{
		imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew);   
		
		if((imNTh->Signature == IMAGE_NT_SIGNATURE) && 
		   (imNTh->FileHeader.NumberOfSections > 0 && imNTh->FileHeader.NumberOfSections < 96) && 
		   (imNTh->FileHeader.Characteristics & (IMAGE_FILE_EXECUTABLE_IMAGE | IMAGE_FILE_32BIT_MACHINE | IMAGE_FILE_DLL)) && 
		   (imNTh->OptionalHeader.Magic == IMAGE_NT_OPTIONAL_HDR32_MAGIC) && 
		   (imNTh->OptionalHeader.Subsystem == IMAGE_SUBSYSTEM_WINDOWS_GUI || 
		    imNTh->OptionalHeader.Subsystem == IMAGE_SUBSYSTEM_WINDOWS_CUI))
		{ 
			return 1;
		}
	}
	
	return 0;  
}
/***************************************************************************************************\
*	Конец функи ValidPE; 
\***************************************************************************************************/



/***************************************************************************************************\
*	функция MapFile
*	мэппинг файла
*	ВХОД:
*		pstrFileName - файл, который будет проецировать в память
*	ВЫХОД:
*		0			 - если хуита, иначе база мэппинга
\***************************************************************************************************/
LPVOID MapFile(TCHAR *pstrFileName)
{
	HANDLE hFile;
	HANDLE hFileMap;
	LPVOID pExe;

	hFile = CreateFile(pstrFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, 
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);	//открываем файл

	if(hFile == INVALID_HANDLE_VALUE)
		return 0;

	hFileMap = CreateFileMapping(hFile, 0, PAGE_READWRITE, 0, 0, 0);	//создаем проекциб файла

	if(!hFileMap)
	{
		CloseHandle(hFile);
		return 0;
	}

	pExe = MapViewOfFile(hFileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);	//проецируем файл в память; 
	CloseHandle(hFileMap);
	CloseHandle(hFile);

	return pExe; 
}
/***************************************************************************************************\
*	конец функции MapFile
\***************************************************************************************************/



/***************************************************************************************************\
*	функция UnmapFile
*	освобождение проекции файла
*	ВХОД:
*		pExe - база мэппинга
*	ВЫХОД:
*		(+) 
\***************************************************************************************************/
void UnmapFile(LPVOID pExe)
{
	UnmapViewOfFile(pExe); 
}
/***************************************************************************************************\
*	конец функции UnmapFile
\***************************************************************************************************/



/***************************************************************************************************\
*	Функция GetCertFromFile
*	выдирание сертификатов из файлов (PE32)
*	ВХОД:
*		pszFileName		- имя файла, откуда будем тырить серты
*		pszNewCertName	- файл, который будет создан и в который будет сохранён выдернутый серт;
*	ВЫХОД:
*		0				- если хуерга, иначе 1;
\***************************************************************************************************/
BOOL GetCertFromFile(TCHAR *pstrFileName, TCHAR *pstrNewCertName)
{
	HANDLE hFile1;
	HANDLE hFile2;
	HANDLE hFileMap;
	LPVOID pExe;
	IMAGE_DOS_HEADER *imDh;
	IMAGE_NT_HEADERS *imNTh; 
	DWORD cert_addr = 0;
	DWORD cert_size = 0; 
	DWORD num = 0; 

	hFile1 = CreateFile(pstrFileName, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 
		FILE_ATTRIBUTE_NORMAL, NULL);	//открываем файл на чтение

	if(hFile1 == INVALID_HANDLE_VALUE)	//неудачно? 
	{
		CloseHandle(hFile1);
		return 0;
	}

	hFileMap = CreateFileMapping(hFile1, NULL, PAGE_READONLY, 0, 0, 0);	//создаем проекцию файла 

	if(!hFileMap)	//неудачно?
	{
		CloseHandle(hFile1);
		return 0; 
	}

	pExe = MapViewOfFile(hFileMap, FILE_MAP_READ, 0, 0, 0);	//проецируем файл в вирт. АП нашего процесса; 
	CloseHandle(hFileMap);
	CloseHandle(hFile1);

	if(!pExe || !ValidPE(pExe))	//этот файл подходит для нас?
	{
		UnmapViewOfFile(pExe); 
		return 0;
	} 

	imDh = (IMAGE_DOS_HEADER*)pExe;
	imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew);
	cert_addr = imNTh->OptionalHeader.DataDirectory[4].VirtualAddress;
	cert_size = imNTh->OptionalHeader.DataDirectory[4].Size;

	if(!cert_addr || !cert_size)	//есть ли у файла сертификат?
	{
		UnmapViewOfFile(pExe); 
		return 0; 
	}
 
	cert_addr += (DWORD)pExe; 
	hFile2 = CreateFile(pstrNewCertName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, 
		CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);	//создаём файл на чтение/запись 

	if(hFile2 == INVALID_HANDLE_VALUE)	//неудачно? 
	{
		UnmapViewOfFile(pExe);  
		return 0;
	}

	WriteFile(hFile2, (LPCVOID)cert_addr, cert_size, &num, NULL);	//если да, то выдернем и сохраним серт;  
	UnmapViewOfFile(pExe); 
	CloseHandle(hFile2); 

	return 1; 
}
/***************************************************************************************************\
*	конец функции GetCertFromFile 
\***************************************************************************************************/



/***************************************************************************************************\
*	Функция AddCertToFile
*	добавление фэйкового сертификата в указанный файл (PE) 
*	ВХОД:
*		pszCertFile		- выдернутый сертификат, который хотим внедрить в файл
*		pszAddToFile	- файл, в который хотим добавить серт
*	ВЫХОД:
*		0				- если хуерга, иначе 1;
\***************************************************************************************************/
BOOL AddCertToFile(TCHAR *pstrCertFile, TCHAR *pstrAddToFile)
{
	HANDLE hFile1;
	HANDLE hFile2;
	HANDLE hFileMap;
	DWORD file_size;
	LPVOID pExe;
	IMAGE_DOS_HEADER *imDh;
	IMAGE_NT_HEADERS *imNTh;
	DWORD overl_addr = 0;
	DWORD overl_size = 0;
	DWORD num = 0; 
	DWORD header_sum = 0;
	DWORD check_sum = 0; 

	hFile1 = CreateFile(pstrAddToFile, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, 
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);	//открываем файл на чтение/запись

	hFile2 = CreateFile(pstrCertFile, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 
		FILE_ATTRIBUTE_NORMAL, NULL);	//открываем файл на чтение/запись

	if((hFile1 == INVALID_HANDLE_VALUE) || (hFile2 == INVALID_HANDLE_VALUE))	//неудачно?
	{
		CloseHandle(hFile1);
		CloseHandle(hFile2);
		return 0;
	}

	overl_size = GetFileSize(hFile2, 0);	//размер серта 
	file_size = GetFileSize(hFile1, 0) + overl_size; //ALIGN_UP(GetFileSize(hFile1, 0) + overl_size, XALIGN);	//вычисляем новый размер файла;  
	hFileMap = CreateFileMapping(hFile1, NULL, PAGE_READWRITE, 0, file_size, 0);	//создаем проекцию файла с учетом нового размера; 

	if(!hFileMap)	//неудачно?
	{
		CloseHandle(hFile1);
		CloseHandle(hFile2);
		return 0; 
	}

	pExe = MapViewOfFile(hFileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);	//проецируем файл в вирт. АП нашего процесса; 
	CloseHandle(hFileMap);
	CloseHandle(hFile1); 

	if(!pExe || !ValidPE(pExe))	//данный файл подходит нам для внедрения серта? 
	{
		UnmapViewOfFile(pExe); 
		CloseHandle(hFile2);
		return 0;   
	}

	imDh = (IMAGE_DOS_HEADER*)pExe;
	imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew);
	overl_addr = (DWORD)pExe + file_size - overl_size;	//сертификат всегда располагается в оверлее (к тому же, в самом конце файлов); 
	ReadFile(hFile2, (LPVOID)overl_addr, overl_size, &num, NULL);	//и записываем его	 
	imNTh->OptionalHeader.DataDirectory[4].VirtualAddress = overl_addr - (DWORD)pExe;	//это не rva: для сертов в данном поле указывается смещение относительно начала файла;    
	imNTh->OptionalHeader.DataDirectory[4].Size = overl_size;	//размер серта; 

	if(CheckSumMappedFile((PVOID)pExe, file_size, &header_sum, &check_sum))	//у файлов с сертами всегда расчитана чек-сумма, мы тоже это сделаем =) 
	{
		imNTh->OptionalHeader.CheckSum = check_sum; 
	}
 	 
	UnmapViewOfFile(pExe); 
	CloseHandle(hFile2); 

	return 1; 
}
/***************************************************************************************************\
*	конец функции AddCertToFile
\***************************************************************************************************/



/***************************************************************************************************\
*	функция DelCertFromFile
*	удаление эцп из файла
*	ВХОД:
*		pstrFileName - файл, в котором хотим удалить эцп
*	ВЫХОД:
*		0			 - если херня, иначе 1; 
\***************************************************************************************************/
BOOL DelCertFromFile(TCHAR *pstrFileName)
{
	LPVOID pExe;
	IMAGE_DOS_HEADER *imDh;
	IMAGE_NT_HEADERS *imNTh;
	DWORD cert_addr = 0;
	DWORD cert_size = 0; 
	DWORD header_sum = 0;
	DWORD check_sum = 0; 
	DWORD file_size = 0;
	HANDLE hFile;

	pExe = MapFile(pstrFileName);

	if(!pExe || !ValidPE(pExe))
	{
		UnmapFile(pExe);
		return 0;
	}

	imDh = (IMAGE_DOS_HEADER*)pExe;
	imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew); 
	cert_addr = imNTh->OptionalHeader.DataDirectory[4].VirtualAddress;	//сначала узнаем, есть ли у данного файла эцп; 
	cert_size = imNTh->OptionalHeader.DataDirectory[4].Size;

	if(!cert_addr || !cert_size)	//есть ли у файла сертификат?
	{
		UnmapFile(pExe); 
		return 0; 
	}
 
//	cert_addr += (DWORD)pExe;  
	imNTh->OptionalHeader.DataDirectory[4].VirtualAddress = 0;	//если да, то потрем ее данные (адрес и размер) в соотв-ей директории; 
	imNTh->OptionalHeader.DataDirectory[4].Size = 0; 
	UnmapFile(pExe);
	hFile = CreateFile(pstrFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, OPEN_EXISTING, 
		FILE_ATTRIBUTE_NORMAL, 0);

	if(hFile == INVALID_HANDLE_VALUE)
		return 0;

	file_size = GetFileSize(hFile, 0) - cert_size; 
	SetFilePointer(hFile, file_size, 0, FILE_BEGIN);	//затем отрежем от файла саму подпись;  
	SetEndOfFile(hFile);	
	CloseHandle(hFile);
	pExe = MapFile(pstrFileName);
	
	if(!pExe)
		return 0;    

	imDh = (IMAGE_DOS_HEADER*)pExe;
	imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew); 

	if(CheckSumMappedFile((PVOID)pExe, file_size, &header_sum, &check_sum))	//и пересчитаем чексумму; ВОт так ) 	
	{
		imNTh->OptionalHeader.CheckSum = check_sum; 
	}

	UnmapFile(pExe); 
	
	return 1; 
}
/***************************************************************************************************\
*	конец функции DelCertFromFile
\***************************************************************************************************/



/***************************************************************************************************\
*	функция FileVerify 
*	Проверка электронной цифровой функции файла (проверка подписи как в самом файле, так и в 
*	отдельном cat-файле); 
*	ВХОД:
*		pstrFileName	-	файл, чью подпись хотим проверить;
*	ВЫХОД:
*		1				-	если верификация прошла успешно, иначе 0;  
\***************************************************************************************************/
BOOL FileVerify(TCHAR *pstrFileName)
{
    LONG lres = 0;
	HANDLE hCat;
	HANDLE hFile;
    WINTRUST_FILE_INFO wtfi;
	WINTRUST_DATA wtd;
	DWORD buf_size = 0;
	BYTE *pBufHash = NULL; 
	BOOL bres = 0;
	wchar_t *pBuffer; 
	int buf2_size = 0; 

//  WVTPolicyGUID specifies the policy to apply on the file
//  WINTRUST_ACTION_GENERIC_VERIFY_V2 policy checks:
    
//  1) The certificate used to sign the file chains up to a root 
//  certificate located in the trusted root certificate store. This 
//  implies that the identity of the publisher has been verified by 
//  a certification authority.
    
//  2) In cases where user interface is displayed (which this example
//  does not do), WinVerifyTrust will check for whether the  
//  end entity certificate is stored in the trusted publisher store,  
//  implying that the user trusts content from this publisher.
    
//  3) The end entity certificate has sufficient permission to sign 
//  code, as indicated by the presence of a code signing EKU or no 
//  EKU.
    
	GUID gaid = WINTRUST_ACTION_GENERIC_VERIFY_V2;

	hFile = CreateFile(pstrFileName, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, OPEN_EXISTING, 
		FILE_ATTRIBUTE_NORMAL | FILE_FLAG_SEQUENTIAL_SCAN, 0);  

	if(hFile != INVALID_HANDLE_VALUE)
	{
		if(CryptCATAdminAcquireContext(&hCat, 0, 0))
		{
			if(CryptCATAdminCalcHashFromFileHandle(hFile, &buf_size, NULL, 0))
			{
				if(GetLastError() == ERROR_INSUFFICIENT_BUFFER)
				{
					pBufHash = (BYTE*)malloc(sizeof(BYTE) * buf_size + sizeof(BYTE));  

					if(CryptCATAdminCalcHashFromFileHandle(hFile, &buf_size, pBufHash, 0))
					{
						if(CryptCATAdminEnumCatalogFromHash(hCat, pBufHash, buf_size, 0, 0))
						{
							bres = 1;	//если подпись хранится в отдельном каталоге (cat); например, для calc.exe из винды; 
						}
					}

					free(pBufHash);  
				}
			}

			CryptCATAdminReleaseContext(hCat, 0);
		}
		
		CloseHandle(hFile);
	}

	if(bres)
	{
		return bres;	//если подпись была найдена и все ок, тогда на выход 
	}
						
	if(XSTR_MS && XSTR_C)	//иначе сначала узнаем, мы юзаем ansi-строки?
	{ 
		buf2_size = MultiByteToWideChar(CP_ACP, 0, (LPCSTR)pstrFileName, -1, 0, 0);	//если так, то получим размер нового буфера, в котором будет храниться преобразованная в unicode строка; 
		pBuffer = (wchar_t*)malloc(sizeof(wchar_t) * buf2_size + sizeof(wchar_t));	//выделим память 
		MultiByteToWideChar(CP_ACP, 0, (LPCSTR)pstrFileName, -1, (LPWSTR)pBuffer, buf2_size);	//и преобразуем строку из ansi в unicode; 
	}
	else
	{
		pBuffer = (wchar_t*)pstrFileName;	//если же мы юзаем unicode-строки, то ничего преобразовывать не надо, все и так в юникоде ) 
	}

    memset(&wtfi, 0, sizeof(WINTRUST_FILE_INFO)); 
	memset(&wtd, 0, sizeof(WINTRUST_DATA));
    wtfi.cbStruct = sizeof(WINTRUST_FILE_INFO);	
    wtfi.hFile = NULL;
	wtfi.pcwszFilePath = (LPCWSTR)pBuffer;  
    wtfi.pgKnownSubject = NULL;  
    wtd.cbStruct = sizeof(WINTRUST_DATA);
    wtd.pPolicyCallbackData = NULL;
    wtd.pSIPClientData = NULL;
    wtd.dwUIChoice = WTD_UI_NONE;
    wtd.fdwRevocationChecks = WTD_REVOKE_NONE; 
    wtd.dwUnionChoice = WTD_CHOICE_FILE;
    wtd.dwStateAction = 0;
    wtd.hWVTStateData = NULL;
    wtd.pwszURLReference = NULL;
    wtd.dwProvFlags = WTD_SAFER_FLAG;
    wtd.dwUIContext = 0;
    wtd.pFile = &wtfi;
    lres = WinVerifyTrust(NULL, &gaid, &wtd);

	if(XSTR_MS && XSTR_C)
	{
		free(pBuffer); 
	}

	
//	Signed file:
//		- Hash that represents the subject is trusted.
//		- Trusted publisher without any verification errors.
//		- UI was disabled in dwUIChoice. No publisher or time stamp chain errors.
//		- UI was enabled in dwUIChoice and the user clicked 
//		"Yes" when asked to install and run the signed subject.
	
	return (lres == ERROR_SUCCESS);	//на выход 
}
/***************************************************************************************************\
*	конец функции FileVerify 
\***************************************************************************************************/
 




/***************************************************************************************************\
*	main!
\***************************************************************************************************/
int _tmain(int argc, TCHAR *argv[]) 
{
	TCHAR strMsg[] = _TEXT("fakeds v1.0 by pr0mix\n\
mail: pr0mix@mail.ru | vxrulez@gmail.com\n\n\n\
Usage: fakeds.exe -file InFile -verify/-getds|-delds -out OutFile/-addds InFile -out OutFile\n\
 -file\t\t specify file for input\n\
 -verify\t verifying the digital signature of a PE-file\n\
 -getds\t\t get digital signature from PE-file\n\
 -addds\t\t specify file for input (the file after using \"-getds\")\n\
 -out\t\t specify file for output\n\
 -delds\t\t delete digital signature from file\n\n\
Examples:\n\
1. fakeds.exe -file file.exe -verify\n\
2. fakeds.exe -file file.exe -getds -out ds.bin\n\
3. fakeds.exe -file file.exe -addds ds.bin -out new_file.exe\n\
4. fakeds.exe -file file.exe -delds -out new_file.exe\n\n\n\
Enjoy!\n\n\n"); 

	if((argc <= 1) || (_tcscmp(argv[1], _TEXT("-file")) != 0))
	{
		_tprintf(strMsg);   
		return 0; 
	}

	__try
	{
		switch(argc)
		{
			case 4:	//fakeds.exe -file file.exe -verify
				if(_tcscmp(argv[3], _TEXT("-verify")) == 0)
				{
					if(FileVerify(argv[2]))
						_tprintf(_TEXT("The file is signed: OK\n"));
					else
						_tprintf(_TEXT("The file is signed: NO\n"));

					return 0; 
				}

				break;

			case 6: //fakeds.exe -file file.exe -getds -out ds.bin or //fakeds.exe -file file.exe -delds -out new_file.exe
				if(_tcscmp(argv[4], _TEXT("-out")) == 0)
				{
					if(_tcscmp(argv[3], _TEXT("-getds")) == 0)
					{
						if(GetCertFromFile(argv[2], argv[5]))
							_tprintf(_TEXT("Digital signature is saved: OK\n")); 
						else
							_tprintf(_TEXT("Digital signature is saved: NO\n"));  

						return 0; 
					}

					if(_tcscmp(argv[3], _TEXT("-delds")) == 0)
					{
						CopyFile(argv[2], argv[5], 0);
				
						if(DelCertFromFile(argv[5])) 
							_tprintf(_TEXT("Delete digital signature from file: OK\n"));
						else
							_tprintf(_TEXT("Delete digital signature from file: NO\n")); 

						return 0;
					}
				}

				break;

			case 7:	//fakeds.exe -file file.exe -ds ds.exe -out new_file.exe
				if((_tcscmp(argv[3], _TEXT("-addds")) == 0) && (_tcscmp(argv[5], _TEXT("-out")) == 0))
				{
					CopyFile(argv[2], argv[6], 0);

					if(AddCertToFile(argv[4], argv[6]))
						_tprintf(_TEXT("Add fake digital signature: OK\n")); 
					else
						_tprintf(_TEXT("Add fake digital signature: NO\n")); 

					return 0; 
				}

				break;

			default:
				break; 
		}
	}
	__except(EXCEPTION_EXECUTE_HANDLER)
	{
		_tprintf(_TEXT("processing fault\n")); 
	} 

	_tprintf(strMsg);   

    return 0;
}
/***************************************************************************************************\
*	вирмэйкинг для себя...искусство вечно 
\***************************************************************************************************/
 