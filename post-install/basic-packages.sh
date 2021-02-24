#!/bin/bash
mkdir ~/.aur-packages

# Copying config files of nvim
mkdir ~/.config/nvim
cp ./nvim_config/* ~/.config/nvim

# VSCODIUM AND MARKETPLACE
cd ~/.aur-packages/
git clone https://aur.archlinux.org/vscodium-bin && cd vscodium-bin && makepkg -si --noconfirm

cd ~/.aur-packages/
git clone https://aur.archlinux.org/vscodium-bin-marketplace && cd vscodium-bin-marketplace && makepkg -si --noconfirm

# Postman
cd ~/.aur-packages
git clone https://aur.archlinux.org/postman-bin && cd postman-bin && makepkg -si --noconfirm

# Typora
cd ~/.aur-packages/
git clone https://aur.archlinux.org/typora && cd typora && makepkg -si --noconfirm

# Pamac
cd ~/.aur-packages/
git clone https://aur.archlinux.org/pamac-aur && cd pamac-aur && makepkg -si --noconfirm

# Oh-my-zsh
cd ~/.aur-packages/
git clone https://aur.archlinux.org/oh-my-zsh-git && cd oh-my-zsh-git && makepkg -si --noconfirm
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc

# Timeshift
cd ~/.aur-packages/
git clone https://aur.archlinux.org/timeshift && cd timeshift && makepkg -si --noconfirm

# FreeFileSync
cd ~/.aur-packages
git clone https://aur.archlinux.org/freefilesync-bin && cd freefilesync-bin && makepkg -si --noconfirm

# Slack Desktop
cd ~/.aur-packages
git clone https://aur.archlinux.org/slack-desktop && cd slack-desktop && makepkg -si --noconfirm

# Mariadb install
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Git config
git config --global user.name 'Maximiliano Leiva'
git config --global core.editor nvim

# Instalacion de claves SSH
echo 'Creacion de claves - no usar passphrase y dejar rutas por defecto'
ssh-keygen
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

# Instalacion de plugins de VIM
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
