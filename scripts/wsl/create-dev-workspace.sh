#!/bin/bash

set -eo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

C_USER="$1"

read -n1 -s -r -p $'At this point your GitHub access should be configured!\nPress ENTER to continue...\n' key

if [ "$key" = '' ]; then
    mkdir -p ~/dev
    cd ~/dev/
    git clone git@github.com:SOMA-App/dev-kit.git
    
    #cd dev-kit/stow
    #stow -vt ~ *
    mkdir -p ~/.config/fish
    ln -s ~/dev/dev-kit/stow/fish/.config/fish/extra_configs.fish ~/.config/fish/extra_configs.fish
    ln -s ~/dev/dev-kit/stow/postgres/dev/postgres/ ~/dev/postgres

    cd ~/dev/dev-kit/scripts/
    grep -v "chattr" setup-dev.sh > setup-dev-wsl.sh
    sudo chmod u+x setup-dev-wsl.sh
    
    cd ..        
    scripts/setup-dev-wsl.sh "$C_USER"
    #rm -rf setup-dev-wsl.sh
fi