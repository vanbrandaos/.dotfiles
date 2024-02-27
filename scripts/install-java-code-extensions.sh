#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

cd "${0%/*}"/../vscode

for a in $(< java-extensions.list tr "\n" " ")
do
    echo "Installing extension $a..."
    code --install-extension "$a"
done
