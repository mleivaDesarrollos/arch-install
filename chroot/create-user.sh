#!/bin/bash
echo 'Creando usuario zaktorius y estableciendo contrasena para zaktorius'
useradd -m -s /bin/zsh zaktorius && passwd zaktorius
echo 'Reemplazando el archivo sudoers para incluir a zaktorius dentro del listado de usuarios'
cp ./sudoers /etc/sudoers
