#include <windows.h>
#include <stdio.h>



//m1x
//pr0mix
//EOF 



//размер (IMAGE_DOS_HEADER + DOS Stub) 
#define MZSTUB_SIZE	0x80
#define MAGIC_NUMBER 0x10000	//данное число есть только походу в файлах, собранных на msvc (VC++ (6)). На других, собранных, например, в masm etc - числа этого нет; 
#define MAX_RICH_OFFSET 16*10



//эти значения взяты из разных rich-сигнатур (сперва ее нужно рас'xor'ить), принадлежащих различным PE-файлам
//эти значения представляют собой инфу о версиях компилера/линкера, + возможно некоторых флагах/опциях компиляции
DWORD comp_id[]=
{
	0x00021C6A, 0x00041F6F, 0x00041FE8, 0x000420FF,
    0x000520FF, 0x000606C7, 0x0006082A, 0x00060856,
    0x000A1F6F, 0x000A1FE8, 0x000A20FF, 0x000A225F,
    0x000A2306, 0x000B1F6F, 0x000B2306, 0x000C1C7B,
    0x000E1C83, 0x000F0C05, 0x001220FC, 0x00131F62,
    0x00131F8E, 0x00131FBC, 0x00132359, 0x00192353,
    0x001923FA, 0x001C23DA, 0x001C24FA, 0x001D24FA,
    0x0023209E, 0x002723CA, 0x002A2263, 0x003D23FA,
    0x003D24FA, 0x004023FA, 0x004024FA, 0x00452397,
    0x005A0C05, 0x005C0C05, 0x005D0813, 0x005D0883,
    0x005D0C05, 0x005F088E, 0x005F0C05, 0x005F0D0F,
    0x005F0D15, 0x00600C05, 0x00600C7A, 0x00600C84,
    0x00600D0F, 0x00600D15, 0x00690813, 0x007B7920,            	
    0x00162306, 0x000A2636, 0x000B2636, 0x00302354, 
    0x005F0FC3, 0x005D0FC3, 0x000B2179, 0x00042179,  
};


//IMAGE_DOS_HEADER и DOS Stub 
unsigned char mzhdr_dosstub[]=
{
	0x4D, 0x5A, 0x90, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00,  
	0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00,
	0x0E, 0x1F, 0xBA, 0x0E, 0x00, 0xB4, 0x09, 0xCD, 0x21, 0xB8, 0x01, 0x4C, 0xCD, 0x21, 0x54, 0x68,
	0x69, 0x73, 0x20, 0x70, 0x72, 0x6F, 0x67, 0x72, 0x61, 0x6D, 0x20, 0x63, 0x61, 0x6E, 0x6E, 0x6F,
	0x74, 0x20, 0x62, 0x65, 0x20, 0x72, 0x75, 0x6E, 0x20, 0x69, 0x6E, 0x20, 0x44, 0x4F, 0x53, 0x20,
	0x6D, 0x6F, 0x64, 0x65, 0x2E, 0x0D, 0x0D, 0x0A, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};
		




