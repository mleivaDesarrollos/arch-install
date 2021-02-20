#!/bin/bash
./core-packages/basic-packages.sh
echo 'Instalando los paquetes de KDE'
pacstrap /mnt plasma-meta sddm latte-dock kcalc yakuake konsole kdeconnect gwenview okular spectacle kvantum-qt5 dolphin cmake extra-cmake-modules gcc
