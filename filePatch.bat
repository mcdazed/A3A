@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
cd /d "%ROOTDIR%"
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%

start "" "steam://openurl/https://google.com"
cls
echo WAIT FOR STEAM...
pause

mkdir "%userprofile%\AppData\Local\Arma 3"
cd "%userprofile%\AppData\Local\Arma 3"

del /s /q /f *.log
del /s /q /f *.rpt

cd "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%"
del /q /f missions
rd /s /q missions

mklink /J missions "%ROOTDIR%\A3A\addons\maps"

cd "%ROOTDIR%"

start "" "%userprofile%\AppData\Local\Arma 3"

"%a3dir%\arma3_x64.exe" -debug -filePatching -showScriptErrors ^
-noSplash -name=%a3name% -malloc=bestmalloc -noPauseAudio ^
"-mod=%a3dir%\!Workshop\@CBA_A3;%a3dir%\!Workshop\@3den Enhanced;%a3dir%\!Workshop\@Advanced Developer Tools;C:\repo\ace\.hemttout\dev;C:\repo\a3a\build\A3A-Plus;%a3dir%\!Workshop\@CUP Terrains - Core;%a3dir%\!Workshop\@CUP Terrains - Maps;%a3dir%\!Workshop\@Virolahti - Valtatie 7;P:\x\mcd\.hemttout\release"

cd "%userprofile%\Documents\Arma 3 - Other Profiles\%a3name%"

rd /q missions

mkdir missions

exit
