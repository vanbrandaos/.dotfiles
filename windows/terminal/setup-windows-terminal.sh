#!/bin/bash

echo 'Insira o nome do seu usuário Windows'
read WINDOWS_USER

echo "Procurando por /mnt/c/Users/'${WINDOWS_USER}'/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"

if [ -d /mnt/c/Users/"$WINDOWS_USER"/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState ];
then
echo 'Configurando o Windows Terminal com arquivo settings.xml e integrando Fish e Starship'
else
echo "O diretório não é válido. Saindo..."
exit
fi

sudo cp settings.json /mnt/c/Users/"$WINDOWS_USER"/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState

cd /tmp
git clone https://aur.archlinux.org/nerd-fonts-fantasque-sans-mono.git
cd nerd-fonts-fantasque-sans-mono
makepkg -si

cd /tmp
wget https://github.com/belluzj/fantasque-sans/releases/download/v1.8.0/FantasqueSansMono-Normal.zip
mkdir -p fonts/fantasqueSansMono-Normal
sudo unzip FantasqueSansMono-Normal.zip -d /tmp/fonts/fantasqueSansMono-Normal
cd fonts/fantasqueSansMono-Normal/TTF
cd /tmp
rm -rf FantasqueSansMono-Normal.zip

cd /tmp 
git clone https://github.com/agura-lex/find-the-command.git
cd find-the-command
yay -S find-the-command
#makepkg -si

cd /tmp
rm -rf nerd-fonts-fantasque-sans-mono
rm -rf find-the-command

chsh -s /usr/bin/fish

echo '### ATENÇÃO: COPIE AS FONTES EM /tmp/fonts (sempre pasta TTF) para o windows, deixando em C:\Windows\Fonts'
echo '### Concluído'
echo 'Reinicie o WSL'



