#NoTrayIcon
#include "CCconfig.au3"

While 1
   Sleep (100)
   If ProcessExists($CCsystray) Then
;	  ToolTip($CCsystray &" exists", 10,10)
   Else
;	  ToolTip($CCsystray &" does not exist", 10, 10)
	  Run($CCsystray)
	  Sleep(1000)
   EndIf


   Local $hFileOpen = FileOpen($actfile, 0)
   $act = FileRead($hFileOpen)
;   ToolTip(@HOUR, 0, 0)
;   WinWaitActive($app)
   If $act = 1 And @HOUR > $start And @HOUR < $end And ProcessExists("stritz.exe") Then
	  ;Run("taskkill.exe /IM stritz.exe /F")
	  Run(@ComSpec & " /c " & "taskkill.exe /IM stritz.exe /F", "", @SW_HIDE)
;	  Run(@ComSpec & " /c " & "taskkill.exe /IM notepad.exe /F", "", @SW_HIDE)
;	  WinKill($app,"")
   EndIf


WEnd