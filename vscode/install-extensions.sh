#!/bin/bash

for a in $(< code-extensions.list tr "\n" " ")
do
    echo "Installing extension $a..."
    code --install-extension "$a"
done
