#!/bin/bash
./default.sh
# Copiando el archivo hosts y hostname de desktop a la carpeta correspondiente de etc
echo 'Copiando los hosts de AMD 2700x'
cp ./desktop/hostname /etc/hostname
cp ./desktop/hosts /etc/hosts
echo 'Saliendo de CHROOT'
exit
