#!/bin/bash

for a in $(< code-java-extensions.list tr "\n" " ")
do
    echo "Installing extension $a..."
    code --install-extension "$a"
done
