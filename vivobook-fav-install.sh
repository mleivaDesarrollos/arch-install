#!/bin/bash
./core-packages/basic-packages.sh
./core-packages/amd-packages.sh
./kde-dde-install.sh
echo 'Copiando los scripts de chroot a la carpeta home'
cp -r ./chroot /mnt/home/
echo 'Entrando en modo chroot de la carpeta'
arch-chroot /mnt
echo 'Ejecutando los comandos para la notebook vivobook'
cd /home/chroot
./vivobook.sh
echo 'Saliendo de modo CHROOT'
exit
echo 'Desmontado todo lo generado'
umount -R /mnt
