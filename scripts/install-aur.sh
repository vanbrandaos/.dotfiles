#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

cd "${0%/*}"/../packages

echo "Installing applications from AUR..."

if (( EUID == 0 )); then
   echo "AUR should not be accessed with root privileges!" 1>&2
   exit 100
fi

paru -Sy --needed $(< aur.list tr "\n" " ")

echo "Download the SNX install script from the upstream!"

xdg-open 'https://aur.archlinux.org/packages/snx'

read -n1 -s -r -p $'Press ANY key to continue...\n' key

mkdir -p ~/.cache/paru/clone/snx/

set +e

paru -S --needed snx

set -e

cp ~/Downloads/snx_install_linux30.sh ~/.cache/paru/clone/snx/

paru -S --needed snx