/****************************************************************************************************************************\
*	функа CheckRich
*	проверка rich-signature на целостность
*	Вход:
*		pMem - адрес в памяти, где расположена рич-сигна
*	Выход:
*		1    - если рич-сигна "правильная", иначе 0
\****************************************************************************************************************************/     
BOOL CheckRich(LPVOID pMem)
{
	BYTE *pRich = (BYTE*)pMem;											//pRich - указатель на IMAGE_DOS_HEADER
	DWORD sum = MZSTUB_SIZE; 
	DWORD e_lfanew = *(DWORD*)(pRich + 0x3C);							//сохраним значение e_lfanew
	*(DWORD*)(pRich + 0x3C) = 0;										//а после обнулим его (так как оно может быть разным)
	DWORD tmp1 = 0, tmp2 = 0;
	DWORD i = 0, j = 0; 
	DWORD magic_num = 0x00;  

	for(; i < MZSTUB_SIZE; i++)
	{
		tmp1 = (DWORD)pRich[i];											//берем очередной байт из первых 128-ми байт
		sum = sum + ((tmp1 << i) | (tmp1 >> (32 - i)));					//rol	tmp1,i		add sum,tmp1
	}
	  
//	printf("SUM = %X\n",sum);

	if(sum != 0x0884F3421)												//в итоге сумма должна быть равна этому значению )
		return false; 

	*(DWORD*)(pRich + 0x3C) = e_lfanew;									//восстанавливаем ранее сохраненное значение 
	pRich = (BYTE*)(pRich + MZSTUB_SIZE);								//pRich - address Rich-signature
	DWORD DanS = *(DWORD*)(pRich);										// 'DanS' xor xor-mask
	DWORD xor_mask = *(DWORD*)(pRich + 4);								//xor-mask
	DanS = DanS ^ xor_mask ^ 0x0AA559966;

//	printf("DanS = %X\n",DanS);

	if(DanS != 0x0F93BF822)												//если !=, то хуй, выходим
		return false; 

	tmp1 = (*(DWORD*)(pRich + 8)) ^ (*(DWORD*)(pRich + 12));			//следующие 2 значания должны быть равны между собой - это должна быть та же xor-mask

//	printf("tmp = %X\n",tmp1);

	if(tmp1)
		return false;

	for(i = 0; i < MAX_RICH_OFFSET; i += 4)								//ищем 'Rich'
	{
		if(pRich[i] == 'R' && pRich[i + 1] == 'i' && pRich[i + 2] == 'c' && pRich[i + 3] == 'h')
			break; 
	} 

	if(i >= MAX_RICH_OFFSET) 
		return false;

//	i = i / 4 + 1;														//узнаем кол-во шагов (по 4 байта каждый) до слова 'Rich'	
//	i = ((i * 4) - 8) / 8;												//также узнаем кол-во, но теперь по 8 байт каждый  

	i = (i + 4 - 8) / 8;												//узнаем кол-во шагов (по 4 байта каждый) до слова 'Rich' 
	pRich = (BYTE*)(pRich + 8);  

	for(j = 0; j < i; j++)
	{  
		tmp1 = (*(DWORD*)(pRich + j * 8)) ^ xor_mask;					//расшифровываем rich-данные 

		if(tmp1 == MAGIC_NUMBER)
			magic_num += tmp1; 

		tmp2 = (*(DWORD*)(pRich + j * 8 + 4)) ^ xor_mask;
		tmp1 = (tmp1 << tmp2) | (tmp1 >> (32 - tmp2));					//rol	tmp1,tmp2
		sum = sum + tmp1;												//add	sum,tmp1 
	}	

//	printf("SUM = %X\txor_mask = %X\n",sum,xor_mask);

//	if(magic_num != MAGIC_NUMBER)
//		return false;

	if(sum != xor_mask)													//проверяем полученную сумму с xor-mask'ой
		return false; 

//	printf("SUM = %X\tprich = %X\n",sum,(*(DWORD*)(pRich + j * 8 + 4)));

	if((*(DWORD*)(pRich + j * 8 + 4)) != sum)							//проверяем полученную сумму с dword'oм, который находится после слова 'Rich' (это та же xor-mask)
		return false; 
 
	return true; 
}
/****************************************************************************************************************************\
*	конец функи CheckRich
\****************************************************************************************************************************/





