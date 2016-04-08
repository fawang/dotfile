#!/bin/bash

# Need to figure out how to detect figlet command exists on system
which figlet
if [[ $? != 0 ]]; then
    figlet "Starting ..."
else
    echo "===================================="
    echo "  Starting install dotfiles...      "
    echo "===================================="
fi

if [ "$(uname)" == "Darwin" ]; then
    say "Installing brew"
    which -s brew
    if [[ $? != 0 ]] ; then
        # Install Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        brew update
    fi
fi

echo "===================================="
echo "  Initializing submodules...         "
echo "===================================="
git submodule update --init --recursive

# Install brew on osx
if [ "$(uname)" == "Darwin" ]; then
    say "Running on OSX"
    echo "===================================="
    echo "  Brew install components...        "
    echo "===================================="
    
    source ~/.dotfiles/install/brew.sh
fi

# Install vim plugins
echo "===================================="
echo "  Starting vim setup ..."
echo "===================================="
source ~/.dotfiles/install/vim.sh

# Install oh-my-zsh
echo "Starting oh-my-zsh setup ..."
source  ~/.dotfiles/install/oh-my-zsh.sh
