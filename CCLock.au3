;Opt("TrayIconHide", 1) ;0=show, 1=hide tray icon
#include "CCconfig.au3"
Example()

Func Example()
    ; Create an endless loop, 1 will always be 1 therefore True.
    While 1
	      WinWaitActive($app)
		 ; Retrieve the position as well as the height and width of the Notepad window. We will use this when we have to move the window back to the original position.
		 Local $aPos = WinGetPos($app)
		 Run("CChide.exe")


		Local $pass = InputBox("Password", "What is the password?", "", "*")
		Local $time = @MIN & @HOUR
		If $pass == $time Then
		   ;WinKill("CChide.exe","")
		   WinKill("CChide.bat","")
		   WinMove($app, "", $aPos[0], $aPos[1], $aPos[2], $aPos[3])
		   Exit 90
		Else
		   ;WinKill("CChide.exe","")
		   WinKill("CChide.bat","")
		   WinMove($app, "", $aPos[0], $aPos[1], $aPos[2], $aPos[3])
		   WinKill($app,"")
	    EndIf

	  ; Avoid high CPU usage.
       Sleep(50)
    WEnd
EndFunc   ;==>Example
