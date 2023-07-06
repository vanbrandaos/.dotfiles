#!/bin/bash

set -euo pipefail

crt_dir=$(pwd)

cleanup() {
   cd "$crt_dir" 
}

trap 'cleanup' EXIT

cd "${0%/*}"/..

COLOR='\033[0;32m'
CLR_ALERT='\033[0;35m'
NC='\033[0m' # No Color

if [ $# != 2 ]; then
    echo -e "Email and fullname must be declared. Copy and replace email-github and full-name from ./scripts/setup-custom-git-config.sh [email-github] [full-name]"
    exit
fi 

email="$1"
full_name="$2"

sed -i 's/vanbrandaos@gmail.com/'"$email"'/g' ~/.dotfiles/stow/git/.gitconfig
sed -i 's/Vanessa Brandao/'"$full_name"'/g' ~/.dotfiles/stow/git/.gitconfig