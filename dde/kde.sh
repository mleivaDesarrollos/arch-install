#!/bin/bash
echo 'Instalando los paquetes base de KDE'
pacstrap /mnt plasma-meta sddm kcalc yakuake konsole kdeconnect gwenview okular spectacle kvantum-qt5 dolphin cmake extra-cmake-modules gcc
