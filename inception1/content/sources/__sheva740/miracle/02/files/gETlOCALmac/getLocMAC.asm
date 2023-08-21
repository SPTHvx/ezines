.586
.model flat, stdcall
option casemap:none

include     \masm32\include\windows.inc
include     \masm32\include\user32.inc
include     \masm32\include\kernel32.inc
include     \masm32\include\IpHlpApi.inc
include     \masm32\include\masm32.inc

includelib  \masm32\lib\user32.lib
includelib  \masm32\lib\kernel32.lib
includelib  \masm32\lib\IpHlpApi.lib
includelib  \masm32\lib\masm32.lib
.data


IP_ADDRESS_STRING STRUCT
    String BYTE 16 dup(?)
IP_ADDRESS_STRING ENDS

IP_MASK_STRING TYPEDEF IP_ADDRESS_STRING

IP_ADDR_STRING STRUCT
    Next      DWORD             ?
    IpAddress IP_ADDRESS_STRING <>
    IpMask    IP_MASK_STRING    <>
    Context   DWORD             ?
IP_ADDR_STRING ENDS

PIP_ADDR_STRING TYPEDEF PTR IP_ADDR_STRING

MAX_ADAPTER_DESCRIPTION_LENGTH  equ 128
MAX_ADAPTER_NAME_LENGTH         equ 256
MAX_ADAPTER_ADDRESS_LENGTH      equ 8

IP_ADAPTER_INFO STRUCT
    Next                DWORD ?
    ComboIndex          DWORD ?
    AdapterName         BYTE MAX_ADAPTER_NAME_LENGTH + 4 dup(?)
    Description         BYTE MAX_ADAPTER_DESCRIPTION_LENGTH + 4 dup(?)
    AddressLength       DWORD ?
    Address             BYTE MAX_ADAPTER_ADDRESS_LENGTH dup(?)
    Index               DWORD ?
    _Type               DWORD ?
    DhcpEnabled         DWORD ?
    CurrentIpAddress    PIP_ADDR_STRING ?
    IpAddressList       IP_ADDR_STRING <>
    GatewayList         IP_ADDR_STRING <>
    DhcpServer          IP_ADDR_STRING <>
    HaveWins            BOOL ?
    PrimaryWinsServer   IP_ADDR_STRING <>
    SecondaryWinsServer IP_ADDR_STRING <>
    LeaseObtained       DWORD ?
    LeaseExpires        DWORD ?
IP_ADAPTER_INFO ENDS




pinfo       IP_ADAPTER_INFO <>

len         dd  0
String      db  '%02X:%02X:%02X:%02X:%02X:%02X',0
Buffer      db  18 dup (0)
Text        db  'MAC Address,',0

.code
Start:
    invoke  GetAdaptersInfo,addr pinfo,addr len
    invoke  GlobalAlloc,GMEM_FIXED,len
    push    eax
    invoke  GetAdaptersInfo,eax,addr len
    pop     esi
    push    esi
    assume  esi:ptr IP_ADAPTER_INFO
    movzx   eax,byte ptr [esi].Address[5]
    push    eax
    movzx   eax,byte ptr [esi].Address[4]
    push    eax
    movzx   eax,byte ptr [esi].Address[3]
    push    eax
    movzx   eax,byte ptr [esi].Address[2]
    push    eax
    movzx   eax,byte ptr [esi].Address[1]
    push    eax
    movzx   eax,byte ptr [esi].Address[0]
    push    eax
    push    offset String
    push    offset Buffer
    call    wsprintf
    pop     eax
    invoke  GlobalFree,eax
    ;invoke  MessageBox,0,addr Buffer,addr Text,MB_OK
    invoke  StdOut, addr Buffer 
    invoke  ExitProcess,eax

end     Start