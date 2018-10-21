echo Updating and Re-installing VisualStudio Code Extensions for webOS
echo
git reset --hard
git pull
./Install-OSX.sh
echo
echo Existing projects may need to be re-generated.
echo Alternatively, manually update scripts and tasks.json using this folder.