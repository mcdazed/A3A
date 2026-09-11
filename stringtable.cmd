@echo off

mkdir c:\repo
cd /d c:\repo

for /R %%i in (*.xml) do unix2dos -e -s -v "%%i"
for /R %%i in (*.bat) do unix2dos -e -s -v "%%i"

for /R %%i in (*.xml) do dos2unix -e -s -v "%%i"

pause
exit
