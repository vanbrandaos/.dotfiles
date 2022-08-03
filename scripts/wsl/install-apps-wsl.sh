#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

echo "Installing WSL applications from pacman..."

cd "${0%/*}"/../../packages

pacman -Syu --needed $(< pacman-wsl.list tr "\n" " ")

groupadd docker

usermod -aG docker "$USER"
usermod -aG libvirt "$USER"