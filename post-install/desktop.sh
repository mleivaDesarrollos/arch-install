#!/bin/bash
mkdir ~/.aur-packages

echo 'Copiamos el servicio que nos disponibilizara el RGB del motherboard'
sudo cp ./desktop/openrgb-enable-motherboard-ram /usr/bin
sudo cp ./desktop/openrgb-enable-motherboard.service /etc/systemd/system

echo 'Instalamos las herramientas de i2c para poder acceder al RGB';
sudo pacman -Sy --noconfirm i2c-tools

# OpenRGB
cd ~/.aur-packages
git clone https://aur.archlinux.org/openrgb && cd openrgb && makepkg -si --noconfirm

# Iniciamos el servicio para controlar el RGB del motherboard
sudo systemctl enable openrgb-enable-motherboard.service
sudo systemctl start openrgb-enable-motherboard.service

