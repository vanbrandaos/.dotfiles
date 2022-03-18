#!/bin/bash

pacman -Syu --needed $(< aur-utils.list tr "\n" " ")