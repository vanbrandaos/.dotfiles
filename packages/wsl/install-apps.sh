#!bin/bash

pacman -Syu --needed $(<pkg.list tr "\n" " ")
