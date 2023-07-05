#!/bin/bash

echo "Installing yay..."

cd /tmp

sudo rm -rf yay/

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#yay -S spotify
#yay -S wps-office

