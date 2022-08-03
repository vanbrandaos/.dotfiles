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
    mkdir -p ~/dev/soma
    cd ~/dev/soma
    git clone git@github.com:SOMA-App/soma-dev-kit.git
    cd soma-dev-kit/stow
    stow -vt ~ *
    cd ..
    scripts/setup-dev.sh "$C_USER"
fi