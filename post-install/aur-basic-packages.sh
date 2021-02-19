#!/bin/bash
mkdir ~/build

# VSCODIUM AND MARKETPLACE
cd ~/build/
git clone https://aur.archlinux.org/vscodium-bin-marketplace && cd vscodium-bin-marketplace && makepkg -si --noconfirm
# Typora
cd ~/build/
git clone https://aur.archlinux.org/typora && cd typora && makepkg -si --noconfirm
# Pamac
cd ~/build/
git clone https://aur.archlinux.org/pamac-aur && cd pamac-aur && makepkg -si --noconfirm

# Clean dirs
rm -rf /home/build
