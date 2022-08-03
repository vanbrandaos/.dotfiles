#!/bin/bash

# Downloading widgets for kde plasma

cd ~/.local/share/plasma/plasmoids/

git clone https://github.com/paju1986/PlasmaConfSaver.git 
mv PlasmaConfSaver/com.pajuelo.plasmaConfSaver ./com.pajuelo.plasmaConfSaver && rm -rf PlasmaConfSaver

git clone https://github.com/nihilist-dev/NowPlaying.git
mv NowPlaying/plasmoid ./org.kde.NowPlaying && rm -rf NowPlaying

git clone https://github.com/psifidotos/applet-latte-separator.git org.kde.latte.separator

