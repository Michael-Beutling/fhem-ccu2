#!/bin/sh
if [ -e output/build/busybox-*/.config ];then
	cp output/build/busybox-*/.config /vagrant/board/ccu2/busybox.config 
	echo save defconfig
else
	echo error output/build/busybox-*/.config not found
fi
