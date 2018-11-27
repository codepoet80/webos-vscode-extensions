#!/bin/bash
#Check for sufficient privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run with Elevated Privileges"
  read -rsp $'Press any key to continue . . .\n' -n1 key
  exit
fi
echo
echo Patching Palm webOS SDK to add VisualStudio Code extensions . . .
PALM_SCRIPTS=/opt/PalmSDK/0.1
if [ ! -d "$PALM_SCRIPTS/vscode" ]; then
    mkdir "$PALM_SCRIPTS/vscode"
fi
if [ ! -d "$PALM_SCRIPTS/vscode/_scripts" ]; then 
    mkdir "$PALM_SCRIPTS/vscode/_scripts"
fi
yes | cp ./vscode-*.sh $PALM_SCRIPTS/bin/
yes | cp ./_scripts/* $PALM_SCRIPTS/vscode/_scripts
yes | cp ./tasks.json $PALM_SCRIPTS/vscode/tasks.json
#Tell OS to make scripts executable
chmod +x $PALM_SCRIPTS/vscode/_scripts/*.sh

# On Unix we can just append a new line to Palm's generate script
# But let's make sure we don't do that repeatedly
if grep -R "# vscode additions" "$PALM_SCRIPTS/bin/palm-generate" > /dev/null
then
   echo Done! Existing Install Updated
else
   cat "./palm-generate-additions.sh" >> "$PALM_SCRIPTS/bin/palm-generate"
   echo Done! Install Completed
fi

echo
echo To create a VSCode-ready webOS app use:
echo palm-generate -t new_app \~/Projects/YourNewApp
echo
if [ "$1" != "silent" ]; then
     read -rsp $'Press any key to continue . . .\n' -n1 key
fi