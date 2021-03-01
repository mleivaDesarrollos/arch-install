#!/bin/bash
echo 'Instalando paquetes de Wayland KDE'
pacstrap /mnt plasma-meta sddm latte-dock kcalc yakuake konsole kdeconnect gwenview okular spectacle kvantum-qt5 dolphin cmake extra-cmake-modules gcc qt5-wayland qt6-wayland plasma-session-wayland wayland xorg-wayland
