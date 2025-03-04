#!/bin/bash

#list of cli_tools
cli_tools_list={
    git
    wget
    curl
    htop
    node
    tree
    zsh
    neofetch
    tmux
    vim
}

#list of cask applications
web_browser_list={
    google-chrome
    firefox
    tor-browser
    microsoft-edge
    opera
    brave-browser
    vivaldi
}

development_software_list={
    visual-studio-code
    iterm2
    postman
    docker
    github
    gitkraken
    sourcetree
    sublime-text
    atom
    brackets
    intellij-idea
    pycharm
    webstorm
    phpstorm
    clion
    goland
    rider
    datagrip
    android-studio
    visual-studio
    eclipse
}

creative_design_softwares={
    adobe-creative-cloud
    blender
    gimp
    inkscape
    krita
    davinci-resolve
}

productivity_softwares_list={
    microsoft-office
    microsoft-edxcel
    microsoft-word
    microsoft-powerpoint
    microsoft-onenote
    microsoft-outlook
    microsoft-onedrive
    microsoft-teams
    microsoft-skype
    microsoft-remote-desktop
    microsoft-to-do
    microsoft-365
    adobe-acrobat-reader
    adobe-acrobat-pro
    google-docs
    google-sheets
    google-slides
    google-drive
    dropbox
    evernote
    notion
    zettlr
    libreoffice
}

text_editors_list={
    visual-studio-code
    sublime-text
    atom
    zettlr
    notion
    onenote
    notepad-plus-plus
    evernote
}

#Determine the path of Homebrew
if [[ "$(uname -m)" == "arm64" ]]; then
    BREW_PATH="/opt/homebrew/bin"
else
    BREW_PATH="/usr/local/bin"
fi  

#function of the install cli_tools
install_cli_tools() {
    echo "Installing CLI tools..."
    for tool in ${cli_tools_list[@]}; do
        if ! command -v $tool &> /dev/null; then
            echo "Installing $tool..."
            brew install $tool
        else
            echo "$tool is already installed."
        fi
    done
    echo "CLI tools installation complete!"
}

#function of the install cask
install_cask() {
    echo "Installing Cask applications..."
    for app in "${cask_list[@]}"; do
        if brew list --cask "$app" &>/dev/null; then
            echo "$app is already installed."
        else
            echo "Installing $app..."
            brew install --cask "$app"
        fi
    done
    echo "Cask applications installation complete!"
}

#User commandd line interface after installation the homebrew and path setup
user_cli() {
    echo ""
    echo "1. Install CLI tools"
    echo "2. Install Web Browsers"
    echo "3. Install Development Software"
    echo "4. Install Creative Design Software"
    echo "5. Install Productivity Software"
    echo "6. Exit"
    read -p "Choose an option: " choice
}

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew, macOS package manager..."
    
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Ensure Homebrew is available immediately
    eval "$($BREW_PATH/brew shellenv)"

    # Update and upgrade Homebrew
    echo "Updating Homebrew..."
    brew update
    brew upgrade
    
    echo "Homebrew installation and path setup complete!"
else
    echo "Homebrew is already installed."
fi

#Add Homebrew to PATH in .zshrcc if not already present
ZSHRC="$HOME/.zshrc"
if ! grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' "$ZSHRC"; then
    echo "Adding Homebrew to PATH in .zshrc"
    echo "eval \"$($BREW_PATH/brew shellenv)\"" >> "$ZSHRC"
    echo "export PATH=\"$BREW_PATH:\$PATH\"" >> "$ZSHRC"
    source "$ZSHRC"
fi