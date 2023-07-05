#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

read -n1 -s -r -p $'Are you vanbrandaos?\nPress ENTER to confirm or CTRL+C to cancel.\n' key

cd "${0%/*}"/..

git remote set-url origin git@github.com:vanbrandaos/.dotfiles.git