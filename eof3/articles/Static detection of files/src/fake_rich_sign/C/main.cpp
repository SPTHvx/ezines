#include <windows.h>
#include <stdio.h>



//m1x
//pr0mix
//EOF 



//������ (IMAGE_DOS_HEADER + DOS Stub) 
#define MZSTUB_SIZE	0x80
#define MAGIC_NUMBER 0x10000	//������ ����� ���� ������ ������ � ������, ��������� �� msvc (VC++ (6)). �� ������, ���������, ��������, � masm etc - ����� ����� ���; 
#define MAX_RICH_OFFSET 16*10



//��� �������� ����� �� ������ rich-�������� (������ �� ����� ���'xor'���), ������������� ��������� PE-������
//��� �������� ������������ ����� ���� � ������� ���������/�������, + �������� ��������� ������/������ ����������
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


//IMAGE_DOS_HEADER � DOS Stub 
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
*	����� CheckRich
*	�������� rich-signature �� �����������
*	����:
*		pMem - ����� � ������, ��� ����������� ���-�����
*	�����:
*		1    - ���� ���-����� "����������", ����� 0
\****************************************************************************************************************************/     
BOOL CheckRich(LPVOID pMem)
{
	BYTE *pRich = (BYTE*)pMem;											//pRich - ��������� �� IMAGE_DOS_HEADER
	DWORD sum = MZSTUB_SIZE; 
	DWORD e_lfanew = *(DWORD*)(pRich + 0x3C);							//�������� �������� e_lfanew
	*(DWORD*)(pRich + 0x3C) = 0;										//� ����� ������� ��� (��� ��� ��� ����� ���� ������)
	DWORD tmp1 = 0, tmp2 = 0;
	DWORD i = 0, j = 0; 
	DWORD magic_num = 0x00;  

	for(; i < MZSTUB_SIZE; i++)
	{
		tmp1 = (DWORD)pRich[i];											//����� ��������� ���� �� ������ 128-�� ����
		sum = sum + ((tmp1 << i) | (tmp1 >> (32 - i)));					//rol	tmp1,i		add sum,tmp1
	}
	  
//	printf("SUM = %X\n",sum);

	if(sum != 0x0884F3421)												//� ����� ����� ������ ���� ����� ����� �������� )
		return false; 

	*(DWORD*)(pRich + 0x3C) = e_lfanew;									//��������������� ����� ����������� �������� 
	pRich = (BYTE*)(pRich + MZSTUB_SIZE);								//pRich - address Rich-signature
	DWORD DanS = *(DWORD*)(pRich);										// 'DanS' xor xor-mask
	DWORD xor_mask = *(DWORD*)(pRich + 4);								//xor-mask
	DanS = DanS ^ xor_mask ^ 0x0AA559966;

//	printf("DanS = %X\n",DanS);

	if(DanS != 0x0F93BF822)												//���� !=, �� ���, �������
		return false; 

	tmp1 = (*(DWORD*)(pRich + 8)) ^ (*(DWORD*)(pRich + 12));			//��������� 2 �������� ������ ���� ����� ����� ����� - ��� ������ ���� �� �� xor-mask

//	printf("tmp = %X\n",tmp1);

	if(tmp1)
		return false;

	for(i = 0; i < MAX_RICH_OFFSET; i += 4)								//���� 'Rich'
	{
		if(pRich[i] == 'R' && pRich[i + 1] == 'i' && pRich[i + 2] == 'c' && pRich[i + 3] == 'h')
			break; 
	} 

	if(i >= MAX_RICH_OFFSET) 
		return false;

//	i = i / 4 + 1;														//������ ���-�� ����� (�� 4 ����� ������) �� ����� 'Rich'	
//	i = ((i * 4) - 8) / 8;												//����� ������ ���-��, �� ������ �� 8 ���� ������  

	i = (i + 4 - 8) / 8;												//������ ���-�� ����� (�� 4 ����� ������) �� ����� 'Rich' 
	pRich = (BYTE*)(pRich + 8);  

	for(j = 0; j < i; j++)
	{  
		tmp1 = (*(DWORD*)(pRich + j * 8)) ^ xor_mask;					//�������������� rich-������ 

		if(tmp1 == MAGIC_NUMBER)
			magic_num += tmp1; 

		tmp2 = (*(DWORD*)(pRich + j * 8 + 4)) ^ xor_mask;
		tmp1 = (tmp1 << tmp2) | (tmp1 >> (32 - tmp2));					//rol	tmp1,tmp2
		sum = sum + tmp1;												//add	sum,tmp1 
	}	

//	printf("SUM = %X\txor_mask = %X\n",sum,xor_mask);

//	if(magic_num != MAGIC_NUMBER)
//		return false;

	if(sum != xor_mask)													//��������� ���������� ����� � xor-mask'��
		return false; 

//	printf("SUM = %X\tprich = %X\n",sum,(*(DWORD*)(pRich + j * 8 + 4)));

	if((*(DWORD*)(pRich + j * 8 + 4)) != sum)							//��������� ���������� ����� � dword'o�, ������� ��������� ����� ����� 'Rich' (��� �� �� xor-mask)
		return false; 
 
	return true; 
}
/****************************************************************************************************************************\
*	����� ����� CheckRich
\****************************************************************************************************************************/





