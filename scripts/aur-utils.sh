#!/bin/bash

#mkdir -p ~/yay

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


