#include <windows.h>
#include <stdio.h>
#include <math.h>
#include <conio.h>


  
//m1x
//pr0mix
//EOF


 
#define RVATOVA(Base, Rva)	((DWORD)Base + (DWORD)Rva)	//дэфайн - получение из RVA -> VA (k.0.) )
#define ALIGN_UP(x, y)	((x + (y - 1)) & (~(y - 1)))	//выравнивание вверх; 
#define ALIGN_DOWN(x, y)	(x & (~(y - 1)))	//вниз; 
#define MAX_BYTES 256	//всего различных байт может быть только 256 (2 в 8-ой степени ([0x00..0xFF])); 
#define MAX_SEC_NAME 8	//максимальная длина имени секции (в байтах);  
#define MAX_STR 512



//структуры
typedef struct XDATAENTROPY
{
	double sum_entr;	//здесь будет соxранена суммарная энтропия файла (либо его секций etc); 
//	double arith_mean;
//	double rat_bits;
//	int mBits[2];
}XENTR, *PXENTR;


typedef struct XMAPFILE
{
	LPVOID pExe;	//тут хранится база мэппинга
	DWORD file_size;	//а тут размер файла; 
}XMAP, *PXMAP;





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

	if((imDh->e_magic == 'ZM') && ((DWORD)imDh->e_lfanew <= 0x200))	//обязательно привести к DWORD'у, иначе будет неправильно сравнивать с числами, где установлен самый старший разряд в 1 (например, 0x8E888857 etc);  
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
*	Функция MapFile
*	мэппинг файла в память
*	ВХОД:
*		pszFileName		- имя файла, который хотим спроецировать в память
*		pxmap			- указатель на структуру XMAP. 
*	ВЫХОД:
*		0				- если что-то не получилось сделать, иначе база мэппинга;
*	Заметки:
*		pxmap			- это указатель на структуру XMAP. Если мы передаем именно 
*			указатель, то для него нужно сначала выделить память. Если же мы передаем 
*			адрес на объект, тогда все ок. А дальше структура сама и заполнится 
*			(если все пройдет отлично).
\***************************************************************************************************/
LPVOID MapFile(char *pszFileName, XMAP *pxmap)
{
	HANDLE hFile;
	HANDLE hFileMap;
	DWORD file_size;

	hFile = CreateFile(pszFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, 
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);	//открываем файл на чтение/запись

	if(hFile == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	file_size = GetFileSize(hFile, 0);	//получаем размер файла
	hFileMap = CreateFileMapping(hFile, NULL, PAGE_READWRITE, 0, 0, 0);	//создаем проекцию файла

	if(!hFileMap)	//неудачно?
	{
		CloseHandle(hFile);
		return 0; 
	}

	pxmap->pExe = MapViewOfFile(hFileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);	//проецируем файл в вирт. АП нашего процесса; 
	CloseHandle(hFileMap);
	CloseHandle(hFile); 

	if(!pxmap->pExe)
	{
		return 0;   
	}

	pxmap->file_size = file_size;

	return pxmap->pExe; 
}
/***************************************************************************************************\
*	конец функции MapFile
\***************************************************************************************************/



/***************************************************************************************************\
*	функция UnmapFile
*	освобождение ранее занятого региона (проекции файла); 
\***************************************************************************************************/
void UnmapFile(LPVOID pExe)
{
	UnmapViewOfFile(pExe); 
}
/***************************************************************************************************\
*	конец функции UnmapFile
\***************************************************************************************************/



/***************************************************************************************************\
*	функция CalcEntropy
*	вычисление энтропии (файла либо отдельного участка кода (секции));
*	ВХОД:
*		pBuffer		- буфер, где хранятся данные (байты), энтропию которых надо посчитать
*		buf_size	- размер этого буфера (в байтах);
*		pxentr		- указатель на структуру XENTR;
*		num			- выводить дополнительную информацию или нет (0 - нет, 1 - да); 
*	ВЫХОД:
*		вычисленная энтропия заданных (в pBuffer) байт; 
*	Заметки:
*		pxentr		- указатель на структуру XENTR. Если мы передаем именно 
*			указатель, то для него нужно сначала выделить память. Если же мы передаем 
*			адрес на объект, тогда все ок. А дальше структура сама и заполнится 
*			(если все пройдет отлично).
\***************************************************************************************************/
double CalcEntropy(char *pBuffer, DWORD buf_size, XENTR *pxentr, int num)
{
	int mFreq[MAX_BYTES];
	double mProb[MAX_BYTES];
	double mEntr[MAX_BYTES];
	double ln2 = log(2);
	unsigned int i;
	BYTE bch = 0;

	for(i = 0; i < MAX_BYTES; i++)
	{
		mFreq[i] = 0;
	}

	for(i = 0; i < buf_size; i++)
	{
		bch = pBuffer[i];
		mFreq[bch]++;
	}

	if(num)
		printf("byte \t\t frequency \t\t probability \t\t entropy\n");
	
	for(i = 0; i < MAX_BYTES; i++)
	{
		mProb[i] = (double)mFreq[i] / (double)buf_size; 

		if(mProb[i])
		{
			mEntr[i] = -mProb[i] * log(mProb[i]) / ln2;
			pxentr->sum_entr += mEntr[i];

			if(num)
				printf("0x%02X \t\t %010d \t\t %.4f \t\t %.4f\n", i, mFreq[i], mProb[i], mEntr[i]);  
		}
	}

	return pxentr->sum_entr; 
}
/***************************************************************************************************\
*	конец функции CalcEntropy
\***************************************************************************************************/



/***************************************************************************************************\
*	функция EntropyFile
*	Вычисление энтропии файла
*	ВХОД:
*		pszFileName		- имя файла, энтропию которого хотим посчитать
*		pxentr			- указатель на структуру XENTR (читай выше)
*		pxmap			- указатель нас структуру XMAP
*		num				- какую инфу выводить: основную или "дополнительную" (0 - основная, 1 - "дополнительная"); 
*	ВЫХОД:
*		1				- if all ok, else fucking 0; 
\***************************************************************************************************/
BOOL EntropyFile(char *pszFileName, XENTR *pxentr, XMAP *pxmap, int num) 
{
	memset(pxentr, 0, sizeof(XENTR));
	memset(pxmap, 0, sizeof(XMAP));
	
	if(!MapFile(pszFileName, pxmap))	//мэппинг файла в память;
		return 0;
	
	CalcEntropy((char*)pxmap->pExe, pxmap->file_size, pxentr, num);	//подсчет энтропии; 

	if(!num)
		printf("[File]\n\t\t Offset \t\t Size \t\t\t Entropy\n\t\t0x%08X \t\t 0x%08X \t\t %.4f\n", 
		0, pxmap->file_size, pxentr->sum_entr);

	UnmapFile(pxmap->pExe);

	return 1; 
}
/***************************************************************************************************\
*	конец функции EntropyFile
\***************************************************************************************************/


 
/***************************************************************************************************\
*	функция EntropySec
*	Вычисление энтропии различных частей файла (его заголовков, секций, оверлея etc); 
*	ВХОД:
*		pszFileName		- имя файла, энтропию которого хотим посчитать
*		pxentr			- указатель на структуру XENTR (читай выше)
*		pxmap			- указатель нас структуру XMAP
*		num				- выводить основную или "дополнительную" инфу; 
*	ВЫХОД:
*		1				- if all ok, else fucking 0; 
*	Заметки:
*		при необходимости можно добавить подсчет энтропии тех оверлеев, которые могут быть между 
*		секциями файла на диске; 
\***************************************************************************************************/
BOOL EntropySec(char *pszFileName, XENTR *pxentr, XMAP *pxmap, int num) 
{
	IMAGE_DOS_HEADER *imDh;
	IMAGE_NT_HEADERS *imNTh;
	IMAGE_SECTION_HEADER *imSh; 
	DWORD sec_size = 0;
	DWORD xoffset = 0; 
	int i = 0;
	DWORD end_last_sec = 0;
	DWORD end_tmp_sec = 0;
	DWORD overl_size = 0; 
	char szSecName[MAX_SEC_NAME + 1];

	memset(pxentr, 0, sizeof(XENTR));	//обнуляем наши струтурки 
	memset(pxmap, 0, sizeof(XMAP));
	
	if(!MapFile(pszFileName, pxmap))	//мэппинг файла
		return 0;

	if(!ValidPE(pxmap->pExe))	//проверка файла на валидность; 
		return 0; 

	imDh = (IMAGE_DOS_HEADER*)pxmap->pExe; 
	imNTh = (IMAGE_NT_HEADERS*)((DWORD)pxmap->pExe + imDh->e_lfanew);
	imSh = (IMAGE_SECTION_HEADER*)((DWORD)imNTh + 4 + sizeof(IMAGE_FILE_HEADER) + imNTh->FileHeader.SizeOfOptionalHeader);
	
	//ЁБА! физический адрес секции выравнивается на нижнюю границу! 
	sec_size = ALIGN_DOWN(imSh->PointerToRawData, imNTh->OptionalHeader.FileAlignment);
	
	if(sec_size)
	{
		if(num)
		{
			printf("---------------------------------------------------------------------------\n[Headers]\n");
		}

		CalcEntropy((char*)pxmap->pExe, sec_size, pxentr, num); //кстати, можно и не считать энтропию заголовков, но пускай будет;  

		if(!num)
		{
			printf("[Headers]\n\t\t Offset \t\t Size \t\t\t Entropy\n"); 
			printf("\t\t 0x%08X \t\t 0x%08X \t\t %.4f\n\n", 0, sec_size, pxentr->sum_entr);
		}
	} 

	if(!num)
		printf("[Sections]\nName \t\t Offset \t\t Size \t\t\t Entropy\n"); 
	else
		printf("\n---------------------------------------------------------------------------\n[Sections]\nName\n");

	for(i = 0; i < imNTh->FileHeader.NumberOfSections; i++)	//проход по секциям;
	{
		sec_size = imSh->SizeOfRawData;	//размер для начала устанавливаем равным физическому размеру секции;  
		xoffset = ALIGN_DOWN(imSh->PointerToRawData, imNTh->OptionalHeader.FileAlignment);	//получаем начало секции на диске;   
		
		if(((imSh->Misc.VirtualSize < imSh->SizeOfRawData) && imSh->Misc.VirtualSize) || !imSh->SizeOfRawData)	//будем юзать самый минимальный ненулевой размер; 
		{
			if(((i + 1) < imNTh->FileHeader.NumberOfSections) && !imSh->SizeOfRawData)	//если же текущая рассматриваемая секция не последняя и физический ее размер = 0, то 
			{
				sec_size = ALIGN_DOWN(((IMAGE_SECTION_HEADER*)((DWORD)imSh + 
					sizeof(IMAGE_SECTION_HEADER)))->PointerToRawData, imNTh->OptionalHeader.FileAlignment) - xoffset; //узнаем ее размер так: физический адрес следующей секции (оффсет) - физ. адрес текущей секции. Всё это дело выравнивается; 
			}
			else
			{
				sec_size = imSh->Misc.VirtualSize;	//иначе 
			}	
		}

		end_tmp_sec = xoffset + imSh->SizeOfRawData;	//да, вот такая хуерга может быть, что если мы выравняем физ. размер секции, то получим неверные резалты, поэтому лучше брать оригинальный физ. размер секции; 	//ALIGN_UP(imSh->SizeOfRawData, imNTh->OptionalHeader.FileAlignment);		
		end_last_sec =  (end_last_sec <= end_tmp_sec) ? end_tmp_sec : end_last_sec;	//тут будем хранить конец последней секции на диске; последняя секция необязательно может быть последней в таблице секций;  
		memset((PVOID)szSecName, 0, MAX_SEC_NAME);
		memset(pxentr, 0, sizeof(XENTR));
		strncpy(szSecName, (char*)imSh->Name, MAX_SEC_NAME);	//скопируем в свой буфер имя секции; 
		szSecName[MAX_SEC_NAME] = 0; 
		
		if(sec_size)
		{
			if(num)
			{
				printf("\n%s\n", szSecName);  
			}

			//тогда найдем оффсет и прибавим базу мэппинга -> получится абсолютный адрес в памяти; 
			CalcEntropy((char*)((DWORD)xoffset + (DWORD)pxmap->pExe), sec_size, pxentr, num);	//считаем энтропию очередной секции; 	
			
			if(!num)
				printf("%s \t\t 0x%08X \t\t 0x%08X \t\t %.4f\n", szSecName, xoffset, sec_size, pxentr->sum_entr);  
		}
 
		imSh++;  
	}
 
	overl_size = pxmap->file_size - end_last_sec;	//размер возможного оверлея;   
	
	if(overl_size)	//оверлей есть?
	{ 
		if(num)
			printf("\n---------------------------------------------------------------------------\n[Overlay]\n"); 

		memset(pxentr, 0, sizeof(XENTR));
		CalcEntropy((char*)((DWORD)pxmap->pExe + end_last_sec), overl_size, pxentr, num);	//считаем его: адрес - это конец последней секции на диске, размер - это разность размера файла и адреса (конец последней секции на диске);  		
		
		if(!num)
			printf("\n[Overlay]\n\t\t Offset \t\t Size \t\t\t Entropy\n\t\t 0x%08X \t\t 0x%08X \t\t %.4f\n", 
			end_last_sec, overl_size, pxentr->sum_entr); 
	}

	UnmapFile(pxmap->pExe);	//освобождаем больше ненужный регион
 	 
	return 1;  
}
/***************************************************************************************************\
*	конец функции EntropySec
\***************************************************************************************************/



/***************************************************************************************************\
*	функция LowEntropy
*	снижение энтропии файла 
*	один из способов снизить энтропию (что заюзан в данной функе) - это отрезать у 
*	каждого байта по 2 бита. То есть у каждых трёх байт отрезаем по 2 бита. Затем 
*	записываем после этих байт еще один (свой) байт, состоящий из предыдущих 
*	отрезанных битов. Таким образом у каждого байта будут "рабочими" только 6 бит. 
*	Кол-во различных байт сократится с 256 (2 в 8-ой степени) до 64 вариантов (2 в 
*	6-ой степени). И энтропия, соответственно снизится до 6.00 по определению. 
*	ВХОД:
*		pszExistFileName	- файл, энтропию которого будем снижать
*		pszNewFileName		- новый файл, в который запишем скорректированные байты
*	ВЫХОД:
*		1					- если все отлично прошло, иначе 0; 
*	Заметки:
*		Эту функу следует рассматривать как пример того, если бы мы хотели зашифровать 
*		какой-то участок кода и затем понизить его энтропию; 
\***************************************************************************************************/
BOOL LowEntropy(char *pszExistFileName, char *pszNewFileName)
{
	HANDLE hFile1;
	HANDLE hFile2;
	char *pBuffer1;
	char *pBuffer2;
	DWORD file_size1; 
	DWORD file_size2;
	DWORD num_bytes = 0; 
	DWORD mod = 0;
	unsigned int i =0;
	int j = 0;
	char new_byte = 0;
	int cnt = 0; 

	hFile1 = CreateFile(pszExistFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 
		NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL); //открываем файл на чтение/запись (но нам нужно только на чтение); 

	if(hFile1 == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	hFile2 = CreateFile(pszNewFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 
		NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL); //создаем файл для чтения/записи; 

	if(hFile2 == INVALID_HANDLE_VALUE)
	{
		CloseHandle(hFile1);  
		return 0;
	}

	file_size1 = GetFileSize(hFile1, 0);	//узнаем размер открытого файла; 
	pBuffer1 = (char*)malloc(sizeof(char) * file_size1 + 1);

	//далее читаем в буфер pBuffer1 из файла file_size1 байт (полностью); 
	if(!ReadFile(hFile1, pBuffer1, file_size1, &num_bytes, NULL)) //при этом file_size1 - num_bytes = 0, это при успешном чтении!  
	{
		CloseHandle(hFile1);
		CloseHandle(hFile2);
		free(pBuffer1);
		return 0;  
	}

	mod = file_size1 % 3;	//так как мы будем вставлять новые байты через каждые 3 байта, то узнаем сначала, кратен ли размер файл 3; 
							//например, у нас есть файл размером в 7 байт. Получится так, что мы обработаем сначала первые 3 байта и впишем один новый байт.
							//далее обработаем следующие три байта и снова впишем один новый байт. Далее обработаем оставшийся 1 байт. Но так как мы достигли конца файла, 
							//то нам надо предусмотреть и запись нового байта даже несмотря на то, что не набралось 3-х байт. 
	file_size2 = file_size1 + (file_size1 / 3) + (mod != 0);	//размер нового файла вычисляем так:
																//размер окрытого файла (hFile1) + кол-во новых байт (которые записываем по одному через каждые 3 байта) + (0 или 1 байт - это если размер не кратен трём (это "новый" байт); 
	pBuffer2 = (char*)malloc(sizeof(char) * file_size2 + 1);	//выделяем память под новый буфер;  
 
	for(i = 0, j = 0; i < file_size1; i++, j++)	//и далее начнем корректировать байты
	{
		pBuffer2[j] = pBuffer1[i];	//сначала сохраним очередной байт в новом буфере;  
		pBuffer2[j] ^= 0x5F;	//далее зашифруем его 
		new_byte = (new_byte | (((pBuffer2[j] & 0xC0) >> 6) << (cnt * 2)));	//далее создаем на основе очередных 3-х байтов новый байт так:
																			//отрезаем старшие 2 бита 1-ого байта (из очередных 3-х байт) и сохраняем их в первые 2 младшие бита (позиция 0-1) нового байта;
																			//отрезаем старшие 2 бита 2-ого байта и сохраняем их в следующие 2 младших бита (2-3) нового байта; 
																			//отрезаем старшие 2 бита 3-его байта и сохраняем их в следющие 2 младших бита (4-5) нового байта; 
		++cnt;	//корректируем счётчик;
		pBuffer2[j] = pBuffer2[j] & 0x3F;	//и сбрасываем (в 0) в байте биты, которые только что сохранили в новом байте (new_byte); 
		
		if((cnt == 3) || (((i + 1) == file_size1) && mod))	//если мы уже 3 байта обработали, то запишем после них новый созданный байт (new_byte), хранящий потёртые биты предыдущих 3-х байт;  
		{
			++j;											//или если мы обрабатываем последний байт, и размер открытого файла (hFile1) не был кратен трём, то допишем еще один новый байт (new_byte);  
			pBuffer2[j] = new_byte; 
			new_byte = 0;
			cnt = 0;
		}
	}
 
	num_bytes = 0; 
	WriteFile(hFile2, pBuffer2, file_size2, &num_bytes, NULL);	//запишем в новый файл буфер pBuffer2; 
	CloseHandle(hFile1);
	CloseHandle(hFile2);
	free(pBuffer1);
	free(pBuffer2); 

	return 1;
}
/***************************************************************************************************\
*	конец функции LowEntropy
\***************************************************************************************************/



/***************************************************************************************************\
*	функция RestEntropy
*	Функция, восстанавливающая файл, энтропию которого мы понижали
*	ВХОД:
*		pszExistFileName	- файл, который будем восстанавливать; 
*		pszNewFileName		- новый файл, в который запишем скорректированные байты
*	Заметки:
*		Эту функу следует рассматривать как пример того, если бы мы хотели восстановить 
*		какой-то участок кода, который мы ранее шифровали, и энтропию которого мы 
*		понижали; 
\***************************************************************************************************/
BOOL RestEntropy(char *pszExistFileName, char *pszNewFileName)
{
	HANDLE hFile1;
	HANDLE hFile2;
	char *pBuffer1;
	char *pBuffer2;
	DWORD file_size1; 
	DWORD file_size2;
	DWORD num_bytes = 0; 
	DWORD mod = 0;
	unsigned int i =0;
	int j = 0;
	int ii = 0;
	char new_byte = 0;
	int cnt = 0; 
	int mBytes[5];

	hFile1 = CreateFile(pszExistFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 
		NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);	//открываем файл для чтения/записи

	if(hFile1 == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	hFile2 = CreateFile(pszNewFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 
		NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL); //создаем новый файл для чтения/записи

	if(hFile2 == INVALID_HANDLE_VALUE)
	{
		CloseHandle(hFile1);  
		return 0;
	}

	file_size1 = GetFileSize(hFile1, 0);	//получаем размер открытого файла (hFile1);
	pBuffer1 = (char*)malloc(sizeof(char) * file_size1 + 1);

	//далее читаем в буфер pBuffer1 из файла file_size1 байт (полностью); 
	if(!ReadFile(hFile1, pBuffer1, file_size1, &num_bytes, NULL)) //при этом dwSize - num_bytes = 0, это при успешном чтении!  
	{
		CloseHandle(hFile1);
		CloseHandle(hFile2);
		free(pBuffer1);
		return 0;  
	}

	mod = file_size1 % 4;	//так как мы будем восстанавливать файл, то через каждые 3 байта мы должны удалить 4 байт (он был ранее вставлен), но перед этим узнаем сначала, кратен ли размер файла 4; 
	file_size2 = file_size1 - (file_size1 / 4) - (mod != 0);	//размер нового файла вычисляем так:
																//размер окрытого файла (hFile1) - кол-во новых байт (которые записывали по одному через каждые 3 байта) - (0 или 1 байт - это если размер не кратен четырём)	 
	pBuffer2 = (char*)malloc(sizeof(char) * file_size2 + 1);	//выделяем память для нового буфера (pBuffer2);  
 
	if(mod)
	{
		file_size1 = file_size1 - 1;	//если размер открытого файла не кратен 4-ым, то отнимем 1 байт;  
	}

	for(i = 0, j = 0; i < file_size1; i++)	//понеслась; 
	{
		mBytes[cnt] = pBuffer1[i];	//сначала сохраним текущий байт в новом буфере для восстановления; 

		if((cnt == 3) || (((i + 1) == file_size1) && mod))
		{
			if((i + 1) == file_size1)	//если размер файла не был равен 4-м и мы обрабатываем(ли) последний байт, 
			{
				++cnt;					//все предыдущие байты были считаны в буфер, осталося еще один, новый байт, хрaнящий биты необработанных байт. Так вот, обработаем их; 
				mBytes[cnt] = pBuffer1[i + 1];  
			}

			for(ii = 0; ii < cnt; ii++, j++)	//восстанавливаем (см выше); 
			{
				mBytes[ii] = (mBytes[ii] | ((mBytes[cnt] & (0x03 << (ii * 2))) << (6 - ii * 2)));
				mBytes[ii] ^= 0x5F; 
				pBuffer2[j] = mBytes[ii];
			}
		
			cnt = 0;
			continue;
		} 
		
		cnt++; 
	}

	num_bytes = 0; 
	WriteFile(hFile2, pBuffer2, file_size2, &num_bytes, NULL);
	CloseHandle(hFile1);
	CloseHandle(hFile2); 
	free(pBuffer1);
	free(pBuffer2); 

	return 1; 
}
/***************************************************************************************************\
*	конец функции RestEntropy
\***************************************************************************************************/
 




/***************************************************************************************************\
*	наша входная функа main; 
\***************************************************************************************************/
int main(int argc, char** argv)
{
	//эта строка будет выводиться, например, если вызвать через командную строку прогу без параметров; 
	char szMsg[] = 
		"xentr v1.0 by pr0mix\n\
mail: pr0mix@mail.ru | vxrulez@gmail.com\n\n\n\
Usage: xentr.exe -file InputFile -entr|-low|-rest 0,1,2|OutputFile [-info 0,1]\n\n\
 -file\t\t specify file for input\n\n\
 -entr\t\t calculate entropy:\n \t\t 0 - file\n \t\t 1 - part file (headers, sections etc)\n \t\t 2 - file & part file\n\n\
 -info\t\t show info:\n \t\t 0 - basic\n \t\t 1 - more\n \t\t This option only works with \"-entr\" 0,1\n\n\
 -low\t\t reduce entropy file (this is just an example of reducing the\n \t\t entropy. Look at the source code). Specify file for output\n\n\
 -rest\t\t restoration entropy (file) after the action \"-low\". Specify\n \t\t file for output\n\n\n\
Examples:\n\
1. xentr.exe -file C:\\123\\test1.exe -entr 0\n\
2. xentr.exe -file C:\\123\\test1.exe -entr 1\n\
3. xentr.exe -file C:\\123\\test1.exe -entr 2\n\
4. xentr.exe -file C:\\123\\test1.txt -entr 0\n\
5. xentr.exe -file C:\\123\\test1.exe -entr 0 -info 1\n\
6. xentr.exe -file C:\\123\\test1.exe -entr 1 -info 1\n\
7. xentr.exe -file C:\\123\\test1.exe -low C:\\123\\let1.exe\n\
8. xentr.exe -file C:\\123\\let1.exe -rest C:\\123\\ret1.exe\n\n\n\
Enjoy!\n\n\n"; 
	int len1 = 0;
	int num = 0; 
	XENTR xentr1;
	XMAP xmap1;
	BOOL f_status = 0;

	if((argc == 5) || (argc == 7))	//например, StaIT.exe -file C:\Games -log C:\Logs\xImp.txt
	{			
		if(strcmp(argv[1], "-file") == 0)// && (strcmp(argv[3], "-log") == 0))
		{
			len1 = strlen(argv[4]);

			if((strlen(argv[2]) >= MAX_STR) || (len1 >= MAX_STR))
			{
				printf("%s", szMsg);
				//printf("ERROR: maximum length of string = %d (MAX_STR)\n", MAX_STR);
				return 0;
			}

			if(strcmp(argv[3], "-low") == 0)
			{
				if(LowEntropy(argv[2], argv[4]))
					printf("Status: OK\n"); 
				else
					printf("Status: FAULT\n");
			}
			else if(strcmp(argv[3], "-rest") == 0)
			{
				if(RestEntropy(argv[2], argv[4]))
					printf("Status: OK\n");
				else
					printf("Status: FAULT\n");
			}
			else if(strcmp(argv[3], "-entr") == 0)
			{
				if(argc == 7)
				{
					num = strlen(argv[6]);

					if((strcmp(argv[5], "-info") == 0) && (num <= 2))
					{
						num = atoi(argv[6]);
					}
					else
					{
						printf("%s", szMsg);
						return 0;
					}
				} 

				if((len1 > 1) || ((argv[4][0] != '0') && (argv[4][0] != '1') && (argv[4][0] != '2')))
				{
					printf("%s", szMsg);
					return 0;
				}

				printf("===========================================================================\n\t\t\t\t FILE\n\n[Path]\n%s\n\n", argv[2]);
				
				__try
				{
					switch(argv[4][0])
					{
						case '0':
							f_status = EntropyFile(argv[2], &xentr1, &xmap1, num);
							break;
						case '1':
							f_status = EntropySec(argv[2], &xentr1, &xmap1, num);
							break;
						default:
							f_status = EntropyFile(argv[2], &xentr1, &xmap1, 0);
							f_status = EntropySec(argv[2], &xentr1, &xmap1, 0);  
					};

					printf("\n[Size]\n%d byte(s)\n", xmap1.file_size);
				}
				__except(EXCEPTION_EXECUTE_HANDLER)
				{ 
				}

				printf("===========================================================================\n");  

				if(f_status)
					printf("Status: OK\n");
				else
					printf("Status: FAULT\n");
			}
			else
			{
				printf("%s", szMsg);
				//printf("ERROR: incorrect 2 parameter\n"); 
				return 0;
			}
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

	return 0;
}
/***************************************************************************************************\
*	вирмэйкинг для себя...искусство вечно 
\***************************************************************************************************/