@echo off
setlocal

set "tools_folder=%~dp0Tools"
set "temp_folder=%~dp0Temp_UTZ"

mkdir "%temp_folder%" 2>nul
mkdir "%temp_folder%\Windows\System32\" 2>nul
mkdir "%temp_folder%\sources" 2>nul
mkdir "%temp_folder%\wimlib" 2>nul


xcopy "%tools_folder%\wimlib" "%temp_folder%\wimlib" /s /e /y
copy "%tools_folder%\1.bmp" "%temp_folder%\sources\background.bmp"
copy "%tools_folder%\spwizimg.dll" "%temp_folder%\sources\spwizimg.dll"
copy "%tools_folder%\1.bmp" "%temp_folder%\Windows\System32\Setup.bmp"

"%temp_folder%\wimlib\wimlib-imagex.exe"  update boot.wim 2 --command="add Temp_UTZ\Windows \Windows"
"%temp_folder%\wimlib\wimlib-imagex.exe"  update boot.wim 2 --command="add Temp_UTZ\sources \sources"


rem Delete the Temp_UTZ folder and its contents
rd /s /q "%temp_folder%"
