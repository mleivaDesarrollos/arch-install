#!/bin/bash
mkdir /home/build

# VSCODIUM AND MARKETPLACE
cd /home/build/
git clone https://aur.archlinux.org/vscodium-bin-marketplace && cd /home/build/vscodium-bin-marketplace && makepkg -si
# Typora
cd /home/build/
git clone https://aur.archlinux.org/typora && cd /home/build/typora && makepkg -si
# Pamac
cd /home/build/
git clone https://aur.archlinux.org/pamac-aur && cd /home/build/pamac-aur && makepkg -si

# Clean dirs
rm -rf /home/build
