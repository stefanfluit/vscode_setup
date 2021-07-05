### VScode setup script ###

* VScode install script that checks if VScode is installed, copies settings.json and installs extensions.
* Works only for MacOS.

### How do I get set up? ###

* fork the repo, edit the array and the settings.json file to match your setup.
* You can list your currently installed extensions with:
```code --list-extensions```

* After that, run the setup script:
```./setup.sh```
* It only installs packages when they are not present. You can run the script anytime, it should not generate errors. 
