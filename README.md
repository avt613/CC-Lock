CC-Lock

This program is made to close a preset application between certain set times. The current code is set to close Candy Crush between 13:40 and 18:00.
I made it for someone who found that when he was on the computer, instead of doing work, he would end up just playing games.

There are main files of code "CClock.au3", "CCconfig.au3" and "CCsystray.au3".
"CCconfig.au3" contains all of the configurations.
  $app = name of the program to check if open and kill (Take it of the "tasklist" command in cmd)
  $CCsystray = name and location of the the CCsystray exe once converted to exe
  $CClock = name and location of the the CClock exe once converted to exe
  $start = the time when the program should start monitering and killing the preset application
  $end = the time when the program should stop monitering and killing the preset application
  $sMessage = the countdown message the program should start saying 60 seconds before the application will b killed

The program is coded in autoit so you may need to download the program from the official website to run the code or the convert it to an exe. https://www.autoitscript.com/site/autoit/downloads/

If you have any questions I am happy to try and answer.
If there are any legal problems with this project please inform me as I am new to github and sharing coding online.
