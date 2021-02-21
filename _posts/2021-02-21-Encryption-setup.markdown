---
layout: post
title:  "Arch Encrypoted partition"
date:   2021-02-21 10:00:00 +0100
categories: Arch install
---

# Preparing disk
Create /boot partition as ext4 or fat32 (Lets say /dev/sda1)  
Create LUKS partition (Lets say /dev/sda2)  
 
# Creating filesystems
`mkfs.ext4 /dev/sda1`  
`cryptsetup -y -v luksFormat /dev/sda2`  

Open LUSK partition  
`cryptsetup -v luksOpen /dev/sda2 archlinux`  

optionaly create LVM and create fylesystems  
```
pvcreate /dev/mapper/archlinux
vgcreate ... 
lvcreate ...
mkfs.ext4 /dev/mapper/vgname_lvname
```

or create one big root partition without LVM:  
`mkfs.ext4 /dev/mapper/archlinux`  

From now on you can mount newroot and newboot into the /mnt and continue with instalation.
```
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
mount /dev/mapper/archlinux /mnt # or instead of archlinux put vgname_lvname
```
