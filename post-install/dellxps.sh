#!/bin/bash
./basic-packages.sh
./workenvs/autofi.sh

# Chrome shell - for installing gnome extensions
cd ~/.aur-packages/
git clone https://aur.archlinux.org/chrome-gnome-shell && cd chrome-gnome-shell && makepkg -si --noconfirm

# TLP-UI - GIT
cd ~/.aur-packages/
git clone https://aur.archlinux.org/tlpui-git && cd tlpui-git && makepkg -si --noconfirm
