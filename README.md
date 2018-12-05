# webos-vscode-extensions
VisualStudio Code IDE Extensions

This is a work-in-progress to patch the Palm/HP webOS SDK to include some helpful features for developing with VisualStudio Code, like building, and running (with debug output!) right from the IDE.

Assumes the webOS SDK is already installed.
Run ./Install-OSX.sh on Mac, or Install-Windows.cmd on Windows, then use palm-generate as usual to make a VSCode-ready project.
This will add some Terminal tasks to VSCode to Run and Build your webOS app from the IDE's "Terminal" menu. When you run, you'll get log messages from your app in the IDE's debug window.

<img src="https://raw.githubusercontent.com/codepoet80/webos-vscode-extensions/master/screenshots/WebOS-VSCode-Mac.png" width="512">
