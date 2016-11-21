#!/bin/sh

if [ -f $1 ] ; then
	nano $1
	FILE=`echo $1 |sed 's#^.*board/ccu2/overlay##'`
	DIR=`dirname $FILE`
	ssh root@fhem-ccu2 "if [ -f /mnt/old_root/mnt/user$FILE ];then echo rm user file;rm /mnt/old_root/mnt/user$FILE;fi;mkdir -p /mnt/old_root$DIR" 
	scp $1 root@fhem-ccu2:/mnt/old_root$FILE
fi

