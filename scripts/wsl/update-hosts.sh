#!/bin/bash

result=$(cat "/mnt/c/Windows/System32/drivers/etc/hosts" | grep -iw "wsl.cepel.br" | wc -l | tr -d " ")

if [ "$result" != "0" ]
then
    content=$(cat "/mnt/c/Windows/System32/drivers/etc/hosts" | grep -viw "wsl.cepel.br")
    echo "$content" > "/mnt/c/Windows/System32/drivers/etc/hosts"
fi

ip=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
echo -e "$ip\t wsl.cepel.br" >> "/mnt/c/Windows/System32/drivers/etc/hosts"
echo "Atualizando arquivo de hosts com $ip wsl.cepel.br"
