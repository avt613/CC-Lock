#include ".\Include\File.au3"
#include "CCconfig.au3"
_FileWriteToLine($actfile, 1, "1", 1)
Opt("TrayMenuMode", 3)
TraySetState(1) ; Show the tray menu.
TraySetIcon("shell32.dll", -48) ; Set the tray menu icon using the shell32.dll and the random index number.
Local $Enable = TrayCreateItem("Enable", -1, -1, 1)
TrayItemSetState($Enable, 1)
Local $Disable5 = TrayCreateItem("Disable for 5 min", -1, -1, 1)
Local $Disable10 = TrayCreateItem("Disable for 10 min", -1, -1, 1)
Local $Disable30 = TrayCreateItem("Disable for 30 min", -1, -1, 1)
Local $Disable60 = TrayCreateItem("Disable for 60 min", -1, -1, 1)

Local $unlocked = 0
Local $setsleep = 0
Local $pass, $time
Local $hTimer = TimerInit()

Func Activate()
   _FileWriteToLine($actfile, 1, "1", 1)
   $unlocked = 0
   TrayItemSetState($Disable5, 4)
   TrayItemSetState($Disable10, 4)
   TrayItemSetState($Disable30, 4)
   TrayItemSetState($Disable60, 4)
   TrayItemSetState($Enable, 1)
EndFunc

Func Deactivate()
   $pass = InputBox("Password", "What is the password?", "", "*")
		 $time = @MIN & @HOUR & @MDAY & @MON & @WDAY
		 If $pass == $time Then
			_FileWriteToLine($actfile, 1, "0", 1)
			$unlocked = 1
			$hTimer = TimerInit()
		 Else
			TrayItemSetState($Disable5, 4)
			TrayItemSetState($Disable10, 4)
			TrayItemSetState($Disable30, 4)
			TrayItemSetState($Disable60, 4)
			TrayItemSetState($Enable, 1)
		 EndIf
EndFunc

While 1
   Switch TrayGetMsg()
	  Case $Enable
		 Activate()

	  Case $Disable5
		 $sleep = 300000
		 Deactivate()


	  Case $Disable10
		 $setsleep = 600000
		 Deactivate()

	  Case $Disable30
		 $setsleep = 1800000
		 Deactivate()

	  Case $Disable60
		 $setsleep = 6000000
		 Deactivate()

;		 Case $idexit ; Exit the loop.
;			Exit
   EndSwitch

   Local $fDiff = TimerDiff($hTimer)
   If $unlocked = 1 And $fDiff > $setsleep Then
	  Activate()
   EndIf

   Local $hFileOpen = FileOpen($actfile, 0)
   $act = FileRead($hFileOpen)
   If $act = 1 And @HOUR > $start And @HOUR < $end Then
 	  TraySetIcon("Icon_102.ico")
	  TraySetToolTip ("Candy Crush Soda Saga is disabled")
   Else
	  TraySetIcon("Icon_103.ico")
	  TraySetToolTip ("Candy Crush Soda Saga is enabled")
	  TrayItemSetState($Disable5, 4)
	  TrayItemSetState($Disable10, 4)
	  TrayItemSetState($Disable30, 4)
	  TrayItemSetState($Disable60, 4)
	  TrayItemSetState($Enable, 1)
   EndIf


   If ProcessExists($CClock) Then
;	  ToolTip($CClock &" exists", 0, 100)
   Else
;	  ToolTip($CClock &" does not exist", 0, 100)
	  Run($CClock)
   EndIf
   Sleep(100)
WEnd
