Dim oShell : Set oShell = CreateObject("WScript.Shell")

oShell.Run "notepad"

WScript.Sleep 3000

If Hour(Now()) >= 18 OR hour(Now()) < 9 Then

   //let it run

Else

   //close application

oShell.Run "taskkill /im notepad.exe", , True

End If