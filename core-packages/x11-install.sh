#!/bin/bash
./basic-packages.sh
echo 'Instalando paquetes del display server X11'
pacstrap /mnt xorg-server xorg-apps xsel xclip
