#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

REMOTE_URL=${1-'git@github.com:vanbrandaos/.dotfiles.git'}
CONFIRM_CHANGES=false


if [ $# = 0 ]; then
   read -n1 -s -r -p $'Are you vanbrandaos?\nPress ENTER to confirm.\n' key       
   if [ "$key" = '' ]; then
      CONFIRM_CHANGES=true
   fi
else 
   REMOTE_URL="$1"
   CONFIRM_CHANGES=true
fi

cd "${0%/*}"/..

if [ $CONFIRM_CHANGES = true ]; then   
   git remote set-url origin "$REMOTE_URL"
fi