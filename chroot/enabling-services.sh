#!/bin/bash

# Habilitamos la administracion automatica de red
systemctl enable NetworkManager.service

#Deshabilitamos el servicio por defecto WPA Supplicant
systemctl disable wpa_supplicant.service

# Habilitamos el servicio de control inalambrico de red
systemctl enable iwd.service

# Habilitamos el servicio de bluetooth
systemctl enable bluetooth.service

# Habilitamos el servicio de trimmer que ayuda aumentar la vida util de los discos
systemctl enable fstrim.timer
