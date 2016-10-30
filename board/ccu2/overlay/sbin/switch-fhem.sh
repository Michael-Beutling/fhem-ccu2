#!/bin/sh

TEMPLATE_PATH=/usr/share/fhem-template
USER_PATH=/usr/local
makelink()
{
        if [ -f  "$1" ]
        then
                mkdir -p "`dirname $TEMPLATE_PATH/$1`"
                mv "$1" "$TEMPLATE_PATH/$1"
                ln -s "$USER_PATH/$1" "$1"
        fi
        if [ ! -e  "$USER_PATH/$1" ]
        then
                mkdir -p "`dirname "$USER_PATH/$1"`"
		cp -a "$TEMPLATE_PATH/$1" "$USER_PATH/$1"
	fi
}

makelink /etc/shadow

