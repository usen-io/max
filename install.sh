#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "LC_ALL=C" >> /etc/locale.conf
echo "neo-00" > /etc/hostname
echo -e "127.0.0.1       localhost\n::1             localhost\n127.0.1.1       localhost" >> /etc/hosts


pacman -S --noconfirm sudo snapper openssh python python-pip git networkmanager neovim grub dhcpcd busybox efibootmgr sudo dhcpcd busybox networkmanager


sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config


systemctl enable sshd
systemctl enable NetworkManager


grub-install --target=arm64-efi --recheck --removable --efi-directory=/boot --boot-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
grub-mkconfig -o /boot/EFI/BOOT/grub.cfg

printf "toor\ntoor\n" | passwd root

cp /boot/Image /boot/vmlinuz-linux

pacman -Scc --noconfirm

