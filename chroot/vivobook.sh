#!/bin/bash
./default.sh
# Copiando el archivo hosts y hostname de vivobook a la carpeta correspondiente de etc
echo 'Copiando los hosts de vivobook laptop'
cp ./vivobook/hostname /etc/hostname
cp ./vivobook/hosts /etc/hosts
echo 'Saliendo de chroot'
exit
