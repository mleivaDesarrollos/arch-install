#!/bin/bash
# temp dir
mkdir ~/build

# Copying all oc vivobook controls
sudo cp ../custom-services/vivobook-cpu-tdp-adjust.service /etc/systemd/system
sudo cp ../helper-scripts/vivobook/low-tdp-ryzen /usr/bin
sudo chmod +x /usr/bin/low-tdp-ryzen

# Ryzenadj
cd ~/build
git clone https://aur.archlinux.org/ryzenadj-git && cd ryzenadj-git && makepkg -si --noconfirm

# enable oc services
sudo systemctl enable vivobook-cpu-tdp-adjust.service
sudo systemctl start vivobook-cpu-tdp-adjust.service

# clean temp dir
rm -rf ~/build

