#!/bin/bash
echo 'Instalando los paquetes requeridos para el uso de un CPU y GPU AMD'
pacstrap /mnt amd-ucode mesa xf86-video-amdgpu vulkan-radeon
