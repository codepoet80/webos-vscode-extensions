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