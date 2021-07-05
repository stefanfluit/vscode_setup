#!/usr/bin/env bash

# Finding the directory we're in
declare DIR
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

which -s code
if [[ $? != 0 ]] ; then
    brew install --cask visual-studio-code
fi

which -s git
if [[ $? != 0 ]] ; then
    brew install git
fi

which -s ShellCheck
if [[ $? != 0 ]] ; then
    brew install shellcheck
fi

which -s zsh
if [[ $? != 0 ]] ; then
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone https://github.com/bhilburn/powerlevel9k.git "${HOME}/.oh-my-zsh/custom/themes/powerlevel9k"
    cp "${DIR}/config/.zshrc" "${HOME}/.zshrc" && sed -i "s/empty-user/$(whoami)/g" "${HOME}/.zshrc"
    chsh -s "$(which zsh)" "$(whoami)"
    # Install the fonts needed
    cd /tmp/ && git clone https://github.com/powerline/fonts.git && cd /tmp/fonts && ./install.sh
    defaults write com.googlecode.iterm2 "Normal Font" -string "Anonymous Pro for Powerline"
fi

if [[ ! -d /Applications/iTerm.app ]]; then
    brew cask install iterm2
fi

if ! [[ -x "$(command -v "xcode-select --version")" ]]; then
    printf "Xcode is installed.\n" 
else
    xcode-select --install
    osascript -e 'tell application "System Events"' -e 'tell process "Install Command Line Developer Tools"' -e 'keystroke return' -e 'click button "Agree" of window "License Agreement"' -e 'end tell' -e 'end tell'
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
    cd "${DIR}/config" && cp settings.json "${CODE_CONFIG_LOC}"
fi

printf "Done, please restart vscode.\n"