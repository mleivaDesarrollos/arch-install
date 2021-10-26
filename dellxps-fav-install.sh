#!/bin/bash
./core-packages/basic-packages.sh
./core-packages/intel-packages.sh
./core-packages/x11-install.sh
./core-packages/wayland-install.sh
./dde/gnome.sh
echo 'Copiando los scripts de chroot a la carpeta home'
mkdir /mnt/home/arch-install
cp -r ./* /mnt/home/arch-install
echo 'Entrando en modo chroot de la carpeta y ejecutando scripts'
arch-chroot /mnt /home/arch-install/chroot/dellxps.sh
echo 'Desmontado todo lo generado'
umount -R /mnt
