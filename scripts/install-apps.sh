#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

echo "Installing applications from pacman..."

cd "${0%/*}"/../packages

pacman -Sy --needed $(< pacman.list tr "\n" " ")

flatpak install flathub $(< flathub.list tr "\n" " ")

getent group docker || groupadd docker

usermod -aG docker "$USER"
usermod -aG libvirt "$USER"

echo "127.0.0.1 desktop.cepel.br" >> /etc/hosts
echo "127.0.0.1 $HOSTNAME.cepel.br" >> /etc/hosts