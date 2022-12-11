#!/usr/bin/env bash

#Based on my XPS 13 Plus 9320, Intel Alder Lake-P iGPU
#Dual boot

#iwctl, station wlan0

timedatectl set-ntp true
pacman -Syyy
pacman -Sy archlinux-keyring
#reflector -c Singapore -a 6 --sort rate --save /etc/pacman.d/mirrorlist


#Setting Linux Partitions
lsblk
#cfdisk <drive>, write one for root and swap (at least 4 GB)
#mkfs.ext4 /dev/main partition
#mkswap /dev/swap partition
#swapon /dev/swap partition
#mount /dev/efi partition /mnt/boot
#
#pacstrap /mnt base linux linux-firmware vim intel-ucode neofetch dhcpcd networkmanager mesa
#genfstab -U /mnt >>> /mnt/etc/fstab
#arch-chroot /mnt

#Locale

#ln -sf /usr/share/zoneinfo/Singapore /etc/localtime
#hwclock --systohc
#vim /etc/locale.gen, uncomment en_US.UTF-8 UTF-8
#locale-gen
#echo "LANG=en_US.UTF-8" > /etc/locale.conf
#export LANG=en_US.UTF-8
#echo "ALZT" > /etc/hostname
#passwd
#
#vim /etc/hosts, add newline
#127.0.0.1	localhost
#::1		localhost
#127.0.1.1	ALZT.localdomain	ALZT
#
#pacman -S grub efibootmgr ntfs-3g network-manager-applet dialog mtools dosfstools os-prober wireless_tools wpa_supplicant git reflector bash-completion base-devel linux-headers bluez bluez-utils pulseaudio-bluetooth xdg-utils xdg-user-dirs rsync inetutils openssh xorg xorg-init bspwm sxhkd kitty polybar nitrogen powerline picom
#xf86-video-amd OR nvidia nvidia-utils
#install yay to install brave-browser

#GRUB (Dual-Boot)
#vim /etc/default/grub, uncomment GRUB_DISABLE_OS_PROBER = false
#grub-install --target=x64_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck
#grub-mkconfig -o /boot/grub/grub.cfg

#Enable Services
#systemctl enable NetworkManager
#systemctl enable bluetooth
#systemctl enable sshd
#systemctl enable reflector.timer
#systemctl enable fstrim.timer

#useradd -mG wheel ashley
#passwd ashley
#visudo, uncomment %wheel ALL=(ALL) ALL

#Unmount and reboot
#exit
#umount -lR /mnt
#reboot
