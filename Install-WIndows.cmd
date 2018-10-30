@echo off
REM Check for sufficient privileges
net session > nul 2>&1
if not %ERRORLEVEL% equ 0 (	echo Please run with Elevated Privileges && exit /b 1 )
echo.
echo Patching Palm webOS SDK to add VisualStudio Code extensions . . .
set "PALM_SCRIPTS=C:\Program Files (x86)\HP webOS\SDK"
if not exist "%PALM_SCRIPTS%\vscode" (
    mkdir "%PALM_SCRIPTS%\vscode"
)
if not exist "%PALM_SCRIPTS%\vscode\_scripts" (
    mkdir "%PALM_SCRIPTS%\vscode\_scripts"
)
copy "%~dp0\vscode-*.bat" "%PALM_SCRIPTS%\bin\" /y >nul
copy "%~dp0\_scripts\*.bat" "%PALM_SCRIPTS%\vscode\_scripts\" /y >nul
copy "%~dp0\tasks.json" "%PALM_SCRIPTS%\vscode\tasks.json" /y >nul

REM On Windows, Palm chose to force the generate script to exit as soon as the Java command was done
REM For this reason the script can't simply be patched, either the line or the whole file has to be replaced
REM It was easier just to replace the file, and since no one will probably ever update it again, that seems pretty safe
if exist "%PALM_SCRIPTS%\bin\palm-generate-original.bat" (
    copy "%cd%\palm-generate-additions.bat" "%PALM_SCRIPTS%\bin\palm-generate.bat" /y >nul
    echo Done! Existing Install Updated
) else (
    rename "%PALM_SCRIPTS%\bin\palm-generate.bat" "palm-generate-original.bat" >nul
    if exist "%PALM_SCRIPTS%\bin\palm-generate-original.bat" ( 
        copy "%~dp0\palm-generate-additions.bat" "%PALM_SCRIPTS%\bin\palm-generate.bat" /y >nul
        echo Done! Install Completed
    ) else (
        echo Error! Could not complete install.
    )
)

echo.
echo To create a VSCode-ready webOS app use:
echo palm-generate -t new_app "%userprofile%\Projects\YourNewAppName"
echo.
pause