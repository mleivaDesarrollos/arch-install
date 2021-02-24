#!/bin/bash
# Ejecutamos los paquetes basicos
./basic-packages.sh

# Copying all oc vivobook controls
sudo cp ./vivobook/tdp-config.service /etc/systemd/system
sudo cp ./vivobook/low-tdp-ryzen /usr/bin

# Ryzenadj
cd ~/.aur-packages
git clone https://aur.archlinux.org/ryzenadj-git && cd ryzenadj-git && makepkg -si --noconfirm

# enable oc services
sudo systemctl enable tdp-config.service
sudo systemctl start tdp-config.service

