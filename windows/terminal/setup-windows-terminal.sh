#!/bin/bash


echo '### ATENÇÃO: Ao final do script instale a fonte "FantasqueSansMono Nerd Font" na janela do explorer que abrirá.'
echo '### Opcionalmente instale todas as fontes. Caminho Windows: C:wsl/fonts/fantasqueSansMono'
echo '## Para a instalação do find-the-command, escolha a versão git'
echo '---------'
echo '---------'
echo '---------'
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
#ln -s ~/.dotfiles/windows/terminal/settings.json /mnt/c/Users/"$WINDOWS_USER"/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json

cd /tmp 
git clone https://github.com/agura-lex/find-the-command.git
cd find-the-command
yay -S find-the-command
#makepkg -si

cd /tmp
rm -rf find-the-command

chsh -s /usr/bin/fish

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FantasqueSansMono.zip
mkdir -p fonts/fantasqueSansMono
sudo unzip FantasqueSansMono.zip -d /tmp/fonts/fantasqueSansMono
cd /tmp
rm -rf FantasqueSansMono.zip
mkdir -p /mnt/c/wsl
mv fonts /mnt/c/wsl
cd /mnt/c/wsl/fonts/fantasqueSansMono
powershell.exe /c start .
cd ~/.dotfiles/windows/terminal

echo '### Concluído'
echo 'Instale as fontes e reinicie o WSL'