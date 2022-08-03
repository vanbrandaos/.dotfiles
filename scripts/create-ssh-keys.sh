#!/bin/bash

set -euo pipefail

CRT_DIR=$(pwd)

cleanup() {
   cd "$CRT_DIR" 
}

trap 'cleanup' EXIT

SERVICE_NAME=${1-github}
DOMAIN=".com"

echo "Creating keys..."

ssh-keygen -t ed25519 -C "vanbrandaos@gmail.com" -f "$HOME"/.ssh/"$USER"-"$SERVICE_NAME"_key

if [ ! -f "$HOME"/.ssh/config ]; then
    touch "$HOME"/.ssh/config
fi

if [[ $SERVICE_NAME = "bitbucket" ]]; then
  DOMAIN=".org"
fi 

echo -e "Host "$SERVICE_NAME""$DOMAIN"
HostName "$SERVICE_NAME""$DOMAIN"
IdentityFile ~/.ssh/"$USER"-"$SERVICE_NAME"_key" >> "$HOME"/.ssh/config

echo "Check config file on ~/.ssh\n"
echo -e "KEY CREATED DO NOT FORGET TO UPLOAD THE PUBLIC PART!!!"