#!/bin/bash
echo 'Instalando los paquetes core de archlinux'
pacstrap /mnt base linux linux-firmware
echo 'Generamos el archivo FSTAB'
genfstab -U /mnt >> /mnt/etc/fstab
echo 'Instalamos los paquetes core'
pacstrap /mnt iproute2 man-db man-pages texinfo grub efibootmgr networkmanager iwd zsh git neovim vim-ale fzf the_silver_searcher s-tui xdg-user-dirs htop sudo fakeroot nodejs npm yarn jdk11-openjdk firefox chromium filelight neofetch base-devel telegram-desktop mariadb thunderbird qbittorrent bluez bluez-utils ark openssh util-linux ufw intellij-idea-community-edition libreoffice-still inkscape gimp
