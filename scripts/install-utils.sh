#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

echo "Installing applications from pacman..."

cd "${0%/*}"/../packages

pacman -Sy --needed $(< pacman-utils.list tr "\n" " ")