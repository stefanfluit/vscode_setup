#!/usr/bin/env bash

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

which -s code
if [[ $? != 0 ]] ; then
    # Install Code
    brew install --cask visual-studio-code
fi

which -s ShellCheck
if [[ $? != 0 ]] ; then
    # Install ShellCheck
    brew install shellcheck
fi

declare -a extensions=(
    "4ops.terraform"
    "BernardXiong.env-vscode"
    "bmalehorn.shell-syntax"
    "coolbear.systemd-unit-file"
    "donjayamanne.githistory"
    "equinusocio.vsc-material-theme-icons"
    "fisheva.eva-theme"
    "hashicorp.terraform"
    "HookyQR.beautify"
    "jpruliere.env-autocomplete"
    "mads-hartmann.bash-ide-vscode"
    "ms-azuretools.vscode-docker"
    "Nixon.env-cmd-file-syntax"
    "redhat.vscode-yaml"
    "rogalmic.bash-debug"
    "rpinski.shebang-snippets"
    "samuelcolvin.jinjahtml"
    "TGBS.TGBS"
    "timonwong.shellcheck"
)

for extension in "${extensions[@]}"; do
    declare extension_status
    extension_status=$(code --list-extensions | grep "${extension}")
    if [[ "${extension_status}" == "${extension}" ]]; then
        printf "VsCode extension %s is installed.\n" "${extension}"
    else
        code --install-extension "${extension}"
    fi
done

declare CODE_CONFIG_LOC="${HOME}/Library/Application Support/Code/User/settings.json"

if [ ! -f "${CODE_CONFIG_LOC}" ]; then
    cp settings.json "${CODE_CONFIG_LOC}"
fi

printf "Done, please restart vscode.\n"