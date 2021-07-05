### VScode setup script ###

* VScode install script that checks if VScode is installed, copies settings.json and installs extensions.
* Now also installs and configures ZSH, oh-my-zsh, Powerlevel9k, fonts, xcode, etc..
* Works only for MacOS.

### How do I get set up? ###

* fork the repo, edit the array and the settings.json file to match your setup.
* You can list your currently installed extensions with:
```code --list-extensions```
* To copy your current settings from VScode: 
```cd vscode_setup/config && cp "${HOME}/Library/Application Support/Code/User/settings.json" settings.json```

* After that, run the setup script:
```./setup.sh```
* It only installs packages when they are not present. You can run the script anytime, it should not generate errors. 
* This script also tries to make ZSH your default shell. Disable that in the script if you don't like it, or copy your own config if you have one. Don't forget to disable the sed command in the script in the ZSH function.