#!/bin/sh
if [ "$1" = "yes" ] ;then
	/bin/touch /mnt/old_root/.trigger_restore
	/sbin/reboot
else
	echo "usage: '$0 yes' start reboot and restore"
fi
