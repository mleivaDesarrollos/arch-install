#!/bin/bash
cd /home/arch-install/chroot
./default.sh
# Copiando el archivo hosts y hostname de desktop a la carpeta correspondiente de etc
echo 'Copiando los hosts de Dell XPS'
cp ./dellxps/hostname /etc/hostname
cp ./dellxps/hosts /etc/hosts
echo 'Habilitando servicio SDDM de KDE';
./enable-services-kde.sh
echo 'entregando permisos sobre carpeta archinstall a zaktorius y moviendola dentro'
cd /home
mv /home/arch-install /home/zaktorius
chown zaktorius:zaktorius /home/zaktorius/arch-install
echo 'Saliendo de CHROOT'
exit
