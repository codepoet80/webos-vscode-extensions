@echo off
echo Updating and Re-installing VisualStudio Code Extensions for webOS
echo.
git reset --hard
git pull
call Install-Windows.cmd
echo.
echo Existing projects will need to be re-generated.
echo Alternatively, manually update tasks.json.