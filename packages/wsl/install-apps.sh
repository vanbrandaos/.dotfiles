#!/bin/bash

pacman -Syu --needed $(< wsl-pkg.list tr "\n" " ")

groupadd docker

usermod -aG docker "$USER"