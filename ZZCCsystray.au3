#include "CCconfig.au3"
Opt("TrayMenuMode", 3)
TraySetState(1) ; Show the tray menu.
;~ Creates tray menue item to exit
Local $Exit = TrayCreateItem("Exit")

;~ Forever loop
While 1
;~ Checks the time and locks or unlocks the program depending on the preset times
   If @HOUR&@MIN > $start And @HOUR&@MIN < $end Then
;~ 	  Change to "Locked" icon
 	  TraySetIcon("Icon_102.ico")
	  TraySetToolTip ($FreindlyAppName & " is locked")
   Else
;~ 	  Change to "Unlocked" icon
	  TraySetIcon("Icon_101.ico")
	  TraySetToolTip ($FreindlyAppName & " is unlocked")
   EndIf

   Switch TrayGetMsg()
   Case $Exit
;~ 		 Password dialogue
		 Local $pass = InputBox("Password", "What is the password?", "", "*")
;~ 		 This checks the time and date and is used as the password. To change the password just change the line below
		 Local $time = @MIN & @HOUR & @MON & @MDAY & @WDAY
		 Verifies password
		 If $pass == $time Then
;~ 			Kill the $CClock script which stops the chosen app from running
;~ 			I've done this command twice to make sure to kill all instances of $CClock
			Run(@ComSpec & " /c " & "taskkill.exe /IM "& $CClock &" /F", "", @SW_HIDE)
			Run(@ComSpec & " /c " & "taskkill.exe /IM "& $CClock &" /F", "", @SW_HIDE)
			Exit
		 Else
			MsgBox(0, "Incorrect Password","The password you typed was incorrect.")
		 EndIf
   EndSwitch

;~    Check whether $CClock is running, if not then open it
   If ProcessExists($CClock) Then
;~    Do nothing if $CClock is running
   Else
;~ 	  Run $CClock if it is closed
	  Run($CClock)
   EndIf
   Sleep(250)
WEnd
