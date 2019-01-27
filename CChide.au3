Opt("TrayIconHide", 1) ;0=show, 1=hide tray icon
#include "CCconfig.au3"

While 1
   WinWaitActive($app)
   WinMove("[CLASS:Notepad]", "", 1400, 0)
   ; Avoid high CPU usage.
   Sleep(50)
WEnd