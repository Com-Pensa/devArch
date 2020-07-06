#!/bin/bash

clear # Limpar tela

lsblk -l | grep disk    # Listar os discos

# Armazenando o disco
echo "\n Qual unidade de armazento particionar? "
read _disk
_disk="/dev/${_disk}"
export _disk

cfdisk -z $_disk   # Abrindo Particionador do disco

clear && fdisk -l $_disk # Listando particoes

# Armazenando o /
echo "\n Qual e o numero da particao do /? "
read _bar
_bar="${_disk}${_bar}"
export _bar

clear && fdisk -l $_disk

# Armazenando o swap
echo "\n Qual e o numero da particao SWAP? "
read _swap
_swap="${_disk}${_swap}"
export _swap

clear

echo " + Formatando e montando o barra;"
mkfs.ext4 $_bar && mount $_bar /mnt

echo " + Formatando e montando o Swap;"
mkswap $_swap && swapon $_swap

# Mirrors
rm /etc/pacman.d/mirrorlist

wget https://raw.githubusercontent.com/Com-Pensa/devArch/master/src/installation/br-mirrors
cp br-mirrors /etc/pacman.d/mirrorlist
rm br-mirrors

echo " + Instalando a base do sistema;"
pacstrap /mnt linux linux-firmware base base-devel

echo " + Gerando a FSTAB;"
genfstab -U /mnt >> /mnt/etc/fstab

echo " + Instalando o script de instalacao do chroot e chamando;"
wget https://raw.githubusercontent.com/Com-Pensa/devArch/master/src/chroot/chroot-installation.sh
chmod 755 chroot-installation.sh && mv chroot-installation.sh /mnt

arch-chroot /mnt /chroot-installation.sh

rm /mnt/chroot-installation.sh
echo " + Desmontando particoes;"
umount -R /mnt

exit
