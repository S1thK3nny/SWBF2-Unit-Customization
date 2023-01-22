@if %1x==x goto noplatform
@set MUNGE_PLATFORM=%1
@set MUNGE_DIR=MUNGED\%MUNGE_PLATFORM%

@rem Munge global, shell and side specific sound data
@call soundmungedir _BUILD\sound\cw\%MUNGE_DIR%     sound\cw     sound\cw\%MUNGE_PLATFORM%     %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound cw
@call soundmungedir _BUILD\sound\gcw\%MUNGE_DIR%    sound\gcw    sound\gcw\%MUNGE_PLATFORM%    %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound gcw
@call soundmungedir _BUILD\sound\global\%MUNGE_DIR% sound\global sound\global\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound global nolevelfile
@call soundmungedir _BUILD\sound\shell\%MUNGE_DIR%  sound\shell  sound\shell\%MUNGE_PLATFORM%  %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound shell
@rem Munge world specific sound data
@call soundmungedir _BUILD\sound\worlds\cor\%MUNGE_DIR% sound\worlds\cor sound\worlds\cor\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound cor
@call soundmungedir _BUILD\sound\worlds\dag\%MUNGE_DIR% sound\worlds\dag sound\worlds\dag\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound dag
@call soundmungedir _BUILD\sound\worlds\dea\%MUNGE_DIR% sound\worlds\dea sound\worlds\dea\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound dea
@call soundmungedir _BUILD\sound\worlds\end\%MUNGE_DIR% sound\worlds\end sound\worlds\end\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound end
@call soundmungedir _BUILD\sound\worlds\fel\%MUNGE_DIR% sound\worlds\fel sound\worlds\fel\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound fel
@call soundmungedir _BUILD\sound\worlds\gal\%MUNGE_DIR% sound\worlds\gal sound\worlds\gal\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound gal
@call soundmungedir _BUILD\sound\worlds\geo\%MUNGE_DIR% sound\worlds\geo sound\worlds\geo\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound geo
@call soundmungedir _BUILD\sound\worlds\hot\%MUNGE_DIR% sound\worlds\hot sound\worlds\hot\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound hot
@call soundmungedir _BUILD\sound\worlds\kam\%MUNGE_DIR% sound\worlds\kam sound\worlds\kam\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound kam
@call soundmungedir _BUILD\sound\worlds\kas\%MUNGE_DIR% sound\worlds\kas sound\worlds\kas\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound kas
@call soundmungedir _BUILD\sound\worlds\mus\%MUNGE_DIR% sound\worlds\mus sound\worlds\mus\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound mus
@call soundmungedir _BUILD\sound\worlds\myg\%MUNGE_DIR% sound\worlds\myg sound\worlds\myg\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound myg
@call soundmungedir _BUILD\sound\worlds\nab\%MUNGE_DIR% sound\worlds\nab sound\worlds\nab\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound nab
@call soundmungedir _BUILD\sound\worlds\pol\%MUNGE_DIR% sound\worlds\pol sound\worlds\pol\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound pol
@call soundmungedir _BUILD\sound\worlds\spa\%MUNGE_DIR% sound\worlds\spa sound\worlds\spa\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound spa
@call soundmungedir _BUILD\sound\worlds\tan\%MUNGE_DIR% sound\worlds\tan sound\worlds\tan\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound tan
@call soundmungedir _BUILD\sound\worlds\tat\%MUNGE_DIR% sound\worlds\tat sound\worlds\tat\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound tat
@call soundmungedir _BUILD\sound\worlds\uta\%MUNGE_DIR% sound\worlds\uta sound\worlds\uta\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound uta
@call soundmungedir _BUILD\sound\worlds\yav\%MUNGE_DIR% sound\worlds\yav sound\worlds\yav\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound yav
@call soundmungedir _BUILD\sound\worlds\hero\%MUNGE_DIR% sound\worlds\hero sound\worlds\hero\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound hero

@set BAT_PATH=%~p0
@set WORLD_NAME=%BAT_PATH:~-4,3%
@call soundmungedir _BUILD\sound\worlds\%WORLD_NAME%\%MUNGE_DIR% sound\worlds\%WORLD_NAME% sound\worlds\%WORLD_NAME%\%MUNGE_PLATFORM% %MUNGE_PLATFORM% _BUILD _LVL_%MUNGE_PLATFORM%\sound _BUILD\sound %WORLD_NAME%
@for /F "tokens=2*" %%A in ('reg query "HKEY_CURRENT_USER\Software\Pandemic Studios\Visual Munge\General" /v ModToolsBattlefrontDir') do @set BF2_PATH=%%B
xcopy _LVL_%MUNGE_PLATFORM%\SOUND\* "%BF2_PATH%\addon\%WORLD_NAME%\data\_LVL_PC\SOUND\" /Y

@goto exit
:noplatform
@echo Platform must be specified as the first argument
:exit