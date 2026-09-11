@echo off
set ROOTDIR=%~dp0
set ROOTDIR=%ROOTDIR:~0,-1%
cd /d "%ROOTDIR%"
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

taskkill /f /im explorer.exe
taskkill /f /im explorer.exe
taskkill /f /im explorer.exe
taskkill /f /im explorer.exe

robocopy /s /e "%ROOTDIR%" "%ROOTDIR%.old" /xd .git

timeout /t 1 /nobreak >nul 2>&1

git reset --soft HEAD~20

timeout /t 1 /nobreak >nul 2>&1

git push origin +stable

start "" "http://github.com/mcdazed/a3a"

pause
start "" "%windir%\explorer.exe"
rd /s /q "%ROOTDIR%"
exit
