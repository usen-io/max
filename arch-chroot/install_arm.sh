#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

dd of=/etc/locale.conf << EOF  
LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LC_NUMERIC=en_US.UTF-8
LC_TIME=en_US.UTF-8
LC_COLLATE=en_US.UTF-8
LC_MONETARY=en_US.UTF-8
LC_MESSAGES=en_US.UTF-8
LC_PAPER=en_US.UTF-8
LC_NAME=en_US.UTF-8
LC_ADDRESS=en_US.UTF-8
LC_TELEPHONE=en_US.UTF-8
LC_MEASUREMENT=en_US.UTF-8
LC_IDENTIFICATION=en_US.UTF-8
LC_ALL=en_US.UTF-8
EOF

###  echo "LC_ALL=C" >> /etc/locale.conf
###  echo "LANG=en_US.UTF-8" >> /etc/locale.conf
###  echo "LC_COLLATE=en_US.UTF-8" >> /etc/locale.conf
echo "max-ign" > /etc/hostname
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

