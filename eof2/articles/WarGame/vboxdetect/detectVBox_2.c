/* Check if \\.\VBoxMiniRdrDN exists */

#include <windows.h>

int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	if(CreateFile("\\\\.\\VBoxMiniRdrDN",GENERIC_READ,FILE_SHARE_READ,
		NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL) != INVALID_HANDLE_VALUE)
	{
		MessageBox(NULL,"VBox detected!","Warning",MB_OK|MB_ICONWARNING);
	}

	else
	{
		MessageBox(NULL,"Not inside VBox","Info",MB_OK|MB_ICONINFORMATION);
	}
}