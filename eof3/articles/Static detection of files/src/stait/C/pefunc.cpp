/***************************************************************************************************************\
*																												*
*								МОДУЛЬ ДЛЯ РАБОТЫ С PE32-FILES (IMPORT TABLE)									*
*												(ОПРЕДЕЛЕНИЯ)													* 
*																												*
*				Проверка файла на соответствие PE, переводы RVA в оффсеты, парсинг импорта etc					*
*																												*
*										ValidPE, RVATpOffset, PrImport											*
*																												*
\***************************************************************************************************************/



#include "pefunc.h"



//list_dll ld;



/***************************************************************************************************\
*	Функа ValidPE;
*	проверка файла на соответствие формату PE32;
*	Вход:
*		pExe	-	база мэппинга (адрес файла в памяти (MapViewOfFile) aka начальный адрес 
*						отображаемого представления); 
*	Выход:
*		1		-	если файл валидный, иначе 0;  
\***************************************************************************************************/
BOOL ValidPE(LPVOID pExe)
{
	IMAGE_DOS_HEADER *imDh = (IMAGE_DOS_HEADER*)pExe;  
	IMAGE_NT_HEADERS *imNTh;

	if((imDh->e_magic == 'ZM') && ((DWORD)imDh->e_lfanew < 0x200))	//обязательно привести к DWORD'у, иначе будет неправильно сравнивать с числами, где установлен самый старший разряд в 1 (например, 0x8E888857 etc);  
	{
		imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew);
		
		if((imNTh->Signature == 'EP') && 
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
*	Функа RVAToOffset
*	перевод RVA в файловое смещение (а точнее мы получим абсолютный адрес в файле);
*	ВХОД:
*		pExe	-	база мэпинга;
*		Rva		-	RVA;
*	ВЫХОД:
*		абсолютный адрес в файле либо 0, если произошла какая-то хуйня;  
\***************************************************************************************************/
DWORD RVAToOffset(LPVOID pExe, DWORD Rva)
{
	IMAGE_DOS_HEADER *imDh = (IMAGE_DOS_HEADER*)pExe;
	IMAGE_NT_HEADERS *imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew);
	IMAGE_SECTION_HEADER *imSh = (IMAGE_SECTION_HEADER*)((DWORD)imNTh + 4 + sizeof(IMAGE_FILE_HEADER) + 
								  imNTh->FileHeader.SizeOfOptionalHeader); 
	DWORD size = 0;
	DWORD xoffset = 0; 

	if((Rva >= 0) && (Rva < imSh->VirtualAddress))
		return (DWORD)((DWORD)pExe + Rva);	//если rva не принадлжеит никакой секции, значит вычислять ничего не надо;

	for(int i = 0; i < imNTh->FileHeader.NumberOfSections; i++)	//проход по секциям;
	{
		size = imSh->SizeOfRawData; 	
		
		if(((imSh->Misc.VirtualSize < imSh->SizeOfRawData) && imSh->Misc.VirtualSize) || !imSh->SizeOfRawData)	//будем юзать самый минимальный ненулевой размер; 
		{
			size = imSh->Misc.VirtualSize;
		}
 
		if((Rva >= imSh->VirtualAddress) && (Rva < (imSh->VirtualAddress + size)))		//если мы нашли секцию, в которую указывает этот самый rva, 
		{
			//ЁБА! физический адрес секции выравнивается на нижнюю границу! 
			xoffset = (DWORD)pExe + Rva - imSh->VirtualAddress + ALIGN_DOWN(imSh->PointerToRawData, imNTh->OptionalHeader.FileAlignment);	//тогда найдем оффсет и прибавим базу мэппинга -> получится абсолютный адрес в памяти; 
		}

		imSh++; 
	}
	return xoffset;	//возвращаем вычисленный абсолютный адрес; 
}
/***************************************************************************************************\
*	Конец функи RVAToOffset; 
\***************************************************************************************************/



/***************************************************************************************************\
*	Функция PrImport;
*	Обработка таблицы импорта;
*	ВХОД:
*		pszFileName	-	путь к файлу, таблицу импорта которого мы и должны обработать;
*	ВЫХОД:
*		1			-	если все отлично, иначе 0; 
\***************************************************************************************************/
BOOL WINAPI PrImport(char *pszFileName)
{
	int i = 1;	//вспомогательная переменная
	int len = 10; //8 + 2;
	DWORD xFirstThunk; 
	HANDLE hFile = CreateFile(pszFileName, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);	//открываем файл для чтения;
	
	if(hFile == INVALID_HANDLE_VALUE)	//неудачно?
	{
		return 0;
	}

	HANDLE hFileMap = CreateFileMapping(hFile, 0, PAGE_READONLY, 0, 0, 0); //создаем проекцию файла;
 
	if(!hFileMap)
	{
		CloseHandle(hFile);  
		return 0;
	}

	LPVOID pExe = MapViewOfFile(hFileMap, FILE_MAP_READ, 0, 0, 0);	//проецируем файл;
	CloseHandle(hFile);
	CloseHandle(hFileMap);

	if(!pExe)
	{
		return 0;
	}
 
	if(!ValidPE(pExe))	//проверка файла на валидность; 
	{
		return 0;
	}

	IMAGE_DOS_HEADER *imDh = (IMAGE_DOS_HEADER*)pExe;
	IMAGE_NT_HEADERS *imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew);

	DWORD impRva = imNTh->OptionalHeader.DataDirectory[1].VirtualAddress;	//x; 
	DWORD impSize = imNTh->OptionalHeader.DataDirectory[1].Size; 

	if(!impRva || !impSize)	//имеется ли вообще таблица импорта у проверяемого файла?
	{
		return 0;
	}

	DWORD offset = RVAToOffset(pExe, impRva);	//если да, то получим абсолютный адрес (АА) таблицы импорта в проецируемом файле;
	
	if(!offset)
	{
		return 0; 
	}

	IMAGE_IMPORT_DESCRIPTOR *imId = (IMAGE_IMPORT_DESCRIPTOR*)offset;	//IMPORT TABLE;

	while((imId->OriginalFirstThunk || imId->FirstThunk) && impSize)	//последний элемент втаблице импорта равен 0;
	{	
		char *pszDllName = (char*)RVAToOffset(pExe, (DWORD)imId->Name);	//указатель на имя импортируемой длл;
		char *pszFuncName;
		char *pszDllNameLower; // = strdup(pszDllName);	//продублируем это имя и сохраним указатель в pszDllNameLower; 	//Dll Name Lower = DNL;  		
		IMAGE_THUNK_DATA32 *imTd = (IMAGE_THUNK_DATA32*)RVAToOffset(pExe, imId->OriginalFirstThunk);	//x; 
		IMAGE_IMPORT_BY_NAME *imIbn;

		if(!pszDllName || !imTd)
			return 0;

		pszDllNameLower = strdup(pszDllName); 	//продублируем это имя и сохраним указатель в pszDllNameLower; 	//Dll Name Lower = DNL;  
							
//		printf("%s\n", pszDllName);	
		StrToLower(pszDllNameLower);	//переведем имя длл в нижний регистр (для того, чтобы у нас не было в списке одной и той же длл как 2 разных элемента (например, "KERNEL32.dll" и "KERNEL32.DLL" -> "kernel32.dll"); 
		AddElemDll(&ld, pszDllNameLower);	//добавим имя длл и другие данные в список (см. в сорцы) или проинкрементируем счетчик в нужном элементе списка, если имя длл уже есть в данном списке;  

		if(!imId->OriginalFirstThunk)	//такую подставу-засаду делают борландцы (и не только), поэтому подстрахуемся )
		{	
			//для стандартных файлов, imTd будет содержать ненулевое (корректное) значение. В остальных случаях возможен 0. 
			//(imId->FirstThunk может содержать значение (число), явно не указывающее в отображаемое представление файла, 
			//как, например, файлы, запакованные upack'ом); 
			//тут фишка в том, что часть дворда (например, пару байтов от этого поля) FirstThunk будет лежать в пределах (1) какой-то секции - 
			//между ее физическими адресом и размером (при этом мы размер не округляем, а берем такой, какой прописан в файле), а другая часть - 
			//за этими пределами, но в пределах виртуальных данных (2): адреса и размера. 
			//Та часть, что лежит в (1), будет содержать нормальный RVA, а та, что в (2) - мусор. Поэтому и получается хуевое число (например, FirstThunk = 0x11E800B3, 11E8 - это нормальный RVA, а вот 00B3 - это уже мусор). 
			//Но системному лоадеру на это похуй, ибо он при загрузке файла ту часть, что в (2) - обнуляет - и в итоге у нас получается нормальное RVA. 
			//Ну а после проецирования секций в памяти, происходят манипуляции с данными импорта и т.п. И все норм пашет. 
			//Поэтому мы должны отсечь этот мусор и оставить только RVA;    
			//приступим; 
			imTd = (IMAGE_THUNK_DATA32*)RVAToOffset(pExe, imId->FirstThunk);	//x; 

			if(!imTd)	//если 0, значит файл с нестандартной структурой; 
			{
//				MessageBox(0,0,0,0);
				xFirstThunk = imId->FirstThunk;
				
				//ищем rva;
				while(!imTd && (i < 9))	//4 * 8 (бит) = 32 (бита) = 1 dword = 4 bytes; 
				{
					xFirstThunk = xFirstThunk & (0xFFFFFFFF >> (i * 4));	//и отсекаем старшие разряды (там мусор);
					imTd = (IMAGE_THUNK_DATA32 *)RVAToOffset(pExe, xFirstThunk);	//снова пробуем получить корректный адрес; 
					i++;
				}

				if(!imTd)	//если мы так и не получили нормульного адреса, выходим; 
				{
					free(pszDllNameLower); 
					return 0; 
				}
			}
		}
		
		while(imTd->u1.Ordinal)	//последний элемент будет равен 0;
		{
			if(imTd->u1.Ordinal & 0x80000000)	//функа импортируется по ординалу?
			{
				pszFuncName = (char*)malloc(sizeof(char) * len + 1);	//выделим память для хранения орлинала (+ мелочи); 
				strcpy(pszFuncName, "0x");
				itoa((imTd->u1.Ordinal & 0x7FFFFFFF), (char*)&pszFuncName[2], 16);	//ординал будем хранить строкой, например, так: 0x10, 0xA, 0x15 etc; 
			}
			else	//иначе функа импортируется по имени;
			{
				imIbn = (IMAGE_IMPORT_BY_NAME*)RVAToOffset(pExe, (DWORD)imTd->u1.AddressOfData);
				pszFuncName = (char*)malloc(sizeof(char) * strlen((char*)imIbn->Name) + 1);	//выделим память для хранения строки; 
				strcpy(pszFuncName, (char*)imIbn->Name);	//скопируем строку;	
			}

//			printf("%s\n", pszFuncName);
			AddElemFunc(&ld, pszDllNameLower, pszFuncName);	//добавим имя функи и другие данные в список (см. в сорцы) или проинкрементируем счетчик в нужном элементе списка, если имя функи уже есть в данном списке;
			free(pszFuncName);	//освободим ранее выделенную память; 
			imTd++;
		}

//		printf("\n\n");
		free(pszDllNameLower);  		 
		impSize -= sizeof(IMAGE_IMPORT_DESCRIPTOR); 
		imId++; 	 
	}

	UnmapViewOfFile(pExe);	//освобождаем регион; 	 
	return 1;	//на выход; 
}
/***************************************************************************************************\
*	Конец функи PrImport;  
\***************************************************************************************************/
  
 