/****************************************************************************************************************************\
*	function ChangeRich
*	подмена рич-сигны в файле
*	Вход:
*		pMem - адрес в памяти, где расположена рич-сигнатура
*	Выход:
*		1    - если подмена прошла успешно, иначе 0
\****************************************************************************************************************************/
BOOL ChangeRich(LPVOID pMem)
{
	BYTE *pRich = (BYTE*)pMem;											//pRich - указатель на IMAGE_DOS_HEADER
	DWORD i = 0, j = 0; 
	DWORD sum = 0x0884F3421; 
	DWORD tmp = 0; 
	DWORD rnd1 = 0, rnd2 = 0;
	DWORD num_elem = sizeof(comp_id) / sizeof(comp_id[0]);				//кол-во элементов в массиве comp_id

	srand(GetTickCount());												//инициализируем ГСЧ 

	if(!CheckRich(pMem))												//проверим рич-сигну на "правильность" 
		return false;

	pRich = (BYTE*)(pRich + MZSTUB_SIZE);								//pRich - address Rich-signature
	DWORD xor_mask = *(DWORD*)(pRich + 4);								//xor-mask 

	for(; ; i += 4)														//search 'Rich'
	{
		if(pRich[i] == 'R' && pRich[i + 1] == 'i' && pRich[i + 2] == 'c' && pRich[i + 3] == 'h')
			break; 
	} 

	i = (i + 0x04 - 0x14) / 0x08;										//подсчитаем кол-во шагов (по 8 байт каждый) до слова 'Rich', пропустив при этом первые 0x10 байт (см. на код)

	for(; j < i; j++)
	{
		tmp = (*(DWORD*)(pRich + 16 + j * 8)) ^ xor_mask;				//рас'xor'им очередной (первый) dword из пары   
		rnd2 = rand()%255 + 1; 
		*(DWORD*)(pRich + 16 + j * 8 + 4) = rnd2;						//очередной (второй) dword из пары равен СЧ [1..255] 

		if(tmp != MAGIC_NUMBER)											//это число 1 раз обязательно должно в rich-сигне
		{
			rnd1 = rand()%num_elem;										//если это не оно, то сохраним новое значение, выбранное случайным образом из массива comp_id 
			*(DWORD*)(pRich + 16 + j * 8) = comp_id[rnd1];
		}
		else
		{
			*(DWORD*)(pRich + 16 + j * 8) = tmp;						//иначе сохраним то, которое там и было 
		}

		tmp = *(DWORD*)(pRich + 16 + j * 8); 
		tmp = (tmp << rnd2) | (tmp >> (32 - rnd2));						//rol	tmp,rnd2
		sum = sum + tmp;												//add	 sum,tmp 
	}

	*(DWORD*)(pRich) = sum ^ 0xAA559966 ^ 0x0F93BF822;					//созраним в первом dword'e rich-сигны 'DanS' xor xor-mask
	*(DWORD*)(pRich + 4) = sum;											//в следующих 3-х двордах сохраним xor-маску
	*(DWORD*)(pRich + 8) = sum;
	*(DWORD*)(pRich + 12) = sum;

	for(j = 0; j < i; j++)												//и далее, в цикле за'xor'им все сохраненные новые данные
	{
		*(DWORD*)(pRich + 16 + j * 8) = (*(DWORD*)(pRich + 16 + j * 8)) ^ sum;
		*(DWORD*)(pRich + 16 + j * 8 + 4) = (*(DWORD*)(pRich + 16 + j * 8 + 4)) ^ sum; 
	}

	*(DWORD*)(pRich + 16 + j * 8 + 4) = sum;							//и dword, который находится после слова 'Rich', будет равен xor-mask'e 
	
	return true; 
}
/****************************************************************************************************************************\
*	конец функи ChangeRich 
\****************************************************************************************************************************/





/****************************************************************************************************************************\
*	функция GenRich
*	генерация rich-сигнатуры
*	Вход:
*		pMem - адрес в памяти, где расположена рич-сигна
*	Выход:
*		pMem - если все отлично, иначе 0
\****************************************************************************************************************************/
LPVOID GenRich(LPVOID pMem)
{   
	BYTE *pRich = (BYTE*)pMem;											//pRich - указатель на IMAGE_DOS_HEADER 
	memcpy((PVOID)pRich, (PVOID)mzhdr_dosstub, sizeof(mzhdr_dosstub)); 
	pRich = (BYTE*)(pRich + MZSTUB_SIZE);								//pRich - address rich-signature 
	DWORD num_elem = sizeof(comp_id) / sizeof(comp_id[0]);				//кол-во элементов в массиве comp_id 
	DWORD len_rich = rand()%6 + 5;										//здесь данное число означает, что размер нашей сгенерированной рич-сигны будет [0xC0..0xF8]
	DWORD pos1 = rand()%(len_rich - 1) + 1;								//это значение будет соответствовать позиции, где будет расположено число 0x10000 (оно обязательно 1 раз должно быть в рич-сигне (только для msvc (VC++ (6))))   
	DWORD num_zero = rand()%2 + 1;										//кол-во нулей после рич-сигны (1 - 8 нулей, 2 - 16 нулей);  
	DWORD sum = 0x0884F3421;
	DWORD i = 0, j = 0; 
	DWORD rnd1 = 0, rnd2 = 0;  
	 
	for(i = 0; i < len_rich; i++)										//начинаем генерить данные и сразу считаем xor-mask'у  
	{
		if(pos1 == i)													//если текущая и выбранная ранее позиции равны, то запишем в данные значение 0x10000 (1 раз)
			rnd1 = MAGIC_NUMBER;  
		else
		{
			rnd2 = rand()%num_elem;										//иначе возьмем случайным образом значение из массива comp_id 	
			rnd1 = comp_id[rnd2];
		}
		 
		*(DWORD*)(pRich + 16 + i * 8) = rnd1;							//сохраним полученное значение  
		rnd2 = rand()%255 + 1;
		*(DWORD*)(pRich + 16 + i * 8 + 4) = rnd2;						//другой дворд будет равен СЧ [1.255] 
		sum = sum + ((rnd1 << rnd2) | (rnd1 >> (32 - rnd2)));			//rol	rnd1,rnd2		add		sum,rnd1 		
	}

	*(DWORD*)(pRich) = sum ^ 0xAA559966 ^ 0x0F93BF822;					//далее, в первый дворд рич-сигны запишем 'DanS' xor xor-mask
	*(DWORD*)(pRich + 4) = sum;											//в остальные 3 dword'a запишем xor-маску
	*(DWORD*)(pRich + 8) = sum;
	*(DWORD*)(pRich + 12) = sum;

	for(i = 0; i < len_rich; i++)										//затем, в цикле по'xor'им сгенерированные данные на xor-mask
	{
		*(DWORD*)(pRich + 16 + i * 8) = (*(DWORD*)(pRich + 16 + i * 8)) ^ sum;
		*(DWORD*)(pRich + 16 + i * 8 + 4) = (*(DWORD*)(pRich + 16 + i * 8 + 4)) ^ sum;
	}

	strcpy((char*)(pRich + 16 + i * 8),"Rich");							//после данных запишем слово 'Rich'
	*(DWORD*)(pRich + 16 + i * 8 + 4) = sum;							//а после этого слова запишем xor-mask 
 
	for(j = 0; j < num_zero; j++)										//после, запишем нули (кол-во выбрали ранее случайным образом)
	{
		*(DWORD*)(pRich + 16 + i * 8 + 4 + 4 + j * 8) = 0; 
		*(DWORD*)(pRich + 16 + i * 8 + 4 + 4 + j * 8 + 4) = 0; 
	}

	DWORD size_rich = (DWORD)(pRich + 16 + i * 8 + 4 + 4 + j * 8) - (DWORD)pMem;
	*(DWORD*)(pRich - MZSTUB_SIZE + 0x3C) = size_rich;					//найдем размер сгенерированной рич-сигны и сохраним его в поле e_lfanew   

	if(!CheckRich((LPVOID)pMem))										//если мы сгенерили правильную рич-сигну, то все отлично =)! 
		return false;
	 
	return (LPVOID)pMem;   
}
/****************************************************************************************************************************\
*	конец функи GenRich
\****************************************************************************************************************************/

 



