# FHEM-CCU2

FHEM-CCU2 is a custom rom builder for the HomeMatic-CCU2 box.
It use [Vagrant](https://www.vagrantup.com) for a [Buildroot](https://buildroot.org) environment. It use FHEM instead the stock CCU2 user interface.

## Building
Run the Builder with **vagrant up** and you get two *.tgz files. With **vagrant ssh** you can access the build enviroment. The source path (/vagrant) is included as external path. 

## Installations
Boot the CCU2 Box in the recovery mode (unplug power, press the reset button and plug in the power connector).

On the [recovery website](http://http://homematic-ccu2) from the CCU2 upload the **fhem-ccu2_production.tgz** file.
 
After the reboot [FHEM](http://fhem-ccu2:8083/fhem) is started and SSH/Telnet (root/root) is running on the CCU2.

## Deinstallation
Boot in the recovery mode and upload **fhem-ccu2\_back\_to_stock.tgz** to the CCU2. After a reboot the recovery mode is start again and you can upload the [stock firmware](http://www.eq-3.de/service/downloads.html?id=201).

## Update from 0.2 and early
Reinstall the stock firmware and install FHEM-CCU2 again. Sorry for the inconvenience, but same binaries from stock firmware are needed.
 
## Features
* HMCCU is configured
* The reset button start the HomeMatic pairing for 60 seconds
* Backup and restore to SD card (SSH/Telnet: **backup.sh**/**restore.sh**)

## ToDo
* more testing
* eliminating closed source components
* Improve my english skills :)
 
