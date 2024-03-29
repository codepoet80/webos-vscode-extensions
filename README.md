# VisualStudio Code Extensions for webOS

This is a work-in-progress to patch the Palm/HP webOS SDK to include some helpful features for developing with VisualStudio Code, like building, and running (with debug output!) right from the IDE.

Assumes the webOS SDK is already installed -- if you need help with that, check out: <a href="http://sdk.webosarchive.org">http://sdk.webosarchive.org</a>. 

Run `./Install-OSX.sh` on Mac, or `Install-Windows.cmd` on Windows with Admin privileges, then use `palm-generate` as usual to make a VSCode-ready project.

This will add some Terminal tasks to VSCode to Run and Build your webOS app from the IDE's "Terminal" menu. When you run, you'll get log messages from your app in the IDE's debug window.

<img src="https://raw.githubusercontent.com/codepoet80/webos-vscode-extensions/main/screenshots/WebOS-VSCode-Mac.png" width="512">

<img src="https://raw.githubusercontent.com/codepoet80/webos-vscode-extensions/main/screenshots/WebOS-VSCode-Windows.png" width="512">
