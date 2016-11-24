#!/bin/sh
echo secondary >/sys/module/plat_eq3ccu2/parameters/boot
echo "boot recovery system..."
reboot
