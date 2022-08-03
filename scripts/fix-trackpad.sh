#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

cd "${0%/*}"

echo "Use this script if you have a multi-touch touchpad and are unable to use two/three finger touch!"
echo "It will only work on X11!!"

read -n1 -s -r -p $'Press ENTER to continue...\n' key

if [ "$key" = '' ]; then
    pacman -S --needed xf86-input-synaptics
else
    echo "Exiting!!!"
fi