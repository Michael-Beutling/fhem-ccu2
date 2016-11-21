#!/bin/sh

MNTPOINT=/media/mmcblk0p1

if mountpoint -q $MNTPOINT ;then
	DATE=`date +%Y-%m-%d_%H-%M-%S`
	TGZ=fhem-ccu2-backup-$DATE.tgz
	tar c -C /mnt/old_root/mnt/user . | gzip -1 > $MNTPOINT/$TGZ
	
	if [ $? = 0 ] ;then
		echo $TGZ > $MNTPOINT/fhem-backup-latest.txt
		exit 0
	fi
fi
exit 1