/****************************************************************************************************************************\
*	fucntion main
*	начало выполнения нашей проги
\****************************************************************************************************************************/
int main()
{
	char szPath1[] = "C:\\Games\\123\\xtest.exe";  
	char szPath2[] = "C:\\Games\\123\\xtest1.exe"; 
	char szPath3[] = "C:\\Games\\123\\xrich.bin";  

	HANDLE hFile = CreateFile(szPath1, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, OPEN_EXISTING, 
								FILE_ATTRIBUTE_NORMAL, 0);				//откроем файл для чтения

	if(hFile == INVALID_HANDLE_VALUE)
		return 0;

	DWORD file_size = GetFileSize(hFile, 0);							//узнаем его размер
	HGLOBAL hglMem = GlobalAlloc(GMEM_FIXED, file_size);				//выделим под него память
	DWORD old_bytes = 0;
	ReadFile(hFile, (LPVOID)hglMem, file_size, &old_bytes, 0);			//и прочитаем файл в эту память
	CloseHandle(hFile);

	if(!CheckRich((LPVOID)hglMem))										//проверка рич-сигны на целостность
	{
		printf("CHECK RICH = FAULT\n");
		return 0;
	}

	printf("CHECK RICH = OK\n");

	if(!ChangeRich((LPVOID)hglMem))										//замена рич-сигны
	{
		printf("CHANGE RICH = FAULT\n");
		return 0;
	} 

	hFile = CreateFile(szPath2, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, 
						CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
	WriteFile(hFile,(LPCVOID)hglMem, file_size, &old_bytes, 0);			//запишем в новый файл
	CloseHandle(hFile); 
	printf("CHANGE RICH = OK\n");
	LPVOID pRich = GenRich((LPVOID)hglMem);								//генерация с нуля рич-сигны

	if(!pRich)
	{
		printf("GENERATE RICH = FAULT\n"); 
		return 0;
	}

	DWORD size_rich = *(DWORD*)((BYTE*)pRich + 0x3C);   
	hFile = CreateFile(szPath3, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, 
						CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);		//запишем в новый файл
	WriteFile(hFile,(LPCVOID)hglMem, size_rich, &old_bytes, 0);
	CloseHandle(hFile);
	GlobalFree(hglMem); 
	printf("GENERATE RICH = OK\n");										//отлично =)!  
	 
	return 0;
}
/****************************************************************************************************************************\
*	конец функи main 
\****************************************************************************************************************************/