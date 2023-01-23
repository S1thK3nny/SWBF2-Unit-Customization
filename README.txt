This project makes use of the SWBF2-Remaster API, utilizing the option scripts and also the rema_database.
Whilst a lot more than a concept already, this can serve as a template for future modders who would like to develop something similar.
Note: This requires advanced knowledge of modding Battlefront 2, as well as an average level of knowledge of Lua.

How do you compile and install the option script?

1. Make your changes to the POC_option_script in the custom LVL folder. Incase you will copy this for your own mod, make sure to change anything named POC to your own 3 letter mod id. This also goes for the rema.modName.POC localization string so that it will show up ingame correctly.
2. Inside _BUILD/ open up the CustomLVL.exe and munge your option script.
3. Locate _LVL_PC/CustomLVL/ and copy the lvl file to addon/Your3LetterFolder/scripts - It is important that the scripts folder is in the same directory as your data folder of your three letter folder!
4. When ingame, locate the remaster options menu and install the script by typing your three letters into the text prompt. This might take a few tries, Remaster can be a bit confused.
5. If you were successful, you should see a new minipage popping up in the remaster options menu. It will be named according to your rema.modName.XXX string.
6. Congratulations!

Again, this is only for the option script, which will "just" add the minipage.
