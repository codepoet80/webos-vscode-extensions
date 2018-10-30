@echo off
REM Check for sufficient privileges
net session > nul 2>&1
if not %ERRORLEVEL% equ 0 (	echo Please run with Elevated Privileges
     pause
     exit /b 1
)
cd "%~dp0"
echo.
echo Updating and Re-installing VisualStudio Code Extensions for webOS
echo.
git reset --hard
git pull
call Install-Windows.cmd silent

echo Existing projects will need to be re-generated.
echo Alternatively, manually update tasks.json.
pause