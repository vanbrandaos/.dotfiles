#!/bin/bash

winpath=$(wslpath "$(wslvar USERPROFILE)")

cp -r $winpath/.ssh ~
echo "Remember to chmod 600 each ssh key"