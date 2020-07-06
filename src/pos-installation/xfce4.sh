# General
pacman -S xorg --noconfirm
pacman -S xf86-video-intel xf86-input-synaptics xf86-input-libinput libgl mesa --noconfirm

# XFCE4 and LightDM
pacman -S xfce4 xfce4-goodies --noconfirm
pacman -S lightdm lightdm-gtk-greeter --noconfirm

pacman -S papirus-icon-theme --noconfirm

pacman -S tilix nemo regexxer chromium --noconfirm
pacman -S git code --noconfirm

# Audio
pacman -S alsa-utils pulseaudio paprefs pavucontrol --noconfirm

# Setting the keyboard
localectl set-x11-keymap br abnt2

systemctl enable lightdm

# The main background
pacman -S wget --noconfirm
wget https://i.imgur.com/xLc7V7B.jpg
cp xLc7V7B.jpg /usr/share/backgrounds/xfce/think-plan-execute.jpeg
rm xLc7V7B.jpg

# The second background
wget https://i.imgur.com/EQeG7HR.jpeg
cp EQeG7HR.jpeg /usr/share/backgrounds/xfce/deer.jpeg
rm EQeG7HR.jpeg

wget https://raw.githubusercontent.com/Com-Pensa/devArch/master/src/pos-installation/lightdm.patch
pacth /etc/lightdm/lightdm-gtk-greeter.conf < lightdm.pacth

rm lightdm.patch
pacman -R wget
