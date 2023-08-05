#!/bin/bash
#
#	* File     : arch_install_normal.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : 2023年08月05日 星期六 15时18分25秒

# pacstrap -K /mnt base linux linux-firmware
# genfstab -U /mnt >> /mnt/etc/fstab
# 

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

# /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "sun-arch" > /etc/hostname

echo "

127.0.0.1       localhost
::1             localhost
127.0.1.1       sun-arch.localdomain            sun-arch

" >> /etc/hosts

mkinitcpio -P

pacman -Syyu
sudo pacman -S networkmanager git zsh wget curl man fzf efibootmgr intel-ucode wayland xorg-xwayland plasma-meta plasma-wayland-session  kde-applications-meta plasma-pa plasma-nm kdegraphics-thumbnailers  kdeplasma-addons samba  kdenetwork-filesharing systemd sddm-kcm kde-gtk-config akonadi kdepim-addons sshfs  kdeconnect kscreen colord-kde ttf-dejavu  ttf-liberation libappindicator-gtk2  libappindicator-gtk3 gst-libav phonon-qt5-vlc khotkeys dhcpcd sddm 
pacman -S akonadi --assume-installed mariadb
systemctl enable NetworkManager
systemctl enable dhcpcd
