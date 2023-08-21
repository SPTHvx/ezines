; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
; �������������������������������������������������������������������������
    .code
; �������������������������������������������������������������������������

HandlerRoutine proc dwCtrlType:DWORD

    SWITCH dwCtrlType

      CASE CTRL_C_EVENT

        print "CTRL_C_EVENT"
        invoke Sleep, 2000

      CASE CTRL_CLOSE_EVENT

        print "CTRL_CLOSE_EVENT"
        invoke Sleep, 2000

      CASE CTRL_BREAK_EVENT

        print "CTRL_BREAK_EVENT"
        invoke Sleep, 2000

      CASE CTRL_LOGOFF_EVENT

        print "CTRL_LOGOFF_EVENT"
        invoke Sleep, 2000

      CASE CTRL_SHUTDOWN_EVENT

        print "CTRL_SHUTDOWN_EVENT"
        invoke Sleep, 2000

    ENDSW

    ;---------------------------------------------------------------
    ; Return FALSE so the control signal will be passed to the next
    ; handler in the list (the default handler, in this case).
    ;---------------------------------------------------------------

    return FALSE

HandlerRoutine endp

; �������������������������������������������������������������������������
start:
; �������������������������������������������������������������������������

    invoke SetConsoleCtrlHandler, HandlerRoutine, TRUE

    ;-----------------------------------------------------
    ; Wait for the default handler to terminate the app.
    ; The Sleep(10) avoids hogging the CPU while waiting.
    ;-----------------------------------------------------

    .WHILE 1
      invoke Sleep, 10
    .ENDW

; �������������������������������������������������������������������������
end start