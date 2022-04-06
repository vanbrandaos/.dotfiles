#!/bin/bash

paru -S --needed $(< aur.list tr "\n" " ")
#pacman -Syu --needed $(< aur-utils.list tr "\n" " ")