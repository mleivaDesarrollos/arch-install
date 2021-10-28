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

# Oh-my-zsh
cd ~/.aur-packages/
git clone https://aur.archlinux.org/oh-my-zsh-git && cd oh-my-zsh-git && makepkg -si --noconfirm
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc

# FreeFileSync
cd ~/.aur-packages
git clone https://aur.archlinux.org/freefilesync-bin && cd freefilesync-bin && makepkg -si --noconfirm

# Slack Desktop
cd ~/.aur-packages
git clone https://aur.archlinux.org/slack-desktop && cd slack-desktop && makepkg -si --noconfirm

# Google Chrome
cd ~/.aur-packages
git clone https://aur.archlinux.org/google-chrome && cd google-chrome && makepkg -si --noconfirm

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -
cd ~/.aur-packages
git clone https://aur.archlinux.org/spotify && cd spotify && makepkg -si --noconfirm

# Git config
git config --global user.name 'Maximiliano Leiva'
git config --global core.editor nvim
git config --global push.default current

# Instalacion de Powerlevel 10k
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ./zsh_config/.zshrc ~/
cp ./zsh_config/.p10k.zsh ~/
echo 'PowerLevel 10k Instalado, recordar instalar y configurar las fuentes Meslo para optimo uso'

# Instalacion de claves SSH
echo 'Creacion de claves - no usar passphrase y dejar rutas por defecto'
ssh-keygen
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

# Instalacion de plugins de VIM
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Instalacion de graphQL Cli para vim
sudo npm i -g graphql graphql-language-service-cli
