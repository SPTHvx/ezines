/***************************************************************************************************************\
*																												*
*								������ ��� ������ � PE32-FILES (IMPORT TABLE)									*
*												(�����������)													* 
*																												*
*				�������� ����� �� ������������ PE, �������� RVA � �������, ������� ������� etc					*
*																												*
*										ValidPE, RVATpOffset, PrImport											*
*																												*
\***************************************************************************************************************/



#include "pefunc.h"



//list_dll ld;



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

	if((imDh->e_magic == 'ZM') && ((DWORD)imDh->e_lfanew < 0x200))	//����������� �������� � DWORD'�, ����� ����� ����������� ���������� � �������, ��� ���������� ����� ������� ������ � 1 (��������, 0x8E888857 etc);  
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
*	����� RVAToOffset
*	������� RVA � �������� �������� (� ������ �� ������� ���������� ����� � �����);
*	����:
*		pExe	-	���� �������;
*		Rva		-	RVA;
*	�����:
*		���������� ����� � ����� ���� 0, ���� ��������� �����-�� �����;  
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
		return (DWORD)((DWORD)pExe + Rva);	//���� rva �� ����������� ������� ������, ������ ��������� ������ �� ����;

	for(int i = 0; i < imNTh->FileHeader.NumberOfSections; i++)	//������ �� �������;
	{
		size = imSh->SizeOfRawData; 	
		
		if(((imSh->Misc.VirtualSize < imSh->SizeOfRawData) && imSh->Misc.VirtualSize) || !imSh->SizeOfRawData)	//����� ����� ����� ����������� ��������� ������; 
		{
			size = imSh->Misc.VirtualSize;
		}
 
		if((Rva >= imSh->VirtualAddress) && (Rva < (imSh->VirtualAddress + size)))		//���� �� ����� ������, � ������� ��������� ���� ����� rva, 
		{
			//���! ���������� ����� ������ ������������� �� ������ �������! 
			xoffset = (DWORD)pExe + Rva - imSh->VirtualAddress + ALIGN_DOWN(imSh->PointerToRawData, imNTh->OptionalHeader.FileAlignment);	//����� ������ ������ � �������� ���� �������� -> ��������� ���������� ����� � ������; 
		}

		imSh++; 
	}
	return xoffset;	//���������� ����������� ���������� �����; 
}
/***************************************************************************************************\
*	����� ����� RVAToOffset; 
\***************************************************************************************************/



