#!/bin/bash
# Timezone setup
echo 'Estableciendo zona horaria de argentina'
ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
hwclock --systohc
echo 'Establezca su password de root user:'
passwd
# locales conf
echo 'Generando configuracion de idioma'
cp ./locale.gen /etc/locale.gen
locale-gen
echo 'Estableciendo el idioma por defecto a espanol argentina'
cp ./locale.conf /etc/locale.conf
# ZAKTORIUS CREATION
./create-user.sh
# Grub INstall
echo 'Generando el GRUB para el sistema'
grub-install --target=x86_64-efi
grub-mkconfig -o /boot/grub/grub.cfg
# Enabling services
echo 'Habilitando los servicios configurados'
./enabling-services.sh
# Cambiando configuraciones de git
git config --global core.editor nvim
git config --global user.name 'Maximiliano Leiva'

