#!/bin/bash

pacman -Syu --needed $(< pkg.list tr "\n" " ")

pacman -Syu --needed $(< util.list tr "\n" " ")

#verificar seria necessario incluir flatpak na lista do pacman pkg.list e remover o teams da aur
#flatpak install flathub com.microsoft.Teams 

groupadd docker

usermod -aG docker "$USER"

echo "127.0.0.1 desktop.cepel.br" >> /etc/hosts
echo "127.0.0.1 $HOSTNAME.cepel.br" >> /etc/hosts

#add 

# echo "listen_addresses = '*'" >> /var/lib/posgres/data/postgres.conf
# echo "host all all 172.17. 0.0/16 trust" >> /var/lib/postgres/data/pg_hba.conf
