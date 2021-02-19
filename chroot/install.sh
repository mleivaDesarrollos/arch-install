#!/bin/bash
# Timezone setup
ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
hwclock --systohc
# AUR WARMUP
cp ./sudoers-aur /etc/sudoers
# HOSTNAME AND HOSTS
cp ./hostname /etc/hostname
cp ./hosts /etc/hosts
# AUR BASIC INSTALL
./aur-basic-packages.sh
# ZAKTORIUS CREATION
./create-user.sh
# RESTORE SUDO
cp ./sudoers-default /etc/sudoers
# Grub INstall
grub-install --target=x86_64-efi
grub-mkconfig -o /boot/grub/grub.cfg
