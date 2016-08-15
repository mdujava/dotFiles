---
layout: post
title:  "Arch post install"
date:   2016-08-15 20:00:00 +0100
categories: Arch postinstall
---

# users
useradd username
usermod -aG wheel username
mkdir /home/username
chown username:username /home/username


pacman -S sudo
visudo
