#!/bin/bash

#list of cli_tools
cli_tools_list={
    git
    wget
    curl
    htop
    node
}

#list of cask
cask_list={
    visual-studio-code
    iterm2
    slack
    postman
    docker
    vlc
    spotify
    discord
    zoom
    microsoft-teams
    whatsapp
    telegram
}

web_browser_list={
    google-chrome
    firefox
    tor-browser
    microsoft-edge

}
development_tools_list={
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
    netbeans
    eclipse
    codeblocks

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
    echo ""
    echo ""
    echo ""
    read ""
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