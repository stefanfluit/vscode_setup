### VScode setup script ###

* VScode install script that checks if VScode is installed, copies settings.json and installs extensions.
* Now also installs and configures ZSH, oh-my-zsh, Powerlevel9k, fonts, xcode, etc..

### How do I get set up? ###

* fork the repo, edit the array and the settings.json file to match your setup.
* You can list your currently installed extensions with:
```code --list-extensions```

* After that, run the setup script:
```./setup.sh```