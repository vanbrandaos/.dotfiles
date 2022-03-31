#!/bin/bash


echo '### ATENÇÃO: Ao final do script instale a fonte "FantasqueSansMono Nerd Font" na janela do explorer que abrirá.'
echo '### Opcionalmente instale todas as fontes. Caminho Windows: C:wsl/fonts/fantasqueSansMono'

echo '---------'
echo '---------'
echo '---------'
echo 'Insira o nome do seu usuário Windows'
read WINDOWS_USER

echo "Procurando por /c/Users/'${WINDOWS_USER}'/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"

if [ -d /c/Users/"$WINDOWS_USER"/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState ];
then
echo 'Configurando o Windows Terminal com arquivo settings.xml'
else
echo "O diretório não é válido. Saindo..."
exit
fi

#sudo cp settings.json /mnt/c/Users/"$WINDOWS_USER"/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState
#ln -s ~/.dotfiles/windows/terminal/settings.json /mnt/c/Users/"$WINDOWS_USER"/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json

mkdir /c/wsl/fonts

cd /c/wsl/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FantasqueSansMono.zip
mkdir -p fonts/fantasqueSansMono
unzip FantasqueSansMono.zip -d /c/wsl/fonts/fantasqueSansMono
cd /c/wsl/fonts
rm -rf FantasqueSansMono.zip
cd /c/wsl/fonts/fantasqueSansMono
powershell.exe /c start .
cd ~/.dotfiles/windows/terminal

echo '### Concluído'
echo 'Instale as fontes e reinicie o terminal'