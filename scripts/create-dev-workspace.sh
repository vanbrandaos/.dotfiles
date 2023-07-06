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

    if [ -d ~/dev/dev-kit ]; then 
        echo "dev-kit is already here. Continuing..."        
    else    
        git clone git@github.com:SOMA-App/dev-kit.git
    fi
    
    #cd dev-kit/stow
    #sudo stow -vt ~ *
    #mkdir -p ~/.config/fish
    #ln -s ~/dev/dev-kit/stow/fish/.config/fish/extra_configs.fish ~/.config/fish/extra_configs.fish
    #ln -s ~/dev/dev-kit/stow/postgres/dev/postgres/ ~/dev/postgres

    #cd dev-kit/
    #scripts/setup-dev.sh "$C_USER"
fi