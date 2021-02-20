#!/bin/bash
# Timezone setup
ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
hwclock --systohc
# locales conf
cp ./locale.gen /etc/locale.gen
locale-gen
cp ./locale.conf /etc/locale.conf
# HOSTNAME AND HOSTS
cp ./hostname /etc/hostname
cp ./hosts /etc/hosts
# ZAKTORIUS CREATION
./create-user.sh
# Grub INstall
grub-install --target=x86_64-efi
grub-mkconfig -o /boot/grub/grub.cfg
# Enabling services
./enabling-services.sh
