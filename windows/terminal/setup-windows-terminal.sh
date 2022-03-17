#!/bin/bash

echo 'Insira o nome do seu usuário Windows'
read windows_user

echo 'Procurando por /mnt/c/Users/'${windows_user}'/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState'

if [ -d /mnt/c/Users/$WINDOWS_USER/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState ];
then
echo 'Configurando o Windows Terminal com arquivo settings.xml e integrando Fish e Starship'
else
echo "O diretório não é válido. Saindo..."
exit
fi


sudo cp settings.xml /mnt/c/Users/$WINDOWS_USER/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState

cd /tmp
git clone https://aur.archlinux.org/nerd-fonts-fantasque-sans-mono.git
cd nerd-fonts-fantasque-sans-mono
makepkg -si

cd /tmp 
git clone https://github.com/agura-lex/find-the-command.git
cd find-the-command
makepkg -si

cd /tmp
rm -rf nerd-fonts-fantasque-sans-mono
rm -rf find-the-command

chsh -s /usr/bin/fish

echo '### Concluído'
echo 'Reinicie o WSL'



