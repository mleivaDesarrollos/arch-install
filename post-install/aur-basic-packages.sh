#!/bin/bash
mkdir ~/build

# VSCODIUM AND MARKETPLACE
cd ~/build/
git clone https://aur.archlinux.org/vscodium-bin && cd vscodium-bin && makepkg -si --noconfirm

cd ~/build/
git clone https://aur.archlinux.org/vscodium-bin-marketplace && cd vscodium-bin-marketplace && makepkg -si --noconfirm

# Postman
cd ~/build
git clone https://aur.archlinux.org/postman-bin && cd postman-bin && makepkg -si --noconfirm

# Typora
cd ~/build/
git clone https://aur.archlinux.org/typora && cd typora && makepkg -si --noconfirm

# Pamac
cd ~/build/
git clone https://aur.archlinux.org/pamac-aur && cd pamac-aur && makepkg -si --noconfirm

# Oh-my-zsh
cd ~/build/
git clone https://aur.archlinux.org/oh-my-zsh-git && cd oh-my-zsh-git && makepkg -si --noconfirm
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc

# Timeshift
cd ~/build/
git clone https://aur.archlinux.org/timeshift && cd timeshift && makepkg -si --noconfirm

# FreeFileSync
cd ~/build
git clone https://aur.archlinux.org/freefilesync-bin && cd freefilesync-bin && makepkg -si --noconfirm

# Slack Desktop
cd ~/build
git clone https://aur.archlinux.org/slack-desktop && cd slack-desktop && makepkg -si --noconfirm

# Mariadb install
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Clean dirs
rm -rf ~/build
