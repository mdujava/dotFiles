---
layout: post
title:  "Arch install"
date:   2016-02-21 16:38:00 +0100
categories: Arch install
---

# Preparing disk
Format disk: `fdisk -l`, `cfdisk /dev/sda`, `mkfs.ext4 /dev/sdaX`

Create swap:

* `mkswap /dev/sdaX`
* `swapon /dev/sdaX`

Mount disk to **/mnt**:

* one partition:
  * `mount /dev/sdaX /mnt` for new **root** directory
* additional partition for home/boot:
  * `mkdir /mnt/home; mount /dev/sdaX /mnt/home` for new **home** directory
  * `mkdir /mnt/boot; mount /dev/sdaX /mnt/boot` for new **boot** directory

# Install
`pacstrap /mnt base base-devel`

# PostInstall
`arch-chroot /mnt`

`passwd`

uncomment language in `/etc/locale.gen` and run `locale-gen`

`ln -s /usr/share/zoneinfo/Europe/Bratislava /etc/localtime`

`echo hostname > /etc/hostname`

`pacman -S grub-bios`

`grub-install /dev/sda`

`mkinitcpio -p linux`

`grub-mkconfig -o /boot/grub/grub.cfg`

`exit`

`genfstab /mnt >> /mnt/etc/fstab`

`umount /dev/sda4`

`pacman -S i3 dmenu xorg xorg-xinit`

[link](http://makandracards.com/makandra/1090-customize-your-bash-prompt "Customing prompt")

[link](http://stackoverflow.com/questions/11981716/how-to-quickly-find-all-git-repos-under-a-directory "Git reop finder")

[link](https://blog.sleeplessbeastie.eu/2013/01/07/how-to-automatically-set-up-external-monitor/)

[link](http://www.simplehelp.net/2009/04/15/how-to-redirect-traffic-to-another-machine-in-linux/)

[link](http://www.techrapid.co.uk/linux/arch-linux/improve-font-rendering-on-arch-linux/)
