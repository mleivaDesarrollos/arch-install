#!/bin/bash
mkdir /home/build
chgrp nobody /home/build
chmod g+ws /home/build
setfacl -m u::rwx,g::rwx /home/build
setfacl -d --set u::rwx,g::rwx,o::- /home/build

# VSCODIUM
cd /home/build/
git clone https://aur.archlinux.org/vscodium-bin && chmod -R g+w /home/build/vscodium-bin && cd /home/build/vscodium-bin && sudo -u nobody makepkg
# VSCODIUM MARKETPLACE
cd /home/build/
git clone https://aur.archlinux.org/vscodium-bin-marketplace && chmod -R g+w /home/build/vscodium-bin-marketplace && cd /home/build/vscodium-bin-marketplace && sudo -u nobody makepkg
# Typora
cd /home/build/
git clone https://aur.archlinux.org/typora && chmod -R g+w /home/build/typora && cd /home/build/typora && sudo -u nobody makepkg
# Pamac
cd /home/build/
git clone https://aur.archlinux.org/pamac-aur && chmod -R g+w /home/build/pamac-aur && cd /home/build/pamac-aur && sudo -u nobody makepkg
