#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

echo "Installing WSL applications from pacman..."

cd "${0%/*}"/../../packages

pacman -S --needed $(< pacman-wsl.list tr "\n" " ")

#vagrant plugin install vagrant-libvirt
vagrant plugin install virtualbox_WSL2

groupadd docker

usermod -aG docker "$USER"