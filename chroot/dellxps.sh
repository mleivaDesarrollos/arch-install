#!/bin/bash
cd /home/arch-install/chroot
./default.sh
# The grub config for this system is different, so default would fail
echo 'Configurando GRUB para la XPS'
# This configuration is mean to add VMD drivers for SSD awareness
cp ./dellxps/modules-load.d/customload.conf /etc/modules-load.d
cp ./dellxps/mkinitcpio.conf /etc
mkinitcpio -p linux

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=archlinux-grub
grub-mkconfig -o /boot/grub/grub.cfg

# Copiando el archivo hosts y hostname de desktop a la carpeta correspondiente de etc
echo 'Copiando los hosts de Dell XPS'
cp ./dellxps/hostname /etc/hostname
cp ./dellxps/hosts /etc/hosts
echo 'Habilitando servicio GDM de KDE';
systemctl enable gdm
echo 'entregando permisos sobre carpeta archinstall a zaktorius y moviendola dentro'
cd /home
mv /home/arch-install /home/zaktorius
chown -R zaktorius:zaktorius /home/zaktorius/arch-install
echo 'Saliendo de CHROOT'
exit
