# FHEM-CCU2

FHEM-CCU2 is a custom rom builder for the Homematic-CCU2 box.
It use [Vagrant](https://www.vagrantup.com) for a [Buildroot](https://buildroot.org) enviroment.

## Installation
Run the Builder with **vagrant up** und You get two *.tgz files.

Boot the CCU2 Box in the recovery mode (unplug power, press the reset button and plug in the power connector).

On the [recovery website](http://http://homematic-ccu2) upload the **fhem-ccu2.tgz** file.
 
After the reboot [FHEM](http://fhem-ccu2:8083/fhem) is started and SSH (root/root) is running.

## Deinstallation
Boot in the recovery mode and upload **do\_factory\_reset.tgz**. After a reboot the recovery mode is start again and you can upload a [stock firmware](http://www.eq-3.de/service/downloads.html?id=202).
 
## ToDo
* More testing
* Improve my english skills :)
* BidCos support 
 
