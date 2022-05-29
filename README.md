This patch/mod is a Tribute to James R. Berry, the creator of The Pit.
James is gone but not forgotten. 

The Pit, being one of my all time favorites, I have decided to work on giving a new life to this after seeing some people requesting for this.

Please check this Tribute: https://michaelduff.net/2011/06/02/a-tribute-to-james-royal-berry-1967-1999/

The legendary The Pit is a BBS door game for the old days dial-up BBS before the Internet age. Some of the BBSes are still running, now mostly via telent/rlogin/ssh/etc while some seem to be still offer old style telephone dial-up service.
As the creator of the game is long gone, the latest version (4.17) is pretty much limited to player finishing at level 8. As, this is one of my most favorite games, I have decided to check the binary and see if a simple patch could do the job.

Well, nope, that could not be done as the higher level calculation function does not exist in the DEMO version. From this, I decided to initially write some assembly code for this function as well as to remove the checks for the level limit. I started writing a TSR under Dosbox-x and it worked fine. After sometime, I found a tool which could unpack the file and a patch could be directly applied on the binary. So I have derived 2 ways to get this working after a few sleepless nights, it's pretty much working now : -)

I have tested this running a bbs software on Dosbox-x and running terminal emulator client telix on a separate session on Dosbox (basically running 2 dos box emulators at the same time on the same computer) and connecting them via the Dosbox-x and Dosbox serial port emulator modem setting which worked fine even for the pterm graphical interface of the game.

Here I am sharing the assembly code for the level calculation function which I have written in x86 16-bit assembly language by following the level up guideline of the game.


The Pit bbs door game and the graphical terminal can be downloaded from https://breakintochat.com/wiki/The_Pit

Please note that I have not formatted the code properly. I have tested this code with the a86 compiler from Eric Isaacson which is available at http://eji.com/a86/










