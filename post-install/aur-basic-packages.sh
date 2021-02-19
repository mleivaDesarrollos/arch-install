#!/bin/bash
mkdir /home/build

# VSCODIUM AND MARKETPLACE
cd /home/build/
git clone https://aur.archlinux.org/vscodium-bin-marketplace && cd /home/build/vscodium-bin-marketplace && makepkg -si --noconfirm
# Typora
cd /home/build/
git clone https://aur.archlinux.org/typora && cd /home/build/typora && makepkg -si --noconfirm
# Pamac
cd /home/build/
git clone https://aur.archlinux.org/pamac-aur && cd /home/build/pamac-aur && makepkg -si --noconfirm

# Clean dirs
rm -rf /home/build
