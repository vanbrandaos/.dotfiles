#!/bin/bash

echo "Copying keys..."

winpath=$(wslpath "$(wslvar USERPROFILE)")
#cp -r $winpath/.ssh "$HOME"/.ssh


if [ ! -f "$HOME"/.ssh/config ]; then
    touch "$HOME"/.ssh/config
fi

echo -e "Host github.com
HostName github.com
IdentityFile ~/.ssh/$winpath-github_key" >> "$HOME"/.ssh/config

echo "Check config file on ~/.ssh\n"
echo "Remember to chmod 600 each ssh key"