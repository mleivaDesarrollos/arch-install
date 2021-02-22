#!/bin/bash
# temp dir
mkdir ~/.aur-packages

# Copying all oc vivobook controls
sudo cp ../addons/vivobook/tdp-config.service /etc/systemd/system
sudo cp ../addons/vivobook/low-tdp-ryzen /usr/bin

# Ryzenadj
cd ~/.aur-packages
git clone https://aur.archlinux.org/ryzenadj-git && cd ryzenadj-git && makepkg -si --noconfirm

# enable oc services
echo 'Activando los servicios de TDP adjust de la vivobook'
sudo systemctl enable tdp-config.service
sudo systemctl start tdp-config.service

