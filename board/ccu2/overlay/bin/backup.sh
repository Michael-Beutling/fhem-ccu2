#!/bin/sh

MNTPOINT=/media/mmcblk0p1

if mountpoint -q $MNTPOINT ;then
	DATE=`date +%Y-%m-%d_%H-%M-%S`
	/etc/init.d/S*fhem stop
	TGZ=fhem-ccu2-backup-$DATE.tgz
	echo "backup file $TGZ"
	tar c -C /mnt/old_root/mnt/user . | gzip -1 > $MNTPOINT/$TGZ
	
	if [ $? = 0 ] ;then
		echo $TGZ > $MNTPOINT/fhem-backup-latest.txt
		/etc/init.d/S*fhem start
		echo backup successfully finish
		exit 0
	fi
	/etc/init.d/S*fhem start
else 
	echo Error: no sd card...
fi
echo
echo Error: Something goes wrong...
exit 1
