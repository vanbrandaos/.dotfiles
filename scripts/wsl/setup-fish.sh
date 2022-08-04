echo '## Para a instalação do find-the-command, escolha a versão git'

cd /tmp 
git clone https://github.com/agura-lex/find-the-command.git
cd find-the-command
yay -S find-the-command
#makepkg -si

cd /tmp
sudo rm -rf find-the-command

chsh -s /usr/bin/fish