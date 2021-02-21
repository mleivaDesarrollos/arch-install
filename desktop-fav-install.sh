#!/bin/bash
./core-packages/basic-packages.sh
./core-packages/amd-packages.sh
./dde/kde.sh
echo 'Copiando los scripts de chroot a la carpeta home'
mkdir /mnt/home/arch-install
cp -r ./* /mnt/home/arch-install
echo 'Entrando en modo chroot de la carpeta y ejecutando scripts'
arch-chroot /mnt /home/arch-install/chroot/desktop.sh
echo 'Desmontado todo lo generado'
umount -R /mnt
