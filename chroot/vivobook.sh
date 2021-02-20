#!/bin/bash
cd /home/chroot
./default.sh
# Copiando el archivo hosts y hostname de vivobook a la carpeta correspondiente de etc
echo 'Copiando los hosts de vivobook laptop'
cp ./vivobook/hostname /etc/hostname
cp ./vivobook/hosts /etc/hosts
echo 'Habilitando servicio SDDM de KDE';
./enable-services-kde.sh
echo 'Saliendo de chroot'
exit
