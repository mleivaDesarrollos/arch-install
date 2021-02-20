#!/bin/bash
# temp dir
mkdir ~/build

# Ryzenadj
cd ~/build
git clone https://aur.archlinux.org/ryzenadj-git && cd ryzenadj-git && makepkg -si --noconfirm

# clean temp dir
rm -rf ~/build

