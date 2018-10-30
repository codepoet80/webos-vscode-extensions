SETLOCAL EnableDelayedExpansion
set args="%*"
if not x%args:new_app=%==x%args% (
    call :lastarg %*
    set "PROJECT_PATH=!LAST_ARG!"
    if exist "!PROJECT_PATH!" (
        echo adding visualstudio code extensions
        set "SCRIPTS_DIR=!PROJECT_PATH!\_scripts"
        set "BIN_DIR=!PROJECT_PATH!\_bin"
        set "VSCODE_DIR=!PROJECT_PATH!\.vscode"
        set "EXT_DIR=%HERE%..\vscode"
        mkdir "!SCRIPTS_DIR!"
        mkdir "!BIN_DIR!"
        mkdir "!VSCODE_DIR!"
        copy "!EXT_DIR!\_scripts\*" "!SCRIPTS_DIR!\" >nul
        copy "!EXT_DIR!\tasks.json" "!VSCODE_DIR!\" >nul
        REM Tell Windows not to block script execution
        echo.>"!PROJECT_PATH!\_scripts\build.bat":Zone.Identifier
        echo.>"!PROJECT_PATH!\_scripts\run.bat":Zone.Identifier
    )
)

:lastarg
  set "LAST_ARG=%~1"
  shift
  if not "%~1"=="" goto lastarg
goto :eof