/***************************************************************************************************\
*	������� PrImport;
*	��������� ������� �������;
*	����:
*		pszFileName	-	���� � �����, ������� ������� �������� �� � ������ ����������;
*	�����:
*		1			-	���� ��� �������, ����� 0; 
\***************************************************************************************************/
BOOL WINAPI PrImport(char *pszFileName)
{
	int i = 1;	//��������������� ����������
	int len = 10; //8 + 2;
	DWORD xFirstThunk; 
	HANDLE hFile = CreateFile(pszFileName, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);	//��������� ���� ��� ������;
	
	if(hFile == INVALID_HANDLE_VALUE)	//��������?
	{
		return 0;
	}

	HANDLE hFileMap = CreateFileMapping(hFile, 0, PAGE_READONLY, 0, 0, 0); //������� �������� �����;
 
	if(!hFileMap)
	{
		CloseHandle(hFile);  
		return 0;
	}

	LPVOID pExe = MapViewOfFile(hFileMap, FILE_MAP_READ, 0, 0, 0);	//���������� ����;
	CloseHandle(hFile);
	CloseHandle(hFileMap);

	if(!pExe)
	{
		return 0;
	}
 
	if(!ValidPE(pExe))	//�������� ����� �� ����������; 
	{
		return 0;
	}

	IMAGE_DOS_HEADER *imDh = (IMAGE_DOS_HEADER*)pExe;
	IMAGE_NT_HEADERS *imNTh = (IMAGE_NT_HEADERS*)((DWORD)pExe + imDh->e_lfanew);

	DWORD impRva = imNTh->OptionalHeader.DataDirectory[1].VirtualAddress;	//x; 
	DWORD impSize = imNTh->OptionalHeader.DataDirectory[1].Size; 

	if(!impRva || !impSize)	//������� �� ������ ������� ������� � ������������ �����?
	{
		return 0;
	}

	DWORD offset = RVAToOffset(pExe, impRva);	//���� ��, �� ������� ���������� ����� (��) ������� ������� � ������������ �����;
	
	if(!offset)
	{
		return 0; 
	}

	IMAGE_IMPORT_DESCRIPTOR *imId = (IMAGE_IMPORT_DESCRIPTOR*)offset;	//IMPORT TABLE;

	while((imId->OriginalFirstThunk || imId->FirstThunk) && impSize)	//��������� ������� �������� ������� ����� 0;
	{	
		char *pszDllName = (char*)RVAToOffset(pExe, (DWORD)imId->Name);	//��������� �� ��� ������������� ���;
		char *pszFuncName;
		char *pszDllNameLower; // = strdup(pszDllName);	//������������ ��� ��� � �������� ��������� � pszDllNameLower; 	//Dll Name Lower = DNL;  		
		IMAGE_THUNK_DATA32 *imTd = (IMAGE_THUNK_DATA32*)RVAToOffset(pExe, imId->OriginalFirstThunk);	//x; 
		IMAGE_IMPORT_BY_NAME *imIbn;

		if(!pszDllName || !imTd)
			return 0;

		pszDllNameLower = strdup(pszDllName); 	//������������ ��� ��� � �������� ��������� � pszDllNameLower; 	//Dll Name Lower = DNL;  
							
//		printf("%s\n", pszDllName);	
		StrToLower(pszDllNameLower);	//��������� ��� ��� � ������ ������� (��� ����, ����� � ��� �� ���� � ������ ����� � ��� �� ��� ��� 2 ������ �������� (��������, "KERNEL32.dll" � "KERNEL32.DLL" -> "kernel32.dll"); 
		AddElemDll(&ld, pszDllNameLower);	//������� ��� ��� � ������ ������ � ������ (��. � �����) ��� ����������������� ������� � ������ �������� ������, ���� ��� ��� ��� ���� � ������ ������;  

		if(!imId->OriginalFirstThunk)	//����� ��������-������ ������ ��������� (� �� ������), ������� ������������� )
		{	
			//��� ����������� ������, imTd ����� ��������� ��������� (����������) ��������. � ��������� ������� �������� 0. 
			//(imId->FirstThunk ����� ��������� �������� (�����), ���� �� ����������� � ������������ ������������� �����, 
			//���, ��������, �����, ������������ upack'��); 
			//��� ����� � ���, ��� ����� ������ (��������, ���� ������ �� ����� ����) FirstThunk ����� ������ � �������� (1) �����-�� ������ - 
			//����� �� ����������� ������� � �������� (��� ���� �� ������ �� ���������, � ����� �����, ����� �������� � �����), � ������ ����� - 
			//�� ����� ���������, �� � �������� ����������� ������ (2): ������ � �������. 
			//�� �����, ��� ����� � (1), ����� ��������� ���������� RVA, � ��, ��� � (2) - �����. ������� � ���������� ������ ����� (��������, FirstThunk = 0x11E800B3, 11E8 - ��� ���������� RVA, � ��� 00B3 - ��� ��� �����). 
			//�� ���������� ������� �� ��� �����, ��� �� ��� �������� ����� �� �����, ��� � (2) - �������� - � � ����� � ��� ���������� ���������� RVA. 
			//�� � ����� ������������� ������ � ������, ���������� ����������� � ������� ������� � �.�. � ��� ���� �����. 
			//������� �� ������ ������ ���� ����� � �������� ������ RVA;    
			//���������; 
			imTd = (IMAGE_THUNK_DATA32*)RVAToOffset(pExe, imId->FirstThunk);	//x; 

			if(!imTd)	//���� 0, ������ ���� � ������������� ����������; 
			{
//				MessageBox(0,0,0,0);
				xFirstThunk = imId->FirstThunk;
				
				//���� rva;
				while(!imTd && (i < 9))	//4 * 8 (���) = 32 (����) = 1 dword = 4 bytes; 
				{
					xFirstThunk = xFirstThunk & (0xFFFFFFFF >> (i * 4));	//� �������� ������� ������� (��� �����);
					imTd = (IMAGE_THUNK_DATA32 *)RVAToOffset(pExe, xFirstThunk);	//����� ������� �������� ���������� �����; 
					i++;
				}

				if(!imTd)	//���� �� ��� � �� �������� ����������� ������, �������; 
				{
					free(pszDllNameLower); 
					return 0; 
				}
			}
		}
		
		while(imTd->u1.Ordinal)	//��������� ������� ����� ����� 0;
		{
			if(imTd->u1.Ordinal & 0x80000000)	//����� ������������� �� ��������?
			{
				pszFuncName = (char*)malloc(sizeof(char) * len + 1);	//������� ������ ��� �������� �������� (+ ������); 
				strcpy(pszFuncName, "0x");
				itoa((imTd->u1.Ordinal & 0x7FFFFFFF), (char*)&pszFuncName[2], 16);	//������� ����� ������� �������, ��������, ���: 0x10, 0xA, 0x15 etc; 
			}
			else	//����� ����� ������������� �� �����;
			{
				imIbn = (IMAGE_IMPORT_BY_NAME*)RVAToOffset(pExe, (DWORD)imTd->u1.AddressOfData);
				pszFuncName = (char*)malloc(sizeof(char) * strlen((char*)imIbn->Name) + 1);	//������� ������ ��� �������� ������; 
				strcpy(pszFuncName, (char*)imIbn->Name);	//��������� ������;	
			}

//			printf("%s\n", pszFuncName);
			AddElemFunc(&ld, pszDllNameLower, pszFuncName);	//������� ��� ����� � ������ ������ � ������ (��. � �����) ��� ����������������� ������� � ������ �������� ������, ���� ��� ����� ��� ���� � ������ ������;
			free(pszFuncName);	//��������� ����� ���������� ������; 
			imTd++;
		}

//		printf("\n\n");
		free(pszDllNameLower);  		 
		impSize -= sizeof(IMAGE_IMPORT_DESCRIPTOR); 
		imId++; 	 
	}

	UnmapViewOfFile(pExe);	//����������� ������; 	 
	return 1;	//�� �����; 
}
/***************************************************************************************************\
*	����� ����� PrImport;  
\***************************************************************************************************/
  
 