/****************************************************************************************************************************\
*	function ChangeRich
*	������� ���-����� � �����
*	����:
*		pMem - ����� � ������, ��� ����������� ���-���������
*	�����:
*		1    - ���� ������� ������ �������, ����� 0
\****************************************************************************************************************************/
BOOL ChangeRich(LPVOID pMem)
{
	BYTE *pRich = (BYTE*)pMem;											//pRich - ��������� �� IMAGE_DOS_HEADER
	DWORD i = 0, j = 0; 
	DWORD sum = 0x0884F3421; 
	DWORD tmp = 0; 
	DWORD rnd1 = 0, rnd2 = 0;
	DWORD num_elem = sizeof(comp_id) / sizeof(comp_id[0]);				//���-�� ��������� � ������� comp_id

	srand(GetTickCount());												//�������������� ��� 

	if(!CheckRich(pMem))												//�������� ���-����� �� "������������" 
		return false;

	pRich = (BYTE*)(pRich + MZSTUB_SIZE);								//pRich - address Rich-signature
	DWORD xor_mask = *(DWORD*)(pRich + 4);								//xor-mask 

	for(; ; i += 4)														//search 'Rich'
	{
		if(pRich[i] == 'R' && pRich[i + 1] == 'i' && pRich[i + 2] == 'c' && pRich[i + 3] == 'h')
			break; 
	} 

	i = (i + 0x04 - 0x14) / 0x08;										//���������� ���-�� ����� (�� 8 ���� ������) �� ����� 'Rich', ��������� ��� ���� ������ 0x10 ���� (��. �� ���)

	for(; j < i; j++)
	{
		tmp = (*(DWORD*)(pRich + 16 + j * 8)) ^ xor_mask;				//���'xor'�� ��������� (������) dword �� ����   
		rnd2 = rand()%255 + 1; 
		*(DWORD*)(pRich + 16 + j * 8 + 4) = rnd2;						//��������� (������) dword �� ���� ����� �� [1..255] 

		if(tmp != MAGIC_NUMBER)											//��� ����� 1 ��� ����������� ������ � rich-�����
		{
			rnd1 = rand()%num_elem;										//���� ��� �� ���, �� �������� ����� ��������, ��������� ��������� ������� �� ������� comp_id 
			*(DWORD*)(pRich + 16 + j * 8) = comp_id[rnd1];
		}
		else
		{
			*(DWORD*)(pRich + 16 + j * 8) = tmp;						//����� �������� ��, ������� ��� � ���� 
		}

		tmp = *(DWORD*)(pRich + 16 + j * 8); 
		tmp = (tmp << rnd2) | (tmp >> (32 - rnd2));						//rol	tmp,rnd2
		sum = sum + tmp;												//add	 sum,tmp 
	}

	*(DWORD*)(pRich) = sum ^ 0xAA559966 ^ 0x0F93BF822;					//�������� � ������ dword'e rich-����� 'DanS' xor xor-mask
	*(DWORD*)(pRich + 4) = sum;											//� ��������� 3-� ������� �������� xor-�����
	*(DWORD*)(pRich + 8) = sum;
	*(DWORD*)(pRich + 12) = sum;

	for(j = 0; j < i; j++)												//� �����, � ����� ��'xor'�� ��� ����������� ����� ������
	{
		*(DWORD*)(pRich + 16 + j * 8) = (*(DWORD*)(pRich + 16 + j * 8)) ^ sum;
		*(DWORD*)(pRich + 16 + j * 8 + 4) = (*(DWORD*)(pRich + 16 + j * 8 + 4)) ^ sum; 
	}

	*(DWORD*)(pRich + 16 + j * 8 + 4) = sum;							//� dword, ������� ��������� ����� ����� 'Rich', ����� ����� xor-mask'e 
	
	return true; 
}
/****************************************************************************************************************************\
*	����� ����� ChangeRich 
\****************************************************************************************************************************/





