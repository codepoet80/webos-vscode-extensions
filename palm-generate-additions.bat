@echo off
setlocal EnableDelayedExpansion

@rem look for java.exe in path (disabled to fix 32-bit java support on 64-bit windows)
@rem call :which java.exe
@rem if ERRORLEVEL 1 (
@rem  echo error: java.exe not found
@rem  exit /b 1
@rem )

@rem the jar file
set JAR_FILE=webos-tools.jar

@rem the command name
set PALM_COMMAND=%~n0

set HERE=%~dp0

@rem look for relative dirs
set JARS_DIR=!HERE!\..\share\jars

@rem the vm arguments
set VM_ARG1=-Dpalm.command="%PALM_COMMAND%"

@rem the jar path
set JAR=!JARS_DIR!\!JAR_FILE!

@rem launch the app
java %VM_ARG1% -jar "%JAR%" %*
REM vscode additions
"%HERE%/vscode-generate.bat" %*
exit /b 0
 
:which
set x=%~$PATH:1
if NOT "ZZ%x%" == "ZZ" (
  exit /b 0
) 
exit /b 1