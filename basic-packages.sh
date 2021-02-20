#!/bin/bash
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
pacstrap /mnt iproute2 man-db man-pages texinfo grub efibootmgr networkmanager iwd zsh git neovim vim-ale fzf the_silver_searcher s-tui xorg-server xorg-apps xdg-user-dirs htop sudo fakeroot nodejs npm yarn jdk11-openjdk firefox chromium filelight neofetch base-devel telegram-desktop mariadb thunderbird qbittorrent
