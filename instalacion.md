# Instalación de ArchLinux - last

Voy a tomar una serie de notas en base a la instalación

## Listados de distribución de teclados

Para poder ver los listados de teclados disponibles de la consola de linux se puede utilizar el siguiente comando:

```bash
ls /usr/share/kbd/keymaps/**/*.map.gz
```

Una vez identificado el teclado hay que elegirlo, se hace de la siguiente manera:

```bash
loadkeys la-latin1 # Latinomerica español
loadkeys us # Estados unidos vivobook
```

## Verificar si estamos en EFI o en MBR

Para poder comprobar si estamos en modo EFI o en modo MBR podemos ejecutar el siguiente comando:

```bash
ls /sys/firmware/efi/efivars
```

**Si aparece** estas en **EFI**, **si no aparece** estas en **MBR**.

## Verificar dispositivos de red disponibles

Para poder comprobar el listado total de dispositivos de red que actualmente tiene tu PC se puede tirar el siguiente comando:

```bash
ip link
```

En caso de que tengas una notebook, puede que tengas que habilitar el wifi con la combinación de teclas adecuadas. En modo consola seguramente no va a funcionar, por lo que deberia ejecutarse un comando para habilitarlo:

```bash
rfkill list # Para ver si la placa de red WiFi esta bloqueda, verificar igual que este activo con la combinación de teclas de wifi.
rfkill unblock wifi # En caso de estar bloqueado, con este comando se desbloquea
```

En el caso de tener que conectarse por medio de red WIFI hay que utilizar el siguiente comando:

```bash
iwctl # Modo consola para red inalambrica
########## en el CLI de IWCTL
device list # Mostrar el listado de dispositivos
station (DISPOSITIVO) scan # Buscamos las redes WIFI
station $(DISPOSITIVO) get-networks # Traemos las redes buscadas
station $(DISPOSITIVO) connect $(NOBRE DE RED) #Conectamos a la red
```

Hay una serie de comandos que hay que ejecutar para poder conectarse, para eso hay que seguir la guia de esta wiki:

https://wiki.archlinux.org/index.php/Iwd#iwctl

## Establecer tiempo zonal del SO

Para poder establecer el tiempo de la zona del sistema operativo a instalar hay que ejecutar el siguiente comando:

```bash
timedatectl set-timezone America/Argentina/Buenos_Aires
```

El ejemplo de arriba establecimos como tiempo zonal del sistema la region de Buenos Aires, Argentina, que tiene el GMT -3.

## Particionando el disco por medio de consola

Para poder particionar un disco por medio de consola debemos primero localizar el disco para particionar, la forma de mostrar el disco que queremos particionar por consola es mediante el uso del siguiente comando:

```bash
fdisk -l
```

Como salida de este comando el sistema nos va a devolver un listado de discos existentes en el sistema, nuestra tarea es localizar y elegir el correcto.

**Warning**: Cualquier tarea que se ejecute de aca en adelante puede llegar a borrar la informacion en los discos que estemos operando, mucho cuidado y en lo posible tratemos de realizar copias de seguridad de la informacion antes de proceder con cualquier modificacion

### Creacion de particiones de en un disco vacio

Una vez elegido un disco (por motivos de ejemplo vamos a definirlo como **/dev/sda**) vamos a ejecutar el siguiente comando:

```bash
fdisk /dev/sda
```

Vamos a entrar en el CLI de FDISK para poder modificar un disco a nuestro gusto. Para crear una nueva partición vamos a ejecutar los siguientes comandos:

```bash 
n # Creamos una nueva particion
e # Elegimos de tipo particion extendida
(ENTER) # Aca iria el sector de inicio de la particion, por motivos de ejemplos dejamos vacio
(ENTER) # Aca iria el sector final del disco, lo que le estamos diciendo a FDISK con un enter aqui es que vamos a crear una particion que use la totalidad del espacio
```

Como resultado de esta operación FDISK nos va a generar una partición lógica ¡ue va a ocupar la totalidad del disco.

A partir de aca tendríamos que generar subparticiones, en este ejemplo estamos parado en un sistema EFI, vamos a generar la particion de booteo EFI.

```bash
n # Creamos una nueva partición
(ENTER) # El sector de inicio lo dejamos como esta
+500M # Le indicamos a FDISK que la particion tiene que ser de 500 megas
# Aca FDISK nos va a devolver un numero de particion, tomemos nota, en este ejemplo sera 5
t # Pedimos cambiar el tipo de la partición
1 # Establecemos como formato de sistema el tipo EFI	 
```

Podemos crear una partición de tipo SWAP, para eso habría que usar la misma secuencia que la anterior, solamente que en el tipo debemos elegir el correspondiente para una partición de tipo swap.

### Formateo de particiones

Para formatear las particiones se deben usar los siguientes comandos:

- **linux**: **mkfs.ext4 /dev/sda3**
- **EFI**: **mkfs.fat /dev/sda1**
- **SWAP**: **mkswap /dev/sda2**

### Montado de particiones

Una vez creadas y formateadas las particiones debemos montarlas en el sistema de archivos que servira de nuestro sistema operativo:

- **Sistema**: **mount /dev/sda3 /mnt**
- **EFI**: **mkdir /mnt/efi && mount /dev/sda1 /mnt/efi**
- **Swap**: **swapon /dev/sda2**

