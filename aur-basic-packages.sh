#!/bin/bash
mkdir /home/build
chgrp nobody /home/build
chmod g+ws /home/build
setfacl -m u::rwx,g::rwx /home/build
setfacl -d --set u::rwx,g::rwx,o::- /home/build

# VSCODIUM
cd /home/build/
git clone https://aur.archlinux.org/vscodium-bin && chmod -R g+w /home/build/vscodium-bin && cd /home/build/vscodium-bin && sudo -u nobody makepkg
