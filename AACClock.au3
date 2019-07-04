#NoTrayIcon
#include "CCconfig.au3"
While 1
   Sleep (250)
   If ProcessExists($CCsystray) Then
   Else
	  Run($CCsystray)
	  Sleep(200)
   EndIf
   SplashOff()
   If @HOUR&@MIN > $start And @HOUR&@MIN < $end And ProcessExists($app) Then
	  Run(@ComSpec & " /c " & "taskkill.exe /IM "& $app &" /F", "", @SW_HIDE)
;	  WinKill($app,"")
   ElseIf @HOUR&@MIN = $start And ProcessExists($app) Then
	  SplashTextOn($FreindlyAppName & " Blocker", $FreindlyAppName & $sMessage & (60- @sec) , -1, 60, -1, 50, 33, "", 24)
   EndIf
WEnd