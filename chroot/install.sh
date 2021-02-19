#!/bin/bash
ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
hwclock --systohc
cp ./sudoers-aur /etc/sudoers
cp ./hostname /etc/hostname
cp ./hosts /etc/hosts
./aur-basic-packages.sh
./create-user.sh
cp ./sudoers-default /etc/sudoers
