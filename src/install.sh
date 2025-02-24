#!/bin/bash

#list of cli_tools
cli_tools_list={

}

#list of cask
cask_list={

}

#function of the install cli_tools
install_cli_tools() {

}

#function of the install cask
install_cask() {

}

user_cli() {
    echo ""
    echo ""
    echo ""
    echo ""
    read
}

# Check if Homebrew is either installed or not
if ! command -v brew &> /dev/null; then
    #print
    echo
    echo
    # Install Homebrew
    sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    #update and upgrade brew
    sudo brew update
    sudo brew updgrade

else
    echo "Homebrew is already installed."
fi