/****************************************************************************************************************************\
*	������� GenRich
*	��������� rich-���������
*	����:
*		pMem - ����� � ������, ��� ����������� ���-�����
*	�����:
*		pMem - ���� ��� �������, ����� 0
\****************************************************************************************************************************/
LPVOID GenRich(LPVOID pMem)
{   
	BYTE *pRich = (BYTE*)pMem;											//pRich - ��������� �� IMAGE_DOS_HEADER 
	memcpy((PVOID)pRich, (PVOID)mzhdr_dosstub, sizeof(mzhdr_dosstub)); 
	pRich = (BYTE*)(pRich + MZSTUB_SIZE);								//pRich - address rich-signature 
	DWORD num_elem = sizeof(comp_id) / sizeof(comp_id[0]);				//���-�� ��������� � ������� comp_id 
	DWORD len_rich = rand()%6 + 5;										//����� ������ ����� ��������, ��� ������ ����� ��������������� ���-����� ����� [0xC0..0xF8]
	DWORD pos1 = rand()%(len_rich - 1) + 1;								//��� �������� ����� ��������������� �������, ��� ����� ����������� ����� 0x10000 (��� ����������� 1 ��� ������ ���� � ���-����� (������ ��� msvc (VC++ (6))))   
	DWORD num_zero = rand()%2 + 1;										//���-�� ����� ����� ���-����� (1 - 8 �����, 2 - 16 �����);  
	DWORD sum = 0x0884F3421;
	DWORD i = 0, j = 0; 
	DWORD rnd1 = 0, rnd2 = 0;  
	 
	for(i = 0; i < len_rich; i++)										//�������� �������� ������ � ����� ������� xor-mask'�  
	{
		if(pos1 == i)													//���� ������� � ��������� ����� ������� �����, �� ������� � ������ �������� 0x10000 (1 ���)
			rnd1 = MAGIC_NUMBER;  
		else
		{
			rnd2 = rand()%num_elem;										//����� ������� ��������� ������� �������� �� ������� comp_id 	
			rnd1 = comp_id[rnd2];
		}
		 
		*(DWORD*)(pRich + 16 + i * 8) = rnd1;							//�������� ���������� ��������  
		rnd2 = rand()%255 + 1;
		*(DWORD*)(pRich + 16 + i * 8 + 4) = rnd2;						//������ ����� ����� ����� �� [1.255] 
		sum = sum + ((rnd1 << rnd2) | (rnd1 >> (32 - rnd2)));			//rol	rnd1,rnd2		add		sum,rnd1 		
	}

	*(DWORD*)(pRich) = sum ^ 0xAA559966 ^ 0x0F93BF822;					//�����, � ������ ����� ���-����� ������� 'DanS' xor xor-mask
	*(DWORD*)(pRich + 4) = sum;											//� ��������� 3 dword'a ������� xor-�����
	*(DWORD*)(pRich + 8) = sum;
	*(DWORD*)(pRich + 12) = sum;

	for(i = 0; i < len_rich; i++)										//�����, � ����� ��'xor'�� ��������������� ������ �� xor-mask
	{
		*(DWORD*)(pRich + 16 + i * 8) = (*(DWORD*)(pRich + 16 + i * 8)) ^ sum;
		*(DWORD*)(pRich + 16 + i * 8 + 4) = (*(DWORD*)(pRich + 16 + i * 8 + 4)) ^ sum;
	}

	strcpy((char*)(pRich + 16 + i * 8),"Rich");							//����� ������ ������� ����� 'Rich'
	*(DWORD*)(pRich + 16 + i * 8 + 4) = sum;							//� ����� ����� ����� ������� xor-mask 
 
	for(j = 0; j < num_zero; j++)										//�����, ������� ���� (���-�� ������� ����� ��������� �������)
	{
		*(DWORD*)(pRich + 16 + i * 8 + 4 + 4 + j * 8) = 0; 
		*(DWORD*)(pRich + 16 + i * 8 + 4 + 4 + j * 8 + 4) = 0; 
	}

	DWORD size_rich = (DWORD)(pRich + 16 + i * 8 + 4 + 4 + j * 8) - (DWORD)pMem;
	*(DWORD*)(pRich - MZSTUB_SIZE + 0x3C) = size_rich;					//������ ������ ��������������� ���-����� � �������� ��� � ���� e_lfanew   

	if(!CheckRich((LPVOID)pMem))										//���� �� ��������� ���������� ���-�����, �� ��� ������� =)! 
		return false;
	 
	return (LPVOID)pMem;   
}
/****************************************************************************************************************************\
*	����� ����� GenRich
\****************************************************************************************************************************/

 



