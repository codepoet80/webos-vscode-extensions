SETLOCAL EnableDelayedExpansion
set args="%*"
if "%~1" NEQ "" (
	if x%args:new_scene=%==x%args% (
		call :lastarg %*
		set "PROJECT_PATH=!LAST_ARG!"
		if exist "!PROJECT_PATH!" (
			echo adding visualstudio code extensions
			set "VSCODE_DIR=!PROJECT_PATH!\.vscode"
			set "BIN_DIR=!PROJECT_PATH!\_bin"
			set "EXT_DIR=%HERE%..\vscode"
			mkdir "!VSCODE_DIR!"
			mkdir "!BIN_DIR!"
			copy "!EXT_DIR!\_scripts\*" "!VSCODE_DIR!\" >nul
			copy "!EXT_DIR!\tasks.json" "!VSCODE_DIR!\" >nul
			REM Tell Windows not to block script execution
			echo.>"!VSCODE_DIR!\build.bat":Zone.Identifier
			echo.>"!VSCODE_DIR!\run.bat":Zone.Identifier
		)
	)
)

:lastarg
  set "LAST_ARG=%~1"
  shift
  if not "%~1"=="" goto lastarg
goto :eof