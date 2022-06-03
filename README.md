```
---------------------------------------------------------------------------------------------------------
REQUEST: If you use this patch, kindly spend at least $23 for any good cause, dedicating to all wellbeing
(same price as registering the game back in 1995)
(drop me a note please : -) 
ram@pluslab.com www.pluslab.com github @rambkk
---------------------------------------------------------------------------------------------------------
```

This patch/mod for The Pit 4.17 is a Tribute to James R. Berry, the creator of The Pit.
The Pit - BBS door game by Midas Touch Software, James R. Berry
James is gone but not forgotten. 

The Pit, being one of my all time favorites, I have decided to work on giving a new life to this after also see some people asking publicly.

Please check this Tribute: https://michaelduff.net/2011/06/02/a-tribute-to-james-royal-berry-1967-1999/

The legendary The Pit is a BBS door game for the old days dial-up BBS before the Internet age. Some of the BBSes are still running, now mostly via telent/rlogin/ssh/etc while some seem to be still offer old style telephone dial-up service.
As the creator of the game is long gone, the latest version (4.17) is pretty much limited to player finishing at level 8. As, this is one of my most favorite games, I have decided to check the binary and see if a simple patch could do the job.

Well, nope, that could not be done as the higher level calculation function does not exist in the DEMO version. From this, I decided to initially write some assembly code for this function as well as to remove the checks for the level limit. I started writing a TSR under Dosbox-x and it worked fine. After sometime, I found a tool which could unpack the file and a patch could be directly applied on the binary. So I have derived 2 ways to get this working after a few sleepless nights, it's pretty much working now : -)

I have tested this running a bbs software on Dosbox-x and running terminal emulator client telix on a separate session on Dosbox (basically running 2 dos box emulators at the same time on the same computer) and connecting them via the Dosbox-x and Dosbox serial port emulator modem setting which worked fine even for the pterm graphical interface of the game.

Here I am sharing the assembly code for the level calculation function which I have written in x86 16-bit assembly language by following the level up guideline of the game.


The Pit bbs door game and the graphical terminal can be downloaded from https://breakintochat.com/wiki/The_Pit

Please note that I have not formatted the code properly. I have tested this code with the a86 compiler from Eric Isaacson which is available at http://eji.com/a86/

RA/ELEBBS setup THE PIT 4.17 door with the following Menu item OptData (change the directory name as appropriate) \
Note that the \*M could be important here as it should free up more memory.
```bat
command.com /c \ra\runpit.bat *M
```
The content of runpit.bat can be found in The Pit instructions document. Mine is very simple:
```bat
ECHO OFF
CLS
CD PIT4
PIT
CD ..
```

For setting up The Pit, setup normally and from control.exe, I am using the following:
```
Door File Setting -> BBS Door File Type -> GENERIC Door File DOOR.SYS
Path To Door File Type -> \ra\
```

### PTERM.EXE Graphic Terminal notes
For running the PTERM.EXE graphic terminal for the game, I have tested only with Telix. \
I had to exit Telix without hanging-up at the "Please activate your GRAPHICS TERMINAL now ...." to start the pterm client. \
(Tried the Telix external protocol settings but this did not work well.) \
This method could actually work with any terminal emulation program which supports exiting without hanging-up.






