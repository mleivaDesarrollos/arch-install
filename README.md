# Scripts de instalacion de ArchLinux

Estos archivos contienen algunas selecciones personales de paquetes para una instalacion de ArchLinux.

- Ejecutar **chmod -R +x ./*.sh** para poder usar los scripts

## Previa del uso de estos scripts

Para poder usar los scripts que estan en este repo es necesario lo siguiente

- Tener resuelto tema de particiones de disco, como no es posible definir en que disco y que forma se va a instalar, esta parte requiere manual

- Si descargaste este repo desde github ya tendrias que tener resuelto el tema de conexiones de red

- Configure la zona de tiempo con el siguiente comando: timedatectl set-timezone America/Argentina/Buenos_Aires

## Favoritos

Hay ciertos scripts que estan en este listado que contiene la seleccion personal para determinados equipos, esa seleccion va a cambiar en base a los gustos que vaya teniendo en determinado momentos

## Paquetes base

Hay ciertos paquetes que van a ser MUST en todas las instalaciones que vaya a realizar. Algunos paquetes son core de linux, y otros son consideraciones personales de lo que seria un paquete requerido

## Desktop Environments

En el raiz del proyecto hay ciertos scripts que se encargan de hacer la instalacion base de paquetes y tambien los paquetes relacionados con el entorno a instalar.

- NO INSTALAR basic-packages.sh en core si se usa uno de estos scripts, el script ya lo hace por vos
