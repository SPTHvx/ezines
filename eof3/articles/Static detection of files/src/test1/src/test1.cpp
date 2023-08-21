// test1.cpp : Defines the entry point for the application.
//



//m1x
//pr0mix
//EOF



#include <windows.h> 
#include "resource.h"

 
#pragma comment(linker, "/FILEALIGN:0x200")
#define MAX_LOADSTRING 100


// Global Variables:
HINSTANCE hInst;									// current instance
char szWindowClass[MAX_LOADSTRING] = "VX class";	// The title bar text
char szMsg[] = "VX RULEZ!"; 

// Foward declarations of functions included in this code module:
ATOM				MyRegisterClass(HINSTANCE hInstance);


int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	MyRegisterClass(hInstance);
	MessageBox(0, szMsg, szMsg, MB_OK); //!!!!! 

	return 0;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
//  COMMENTS:
//
//    This function and its usage is only necessary if you want this code
//    to be compatible with Win32 systems prior to the 'RegisterClassEx'
//    function that was added to Windows 95. It is important to call this function
//    so that the application will get 'well formed' small icons associated
//    with it.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;

	wcex.cbSize = sizeof(WNDCLASSEX); 

	wcex.style			= 0;
	wcex.lpfnWndProc	= 0;
	wcex.cbClsExtra		= 0;
	wcex.cbWndExtra		= 0;
	wcex.hInstance		= hInstance;
	wcex.hIcon			= LoadIcon(hInstance, (LPCTSTR)IDI_TEST1);
	wcex.hCursor		= 0;
	wcex.hbrBackground	= 0;
	wcex.lpszMenuName	= 0;
	wcex.lpszClassName	= szWindowClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance, (LPCTSTR)IDI_SMALL);

	return RegisterClassEx(&wcex);
}





