/* Check if VBoxHook.dll exists */

#include <windows.h>

int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	if(LoadLibrary("VBoxHook.dll") != NULL)
	{
		MessageBox(NULL,"VBox detected!","Warning",MB_OK|MB_ICONWARNING);
	}

	else
	{
		MessageBox(NULL,"Not inside VBox","Info",MB_OK|MB_ICONINFORMATION);
	}
}