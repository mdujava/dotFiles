#!/bin/bash

i3-msg move scratchpad
sleep 0.2
lock.sh
{ systemctl suspend; exit; }
