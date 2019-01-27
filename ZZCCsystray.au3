#include "CCconfig.au3"
Opt("TrayMenuMode", 3)
TraySetState(1) ; Show the tray menu.
Local $Exit = TrayCreateItem("Exit")
While 1
   If @HOUR&@MIN > $start And @HOUR&@MIN < $end Then
 	  TraySetIcon("Icon_102.ico")
	  TraySetToolTip ("Candy Crush is disabled")
   Else
	  TraySetIcon("Icon_101.ico")
	  TraySetToolTip ("Candy Crush is enabled")
   EndIf
   Switch TrayGetMsg()
	  Case $Exit
		 Local $pass = InputBox("Password", "What is the password?", "", "*")
		 Local $time = @MIN & @HOUR & @MON & @MDAY & @WDAY
		 If $pass == $time Then
			Run(@ComSpec & " /c " & "taskkill.exe /IM "& $CClock &" /F", "", @SW_HIDE)
			Run(@ComSpec & " /c " & "taskkill.exe /IM "& $CClock &" /F", "", @SW_HIDE)
			Exit
		 Else
			MsgBox(0, "Incorrect Password","The password you typed was incorrect.")
		 EndIf
   EndSwitch
   If ProcessExists($CClock) Then
   Else
	  Run($CClock)
   EndIf
   Sleep(250)
WEnd
