#!/bin/bash

# Sudo and user password
_password="123"

# Time
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

# Some configurations
echo "en-US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "KEYMAP=br-abnt2" > /etc/vconsole.conf

echo "arch" > /etc/hostname

echo "127.0.0.1            localhost" >> /etc/hosts
echo "::1                  localhost" >> /etc/hosts
echo "127.0.0.1 myhostname.localdomain myhostname" >> /etc/hosts

# Passwords and new user
passwd << EOF
$_password
$_password
EOF
useradd -m -g users -G wheel -s /bin/bash user
passwd user << EOF
$_password
$_password
EOF

echo " + A senha e 123123"

echo "user ALL=(ALL) ALL" >> /etc/sudoers

# General packages
pacman -S networkmanager network-manager-applet dosfstools wireless_tools wpa_supplicant wpa_actiond dialog grub --noconfirm

# Grub install
grub-install --target=i386-pc --recheck /dev/sda
cp /usr/share/locale/en@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

grub-mkconfig -o /boot/grub/grub.cfg

exit