/****************************************************************************************************************************\
*	fucntion main
*	������ ���������� ����� �����
\****************************************************************************************************************************/
int main()
{
	char szPath1[] = "C:\\Games\\123\\xtest.exe";  
	char szPath2[] = "C:\\Games\\123\\xtest1.exe"; 
	char szPath3[] = "C:\\Games\\123\\xrich.bin";  

	HANDLE hFile = CreateFile(szPath1, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, OPEN_EXISTING, 
								FILE_ATTRIBUTE_NORMAL, 0);				//������� ���� ��� ������

	if(hFile == INVALID_HANDLE_VALUE)
		return 0;

	DWORD file_size = GetFileSize(hFile, 0);							//������ ��� ������
	HGLOBAL hglMem = GlobalAlloc(GMEM_FIXED, file_size);				//������� ��� ���� ������
	DWORD old_bytes = 0;
	ReadFile(hFile, (LPVOID)hglMem, file_size, &old_bytes, 0);			//� ��������� ���� � ��� ������
	CloseHandle(hFile);

	if(!CheckRich((LPVOID)hglMem))										//�������� ���-����� �� �����������
	{
		printf("CHECK RICH = FAULT\n");
		return 0;
	}

	printf("CHECK RICH = OK\n");

	if(!ChangeRich((LPVOID)hglMem))										//������ ���-�����
	{
		printf("CHANGE RICH = FAULT\n");
		return 0;
	} 

	hFile = CreateFile(szPath2, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, 
						CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
	WriteFile(hFile,(LPCVOID)hglMem, file_size, &old_bytes, 0);			//������� � ����� ����
	CloseHandle(hFile); 
	printf("CHANGE RICH = OK\n");
	LPVOID pRich = GenRich((LPVOID)hglMem);								//��������� � ���� ���-�����

	if(!pRich)
	{
		printf("GENERATE RICH = FAULT\n"); 
		return 0;
	}

	DWORD size_rich = *(DWORD*)((BYTE*)pRich + 0x3C);   
	hFile = CreateFile(szPath3, GENERIC_READ | GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, 
						CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);		//������� � ����� ����
	WriteFile(hFile,(LPCVOID)hglMem, size_rich, &old_bytes, 0);
	CloseHandle(hFile);
	GlobalFree(hglMem); 
	printf("GENERATE RICH = OK\n");										//������� =)!  
	 
	return 0;
}
/****************************************************************************************************************************\
*	����� ����� main 
\****************************************************************************************************************************/