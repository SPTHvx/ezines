#include <windows.h>
#include <stdio.h>
#include <math.h>
#include <conio.h>


  
//m1x
//pr0mix
//EOF


 
#define RVATOVA(Base, Rva)	((DWORD)Base + (DWORD)Rva)	//������ - ��������� �� RVA -> VA (k.0.) )
#define ALIGN_UP(x, y)	((x + (y - 1)) & (~(y - 1)))	//������������ �����; 
#define ALIGN_DOWN(x, y)	(x & (~(y - 1)))	//����; 
#define MAX_BYTES 256	//����� ��������� ���� ����� ���� ������ 256 (2 � 8-�� ������� ([0x00..0xFF])); 
#define MAX_SEC_NAME 8	//������������ ����� ����� ������ (� ������);  
#define MAX_STR 512



//���������
typedef struct XDATAENTROPY
{
	double sum_entr;	//����� ����� ��x������ ��������� �������� ����� (���� ��� ������ etc); 
//	double arith_mean;
//	double rat_bits;
//	int mBits[2];
}XENTR, *PXENTR;


typedef struct XMAPFILE
{
	LPVOID pExe;	//��� �������� ���� ��������
	DWORD file_size;	//� ��� ������ �����; 
}XMAP, *PXMAP;





/***************************************************************************************************\
*	����� ValidPE;
*	�������� ����� �� ������������ ������� PE32;
*	����:
*		pExe	-	���� �������� (����� ����� � ������ (MapViewOfFile) aka ��������� ����� 
*						������������� �������������); 
*	�����: 
*		1		-	���� ���� ��������, ����� 0;  
\***************************************************************************************************/
BOOL ValidPE(LPVOID pExe)
{
	IMAGE_DOS_HEADER *imDh = (IMAGE_DOS_HEADER*)pExe;  
	IMAGE_NT_HEADERS *imNTh;

	if((imDh->e_magic == 'ZM') && ((DWORD)imDh->e_lfanew <= 0x200))	//����������� �������� � DWORD'�, ����� ����� ����������� ���������� � �������, ��� ���������� ����� ������� ������ � 1 (��������, 0x8E888857 etc);  
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
*	����� ����� ValidPE; 
\***************************************************************************************************/



/***************************************************************************************************\
*	������� MapFile
*	������� ����� � ������
*	����:
*		pszFileName		- ��� �����, ������� ����� ������������� � ������
*		pxmap			- ��������� �� ��������� XMAP. 
*	�����:
*		0				- ���� ���-�� �� ���������� �������, ����� ���� ��������;
*	�������:
*		pxmap			- ��� ��������� �� ��������� XMAP. ���� �� �������� ������ 
*			���������, �� ��� ���� ����� ������� �������� ������. ���� �� �� �������� 
*			����� �� ������, ����� ��� ��. � ������ ��������� ���� � ���������� 
*			(���� ��� ������� �������).
\***************************************************************************************************/
LPVOID MapFile(char *pszFileName, XMAP *pxmap)
{
	HANDLE hFile;
	HANDLE hFileMap;
	DWORD file_size;

	hFile = CreateFile(pszFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, 
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);	//��������� ���� �� ������/������

	if(hFile == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	file_size = GetFileSize(hFile, 0);	//�������� ������ �����
	hFileMap = CreateFileMapping(hFile, NULL, PAGE_READWRITE, 0, 0, 0);	//������� �������� �����

	if(!hFileMap)	//��������?
	{
		CloseHandle(hFile);
		return 0; 
	}

	pxmap->pExe = MapViewOfFile(hFileMap, FILE_MAP_ALL_ACCESS, 0, 0, 0);	//���������� ���� � ����. �� ������ ��������; 
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
*	����� ������� MapFile
\***************************************************************************************************/



/***************************************************************************************************\
*	������� UnmapFile
*	������������ ����� �������� ������� (�������� �����); 
\***************************************************************************************************/
void UnmapFile(LPVOID pExe)
{
	UnmapViewOfFile(pExe); 
}
/***************************************************************************************************\
*	����� ������� UnmapFile
\***************************************************************************************************/



/***************************************************************************************************\
*	������� CalcEntropy
*	���������� �������� (����� ���� ���������� ������� ���� (������));
*	����:
*		pBuffer		- �����, ��� �������� ������ (�����), �������� ������� ���� ���������
*		buf_size	- ������ ����� ������ (� ������);
*		pxentr		- ��������� �� ��������� XENTR;
*		num			- �������� �������������� ���������� ��� ��� (0 - ���, 1 - ��); 
*	�����:
*		����������� �������� �������� (� pBuffer) ����; 
*	�������:
*		pxentr		- ��������� �� ��������� XENTR. ���� �� �������� ������ 
*			���������, �� ��� ���� ����� ������� �������� ������. ���� �� �� �������� 
*			����� �� ������, ����� ��� ��. � ������ ��������� ���� � ���������� 
*			(���� ��� ������� �������).
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
*	����� ������� CalcEntropy
\***************************************************************************************************/



/***************************************************************************************************\
*	������� EntropyFile
*	���������� �������� �����
*	����:
*		pszFileName		- ��� �����, �������� �������� ����� ���������
*		pxentr			- ��������� �� ��������� XENTR (����� ����)
*		pxmap			- ��������� ��� ��������� XMAP
*		num				- ����� ���� ��������: �������� ��� "��������������" (0 - ��������, 1 - "��������������"); 
*	�����:
*		1				- if all ok, else fucking 0; 
\***************************************************************************************************/
BOOL EntropyFile(char *pszFileName, XENTR *pxentr, XMAP *pxmap, int num) 
{
	memset(pxentr, 0, sizeof(XENTR));
	memset(pxmap, 0, sizeof(XMAP));
	
	if(!MapFile(pszFileName, pxmap))	//������� ����� � ������;
		return 0;
	
	CalcEntropy((char*)pxmap->pExe, pxmap->file_size, pxentr, num);	//������� ��������; 

	if(!num)
		printf("[File]\n\t\t Offset \t\t Size \t\t\t Entropy\n\t\t0x%08X \t\t 0x%08X \t\t %.4f\n", 
		0, pxmap->file_size, pxentr->sum_entr);

	UnmapFile(pxmap->pExe);

	return 1; 
}
/***************************************************************************************************\
*	����� ������� EntropyFile
\***************************************************************************************************/


 
/***************************************************************************************************\
*	������� EntropySec
*	���������� �������� ��������� ������ ����� (��� ����������, ������, ������� etc); 
*	����:
*		pszFileName		- ��� �����, �������� �������� ����� ���������
*		pxentr			- ��������� �� ��������� XENTR (����� ����)
*		pxmap			- ��������� ��� ��������� XMAP
*		num				- �������� �������� ��� "��������������" ����; 
*	�����:
*		1				- if all ok, else fucking 0; 
*	�������:
*		��� ������������� ����� �������� ������� �������� ��� ��������, ������� ����� ���� ����� 
*		�������� ����� �� �����; 
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

	memset(pxentr, 0, sizeof(XENTR));	//�������� ���� ��������� 
	memset(pxmap, 0, sizeof(XMAP));
	
	if(!MapFile(pszFileName, pxmap))	//������� �����
		return 0;

	if(!ValidPE(pxmap->pExe))	//�������� ����� �� ����������; 
		return 0; 

	imDh = (IMAGE_DOS_HEADER*)pxmap->pExe; 
	imNTh = (IMAGE_NT_HEADERS*)((DWORD)pxmap->pExe + imDh->e_lfanew);
	imSh = (IMAGE_SECTION_HEADER*)((DWORD)imNTh + 4 + sizeof(IMAGE_FILE_HEADER) + imNTh->FileHeader.SizeOfOptionalHeader);
	
	//���! ���������� ����� ������ ������������� �� ������ �������! 
	sec_size = ALIGN_DOWN(imSh->PointerToRawData, imNTh->OptionalHeader.FileAlignment);
	
	if(sec_size)
	{
		if(num)
		{
			printf("---------------------------------------------------------------------------\n[Headers]\n");
		}

		CalcEntropy((char*)pxmap->pExe, sec_size, pxentr, num); //������, ����� � �� ������� �������� ����������, �� ������ �����;  

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

	for(i = 0; i < imNTh->FileHeader.NumberOfSections; i++)	//������ �� �������;
	{
		sec_size = imSh->SizeOfRawData;	//������ ��� ������ ������������� ������ ����������� ������� ������;  
		xoffset = ALIGN_DOWN(imSh->PointerToRawData, imNTh->OptionalHeader.FileAlignment);	//�������� ������ ������ �� �����;   
		
		if(((imSh->Misc.VirtualSize < imSh->SizeOfRawData) && imSh->Misc.VirtualSize) || !imSh->SizeOfRawData)	//����� ����� ����� ����������� ��������� ������; 
		{
			if(((i + 1) < imNTh->FileHeader.NumberOfSections) && !imSh->SizeOfRawData)	//���� �� ������� ��������������� ������ �� ��������� � ���������� �� ������ = 0, �� 
			{
				sec_size = ALIGN_DOWN(((IMAGE_SECTION_HEADER*)((DWORD)imSh + 
					sizeof(IMAGE_SECTION_HEADER)))->PointerToRawData, imNTh->OptionalHeader.FileAlignment) - xoffset; //������ �� ������ ���: ���������� ����� ��������� ������ (������) - ���. ����� ������� ������. �� ��� ���� �������������; 
			}
			else
			{
				sec_size = imSh->Misc.VirtualSize;	//����� 
			}	
		}

		end_tmp_sec = xoffset + imSh->SizeOfRawData;	//��, ��� ����� ������ ����� ����, ��� ���� �� ��������� ���. ������ ������, �� ������� �������� �������, ������� ����� ����� ������������ ���. ������ ������; 	//ALIGN_UP(imSh->SizeOfRawData, imNTh->OptionalHeader.FileAlignment);		
		end_last_sec =  (end_last_sec <= end_tmp_sec) ? end_tmp_sec : end_last_sec;	//��� ����� ������� ����� ��������� ������ �� �����; ��������� ������ ������������� ����� ���� ��������� � ������� ������;  
		memset((PVOID)szSecName, 0, MAX_SEC_NAME);
		memset(pxentr, 0, sizeof(XENTR));
		strncpy(szSecName, (char*)imSh->Name, MAX_SEC_NAME);	//��������� � ���� ����� ��� ������; 
		szSecName[MAX_SEC_NAME] = 0; 
		
		if(sec_size)
		{
			if(num)
			{
				printf("\n%s\n", szSecName);  
			}

			//����� ������ ������ � �������� ���� �������� -> ��������� ���������� ����� � ������; 
			CalcEntropy((char*)((DWORD)xoffset + (DWORD)pxmap->pExe), sec_size, pxentr, num);	//������� �������� ��������� ������; 	
			
			if(!num)
				printf("%s \t\t 0x%08X \t\t 0x%08X \t\t %.4f\n", szSecName, xoffset, sec_size, pxentr->sum_entr);  
		}
 
		imSh++;  
	}
 
	overl_size = pxmap->file_size - end_last_sec;	//������ ���������� �������;   
	
	if(overl_size)	//������� ����?
	{ 
		if(num)
			printf("\n---------------------------------------------------------------------------\n[Overlay]\n"); 

		memset(pxentr, 0, sizeof(XENTR));
		CalcEntropy((char*)((DWORD)pxmap->pExe + end_last_sec), overl_size, pxentr, num);	//������� ���: ����� - ��� ����� ��������� ������ �� �����, ������ - ��� �������� ������� ����� � ������ (����� ��������� ������ �� �����);  		
		
		if(!num)
			printf("\n[Overlay]\n\t\t Offset \t\t Size \t\t\t Entropy\n\t\t 0x%08X \t\t 0x%08X \t\t %.4f\n", 
			end_last_sec, overl_size, pxentr->sum_entr); 
	}

	UnmapFile(pxmap->pExe);	//����������� ������ �������� ������
 	 
	return 1;  
}
/***************************************************************************************************\
*	����� ������� EntropySec
\***************************************************************************************************/



/***************************************************************************************************\
*	������� LowEntropy
*	�������� �������� ����� 
*	���� �� �������� ������� �������� (��� ������ � ������ �����) - ��� �������� � 
*	������� ����� �� 2 ����. �� ���� � ������ ��� ���� �������� �� 2 ����. ����� 
*	���������� ����� ���� ���� ��� ���� (����) ����, ��������� �� ���������� 
*	���������� �����. ����� ������� � ������� ����� ����� "��������" ������ 6 ���. 
*	���-�� ��������� ���� ���������� � 256 (2 � 8-�� �������) �� 64 ��������� (2 � 
*	6-�� �������). � ��������, �������������� �������� �� 6.00 �� �����������. 
*	����:
*		pszExistFileName	- ����, �������� �������� ����� �������
*		pszNewFileName		- ����� ����, � ������� ������� ����������������� �����
*	�����:
*		1					- ���� ��� ������� ������, ����� 0; 
*	�������:
*		��� ����� ������� ������������� ��� ������ ����, ���� �� �� ������ ����������� 
*		�����-�� ������� ���� � ����� �������� ��� ��������; 
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
		NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL); //��������� ���� �� ������/������ (�� ��� ����� ������ �� ������); 

	if(hFile1 == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	hFile2 = CreateFile(pszNewFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 
		NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL); //������� ���� ��� ������/������; 

	if(hFile2 == INVALID_HANDLE_VALUE)
	{
		CloseHandle(hFile1);  
		return 0;
	}

	file_size1 = GetFileSize(hFile1, 0);	//������ ������ ��������� �����; 
	pBuffer1 = (char*)malloc(sizeof(char) * file_size1 + 1);

	//����� ������ � ����� pBuffer1 �� ����� file_size1 ���� (���������); 
	if(!ReadFile(hFile1, pBuffer1, file_size1, &num_bytes, NULL)) //��� ���� file_size1 - num_bytes = 0, ��� ��� �������� ������!  
	{
		CloseHandle(hFile1);
		CloseHandle(hFile2);
		free(pBuffer1);
		return 0;  
	}

	mod = file_size1 % 3;	//��� ��� �� ����� ��������� ����� ����� ����� ������ 3 �����, �� ������ �������, ������ �� ������ ���� 3; 
							//��������, � ��� ���� ���� �������� � 7 ����. ��������� ���, ��� �� ���������� ������� ������ 3 ����� � ������ ���� ����� ����.
							//����� ���������� ��������� ��� ����� � ����� ������ ���� ����� ����. ����� ���������� ���������� 1 ����. �� ��� ��� �� �������� ����� �����, 
							//�� ��� ���� ������������� � ������ ������ ����� ���� �������� �� ��, ��� �� ��������� 3-� ����. 
	file_size2 = file_size1 + (file_size1 / 3) + (mod != 0);	//������ ������ ����� ��������� ���:
																//������ �������� ����� (hFile1) + ���-�� ����� ���� (������� ���������� �� ������ ����� ������ 3 �����) + (0 ��� 1 ���� - ��� ���� ������ �� ������ ��� (��� "�����" ����); 
	pBuffer2 = (char*)malloc(sizeof(char) * file_size2 + 1);	//�������� ������ ��� ����� �����;  
 
	for(i = 0, j = 0; i < file_size1; i++, j++)	//� ����� ������ �������������� �����
	{
		pBuffer2[j] = pBuffer1[i];	//������� �������� ��������� ���� � ����� ������;  
		pBuffer2[j] ^= 0x5F;	//����� ��������� ��� 
		new_byte = (new_byte | (((pBuffer2[j] & 0xC0) >> 6) << (cnt * 2)));	//����� ������� �� ������ ��������� 3-� ������ ����� ���� ���:
																			//�������� ������� 2 ���� 1-��� ����� (�� ��������� 3-� ����) � ��������� �� � ������ 2 ������� ���� (������� 0-1) ������ �����;
																			//�������� ������� 2 ���� 2-��� ����� � ��������� �� � ��������� 2 ������� ���� (2-3) ������ �����; 
																			//�������� ������� 2 ���� 3-��� ����� � ��������� �� � �������� 2 ������� ���� (4-5) ������ �����; 
		++cnt;	//������������ �������;
		pBuffer2[j] = pBuffer2[j] & 0x3F;	//� ���������� (� 0) � ����� ����, ������� ������ ��� ��������� � ����� ����� (new_byte); 
		
		if((cnt == 3) || (((i + 1) == file_size1) && mod))	//���� �� ��� 3 ����� ����������, �� ������� ����� ��� ����� ��������� ���� (new_byte), �������� ������� ���� ���������� 3-� ����;  
		{
			++j;											//��� ���� �� ������������ ��������� ����, � ������ ��������� ����� (hFile1) �� ��� ������ ���, �� ������� ��� ���� ����� ���� (new_byte);  
			pBuffer2[j] = new_byte; 
			new_byte = 0;
			cnt = 0;
		}
	}
 
	num_bytes = 0; 
	WriteFile(hFile2, pBuffer2, file_size2, &num_bytes, NULL);	//������� � ����� ���� ����� pBuffer2; 
	CloseHandle(hFile1);
	CloseHandle(hFile2);
	free(pBuffer1);
	free(pBuffer2); 

	return 1;
}
/***************************************************************************************************\
*	����� ������� LowEntropy
\***************************************************************************************************/



/***************************************************************************************************\
*	������� RestEntropy
*	�������, ����������������� ����, �������� �������� �� ��������
*	����:
*		pszExistFileName	- ����, ������� ����� ���������������; 
*		pszNewFileName		- ����� ����, � ������� ������� ����������������� �����
*	�������:
*		��� ����� ������� ������������� ��� ������ ����, ���� �� �� ������ ������������ 
*		�����-�� ������� ����, ������� �� ����� ���������, � �������� �������� �� 
*		��������; 
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
		NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);	//��������� ���� ��� ������/������

	if(hFile1 == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	hFile2 = CreateFile(pszNewFileName, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 
		NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL); //������� ����� ���� ��� ������/������

	if(hFile2 == INVALID_HANDLE_VALUE)
	{
		CloseHandle(hFile1);  
		return 0;
	}

	file_size1 = GetFileSize(hFile1, 0);	//�������� ������ ��������� ����� (hFile1);
	pBuffer1 = (char*)malloc(sizeof(char) * file_size1 + 1);

	//����� ������ � ����� pBuffer1 �� ����� file_size1 ���� (���������); 
	if(!ReadFile(hFile1, pBuffer1, file_size1, &num_bytes, NULL)) //��� ���� dwSize - num_bytes = 0, ��� ��� �������� ������!  
	{
		CloseHandle(hFile1);
		CloseHandle(hFile2);
		free(pBuffer1);
		return 0;  
	}

	mod = file_size1 % 4;	//��� ��� �� ����� ��������������� ����, �� ����� ������ 3 ����� �� ������ ������� 4 ���� (�� ��� ����� ��������), �� ����� ���� ������ �������, ������ �� ������ ����� 4; 
	file_size2 = file_size1 - (file_size1 / 4) - (mod != 0);	//������ ������ ����� ��������� ���:
																//������ �������� ����� (hFile1) - ���-�� ����� ���� (������� ���������� �� ������ ����� ������ 3 �����) - (0 ��� 1 ���� - ��� ���� ������ �� ������ ������)	 
	pBuffer2 = (char*)malloc(sizeof(char) * file_size2 + 1);	//�������� ������ ��� ������ ������ (pBuffer2);  
 
	if(mod)
	{
		file_size1 = file_size1 - 1;	//���� ������ ��������� ����� �� ������ 4-��, �� ������� 1 ����;  
	}

	for(i = 0, j = 0; i < file_size1; i++)	//���������; 
	{
		mBytes[cnt] = pBuffer1[i];	//������� �������� ������� ���� � ����� ������ ��� ��������������; 

		if((cnt == 3) || (((i + 1) == file_size1) && mod))
		{
			if((i + 1) == file_size1)	//���� ������ ����� �� ��� ����� 4-� � �� ������������(��) ��������� ����, 
			{
				++cnt;					//��� ���������� ����� ���� ������� � �����, �������� ��� ����, ����� ����, ��a����� ���� �������������� ����. ��� ���, ���������� ��; 
				mBytes[cnt] = pBuffer1[i + 1];  
			}

			for(ii = 0; ii < cnt; ii++, j++)	//��������������� (�� ����); 
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
*	����� ������� RestEntropy
\***************************************************************************************************/
 




/***************************************************************************************************\
*	���� ������� ����� main; 
\***************************************************************************************************/
int main(int argc, char** argv)
{
	//��� ������ ����� ����������, ��������, ���� ������� ����� ��������� ������ ����� ��� ����������; 
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

	if((argc == 5) || (argc == 7))	//��������, StaIT.exe -file C:\Games -log C:\Logs\xImp.txt
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
			printf("%s", szMsg);	//����� ������� ������ � �������;
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
*	���������� ��� ����...��������� ����� 
\***************************************************************************************************/