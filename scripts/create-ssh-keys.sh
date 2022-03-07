#!/bin/bash

SERVICE_NAME='github'

if [ -n "$1" ]; then 
    SERVICE_NAME=$1
fi


ssh-keygen -t id_vanbrandaos -C "vanbrandaos@gmail.com" -f "$HOME"/.ssh/"$USER"-"$SERVICE_NAME"_key

echo -e "KEY CREATED DO NOT FORGET TO UPLOAD THE PUBLIC PART!!!"