## Revisión de espejos para instalación

Para poder comenzar con la instalación se deben revisar los espejos de instalación, al momento de hacer la instalación buscar los espejos que esten en chile, brazil y usa. (para nuestro caso en Argentina) **/etc/pacman.d/mirrorlist**

```
Server = https://mirror1.cl.netactuate.com/archlinux/$repo/os/$arch
Server = https://mirror.ufro.cl/archlinux/$repo/os/$arch
Server = https://www.caco.ic.unicamp.br/archlinux/$repo/os/$arch
```

## Instalación de paquetes basicos

El siguiente comando realiza la instalación básica de las herramientas necesarias para poder operar con archlinux

```bash
pacstrap /mnt base linux linux-firmware
```

Adicionalmente hay que instalar todos los paquetes que se consideren necesarios para la operación, en el final va a quedar un glosario con los paquetes que voy a ir utilizando

## Generación de archivo FSTAB

Hay que generar el archivo fstab dentro de la carpeta del sistema, para ello ejecutamos lo siguiente:

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

## Entrar en modo ChROOT y finalizar la instalación

Una vez avanzado con todos estos pasos hay que entrar en modo root de la instalación que estamos haciendo, usando el siguiente comando podemos ingresar:

```bash
arch-chroot /mnt
```

## Establecer una zona de tiempo

Con el siguiente comando vamos a proceder a establecer una zona de tiempo:

```bash
ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime

hwclock -systohc
```

 ## Configuración del lenguaje

Es necesario modificar el archivo **/etc/locale.gen**, descomentado los lenguajes que vayamos a utilizar (IE: **en_US.UTF-8**)

Una vez finalizado ejecutamos el comando siguiente para fijar la configuración:

```bash
locale-gen
```

Hay que crear el archivo **/etc/locale.conf** con el siguiente contenido:

```bash
LANG=en_US.UTF-8
```

Si queremos configurar una distribución de teclado configurando el archivo **vconsole.conf**

## Configuración de red

Hay que establecer el nombre del equipo en el lugar correspondiente, para eso **creamos /etc/hostname** y como unico contenido en la primera línea el **nombre del equipo**

En la configuración del archivo host deberia quedar algo parecido a lo siguiente, con la salvedad de que en el hostname debe ir el nombre del equipo:

```bash
/etc/hosts

127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname

```


## Establecer la contraseña de ROOT

```bash
passwd
```

## Instalando un bootloader

La mayoria de las instalaciónes existentes de linux utilizan **grub** como bootloader de sistema, vamos a basar nuestra instalación en considerar el uso de **grub** como booloader.

Instalar los paquetes de grub, efibootmgr y el microcode del procesador correspondiente y luego ejecutar los siguientes comandos

```
grub-install --target=x86_64-efi
grub-mkconfig -o /boot/grub/grub.cfg
```

## Post Instalación

### NetworkManager

Al finalizar la instalación nos tenemos que encargar de inicializar el network manager para que nos conecte a la red:

```
systemctl enable NetworkManager.service
systemctl start NetworkManager.service
```

### IWD

Para poder usar los servicios de conexion inalambricas hay que inicializar e instalar el servicio de conexión inalambrica

```bash
systemctl enable iwd.service
systemctl start iwd.service
```

### Display Manager

Una vez instalado el display manager hay que habilitarlo, en el caso de **SDDM** que es el Display Manager de KDE y LXQT se tiene que ejecutar el siguiente comando:

```
systemctl enable sddm.service
```



### Creación de usuarios

Para poder crear un usuario se debe utilizar el siguiente comando

```
useradd -m -G (grupos) -S (consola) (nombre de usuario)
```

### Modificación del archivo SUDOERS

El archivo ubicado en la ruta **/etc/sudoers** hay que modificarlo para agregarle nuestro usuario para que podamos hacer uso del comando **sudo**. Lo que tendría que quedar agregado es lo siguiente:

```
zaktorius ALL=(ALL) ALL
```

# Paquetes

## Genericos

```
iproute2 man-db man-pages texinfo grub efibootmgr networkmanager iwd zsh git neovim vim-ale fzf the_silver_searcher s-tui xorg-server xorg-apps xdg-user-dirs htop sudo fakeroot nodejs npm yarn jdk11-openjdk firefox chromium filelight neofetch base-devel
```

## Java IDES

```
intellij-idea-community-edition
```

## OFIMATICA - GRAFICOS

```
libreoffice-still gimp inkscape
```

## DESKTOP MAXI

```
amd-ucode mesa xf86-video-amdgpu vulkan-radeon
```

## VivoBook

```
amd-ucode mesa xf86-video-amdgpu vulkan-radeon libinput libinput-gestures xdotool
```

## Desktop Environments

## KDE

```
sddm plasma-meta kde-applications latte-dock
```

## Deepin

```
deepin deepin-extra lightdm
```

## Scripts Personalizados

Para la instalacion de paquetes AUR en modo chroot hay que hacer un par de movidas, en el cual hay una en la que depende de que nobody tenga permisos de sudo sin pedir contraseña. Por motivos de instalación puede ser util, pero es peligroso dejar el sudo abierto para el usuario nobody. hay que aplicarle un sudoers temporal al proceso y luego regresar el original
