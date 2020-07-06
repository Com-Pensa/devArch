# General
pacman -S xorg --noconfirm
pacman -S xf86-video-intel xf86-input-synaptics xf86-input-libinput libgl mesa --noconfirm

# XFCE4 and LightDM
pacman -S xfce4 xfce4-goodies --noconfirm
pacman -S lightdm lightdm-gtk-greeter --noconfirm

pacman -S tilix git code --noconfirm
pacman -S chromium --noconfirm

# Audio
pacman -S alsa-utils pulseaudio paprefs pavucontrol --noconfirm

# Setting the keyboard
localectl set-x11-keymap br abnt2

systemctl enable lightdm

# The background
rm /usr/share/backgrounds/xfce/xfce-stripes.png

pacman -S wget --noconfirm
wget https://i.imgur.com/xLc7V7B.jpg
cp xLc7V7B.jpg /usr/share/backgrounds/xfce/xfce-stripes.png

rm xLc7V7B.jpg
pacman -R wget
