#!/bin/bash
#Check for sufficient privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run with Elevated Privileges"
  read -rsp $'Press any key to continue . . .\n' -n1 key
  exit
fi
echo
echo Updating and Re-installing VisualStudio Code Extensions for webOS
echo
git reset --hard
git pull
./Install-OSX.sh silent
echo
echo Existing projects may need to be re-generated.
echo Alternatively, manually update scripts and tasks.json using this folder.
read -rsp $'Press any key to continue . . .\n' -n1 key