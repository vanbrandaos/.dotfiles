#/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

mkdir -p ~/.ssh

mkdir -p ~/.config/kitty

mkdir -p ~/.config/"Code - OSS"/User

mkdir -p ~/.config/conky

mkdir -p ~/.local/share/applications/

if [ -f ~/.config/starship.toml ]; then
   rm ~/.config/starship.toml
fi

if [ -f ~/.config/fish/config.fish ]; then
   rm ~/.config/fish/config.fish
fi
