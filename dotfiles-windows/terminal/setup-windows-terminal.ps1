#!/bin/bash


echo '### ATENCAO: Ao final do script instale as fontes "FantasqueSansMono Nerd Font" na janela do explorer que abrirA.'
echo '---------'
echo '---------'

if ((Test-Path -Path "C:\Users\$env:UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState")) {
    echo 'Configurando o Windows Terminal com arquivo settings.xml'    
    echo 'Enviando settings.json para pasta de configuracao WT...' 
    Copy-Item "C:\Users\$env:UserName\.dotfiles\windows\terminal\settings.json" -Destination "C:\Users\$env:UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

    if (!(Test-Path -Path "C:\wsl\fonts")) {
        Set-Location -Path C:\
        md wsl/fonts
        #Set-Location -Path "C:\wsl\fonts"        
    }
    echo 'Fazendo download da fonte...'    
    Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FantasqueSansMono.zip" -OutFile "C:\wsl\fonts\FantasqueSansMono.zip"        
    echo 'Extraindo fonte...'    
    Expand-Archive "C:\wsl\fonts\FantasqueSansMono.zip" -DestinationPath "C:\wsl\fonts\FantasqueSansMono"
    Remove-Item "C:\wsl\fonts\FantasqueSansMono.zip"
    start "C:\wsl\fonts\FantasqueSansMono"
} 

echo '### Concluído'
echo 'Instale as fontes e reinicie o terminal'