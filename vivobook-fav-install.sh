#!/bin/bash
./core-packages/basic-packages.sh
./core-packages/amd-packages.sh
./dde/kde.sh
echo 'Copiando los scripts de chroot a la carpeta home'
cp -r ./chroot /mnt/home/
echo 'Entrando en modo chroot de la carpeta y ejecutando scripts'
arch-chroot /mnt /home/chroot/vivobook.sh
echo 'Removiendo carpeta temporal chroot'
rm -rf /mnt/home/chroot
echo 'Desmontado todo lo generado'
umount -R /mnt
