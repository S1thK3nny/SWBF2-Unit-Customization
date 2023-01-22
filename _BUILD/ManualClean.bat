@echo off 
Echo.
Echo Manual Clean tool v2
Echo.
pause
Echo Cleaning "TEXTURE" files 
del ".\*.TEXTURE" /S
Echo Cleaning "model" files
del ".\*.model" /S
Echo Cleaning "REQ" files
del ".\*.REQ" /S
del "..\_LVL_PC\*.REQ" /S
Echo Cleaning "class" files
del ".\*.class" /S
Echo Cleaning "LVL" files
del ".\*.LVL" /S
del "..\_LVL_PC\*.LVL" /S
Echo Cleaning "anims" files
del ".\*.anims" /S
Echo Cleaning "zaabin" files
del ".\*.zaabin" /S
Echo Cleaning "zabfin" files
del ".\*.zabfin" /S
Echo Cleaning CONFIG" files
del ".\*.CONFIG" /S
Echo Cleaning "SCRIPT" files
del ".\*.SCRIPT" /S
del "..\addme\munged\*.SCRIPT" /S
Echo Cleaning "SHADER" files
del ".\*.SHADER" /S
Echo Cleaning "files" files
del ".\*.files" /S
Echo.

SET localcd=..\..\..
SET pfsteam=Program Files\Steam\steamapps\common\Star Wars Battlefront II\GameData\addon
SET xsm=Program Files (x86)\Steam\steamapps\common\Star Wars Battlefront II\GameData\addon
SET pfstand=Program Files\LucasArts\Star Wars Battlefront II\GameData\addon
SET xsd=Program Files (x86)\LucasArts\Star Wars Battlefront II\GameData\addon

:uiput
SET /p mapID=Enter your mod's three letter map name: 
IF '%mapID%'=='...' GOTO uiput
IF '%mapID%'=='..' GOTO uiput
IF '%mapID%'=='.' GOTO uiput
IF '%mapID%'=='' GOTO uiput

IF EXIST "%localcd%\%pfsteam%\%mapID%\addme.script" GOTO steam
IF EXIST "%localcd%\%xsm%\%mapID%\addme.script" GOTO x86sm
IF EXIST "%localcd%\%pfstand%\%mapID%\addme.script" GOTO stand
IF EXIST "%localcd%\%xsd%\%mapID%\addme.script" GOTO x86sd

:steam 
Echo Cleaning "LVL" files in mapID
del "%localcd%\%pfsteam%\%mapID%\*.LVL" /S
Echo Cleaning "REQ" files in mapID
del "%localcd%\%pfsteam%\%mapID%\*.REQ" /S
Echo Cleaning "SCRIPT" files in mapID
del "%localcd%\%pfsteam%\%mapID%\*.SCRIPT" /S
GOTO cc

:x86sm
Echo Cleaning "LVL" files in mapID
del "%localcd%\%xsm%\%mapID%\*.LVL" /S
Echo Cleaning "REQ" files in mapID
del "%localcd%\%xsm%\%mapID%\*.REQ" /S
Echo Cleaning "SCRIPT" files in mapID
del "%localcd%\%xsm%\%mapID%\*.SCRIPT" /S
GOTO cc

:stand 
Echo Cleaning "LVL" files in mapID
del "%localcd%\%pfstand%\%mapID%\*.LVL" /S
Echo Cleaning "REQ" files in mapID
del "%localcd%\%pfstand%\%mapID%\*.REQ" /S
Echo Cleaning "SCRIPT" files in mapID
del "%localcd%\%pfstand%\%mapID%\*.SCRIPT" /S
GOTO cc

:x86sd 
Echo Cleaning "LVL" files in mapID
del "%localcd%\%xsd%\%mapID%\*.LVL" /S
Echo Cleaning "REQ" files in mapID
del "%localcd%\%xsd%\%mapID%\*.REQ" /S
Echo Cleaning "SCRIPT" files in mapID
del "%localcd%\%xsd%\%mapID%\*.SCRIPT" /S
GOTO cc

:cc
Echo Clean process complete!
pause
exit