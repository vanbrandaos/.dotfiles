#!/bin/bash

if (( EUID == 0 )); then
   echo "AUR should not be accessed with root privileges!" 1>&2
   exit 100
fi

paru -S --needed $(< aur.list tr "\n" " ")
