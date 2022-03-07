#!/bin/bash

# Downloading widgets for kde plasma

cd ~/.local/share/plasma/plasmoids/

git clone https://github.com/paju1986/PlasmaConfSaver.git 
mv PlasmaConfSaver/com.pajuelo.plasmaConfSaver ./com.pajuelo.plasmaConfSaver && rm -rf PlasmaConfSaver

git clone https://github.com/nihilist-dev/NowPlaying.git
mv NowPlaying/plasmoid ./org.kde.NowPlaying && rm -rf NowPlaying

git clone https://github.com/psifidotos/applet-latte-separator.git org.kde.latte.separator

#git clone https://gitlab.com/aleixq/apptitle-plasmoid.git 
#mv apptitle-plasmoid/org.communia.apptitle ./org.communia.apptitle && rm -rf apptitle-plasmoid

#git clone https://github.com/quank123wip/AlbumArt.git com.github.quank123wip.albumart
#git clone https://github.com/Zren/plasma-applet-simpleweather.git com.github.zren.simpleweather

#git clone https://github.com/psifidotos/applet-latte-sidebar-button.git org.kde.latte.sidebarbutton
#git clone https://github.com/psifidotos/applet-latte-spacer.git org.kde.latte.spacer

