#!/bin/sh

cat ~/.ssh/id_rsa.pub| ssh root@fhem-ccu2 'mkdir -p /root/.ssh; cat >/root/.ssh/authorized_keys'

