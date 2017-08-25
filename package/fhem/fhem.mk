################################################################################
#
# FHEM
#
################################################################################

FHEM_VERSION = HEAD
FHEM_SITE_METHOD = local
FHEM_SITE = $(FHEM_PKGDIR).

FHEM_LICENSE = GPLv3+
FHEM_LICENSE_FILES = COPYING
FHEM_DEPENDENCIES = perl-device-serialport perl-json

define FHEM_BUILD_CMDS
	wget `cat $(@D)/controls.txt` -q -O $(@D)/controls_fhem.txt --user-agent="" 
	echo revision=`gawk 'NR==1{print $$2}' '$(@D)/controls_fhem.txt'`
	svn checkout -q -r `gawk 'NR==1{print $$2}' '$(@D)/controls_fhem.txt'` https://svn.fhem.de/fhem/trunk '$(@D)'
	cd $(@D)/fhem;make dist
endef

define FHEM_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0766 $(FHEM_PKGDIR)S70fhem $(TARGET_DIR)/etc/init.d/
    ln -s /etc/init.d/S70fhem $(TARGET_DIR)/sbin/fhem
endef

FHEM_INSTALL_IMAGES = YES
define FHEM_INSTALL_IMAGES_CMDS
	rm -f $(BINARIES_DIR)/fhem.tgz
	rm -rf $(@D)/work
	mkdir -p $(@D)/work/fhem
	tar xzf $(@D)/fhem/fhem-5.8.tar.gz -C $(@D)/work/fhem --strip-components 1
	cat $(FHEM_PKGDIR)ccu2.cfg >> $(@D)/work/fhem/fhem.cfg
	cp $(@D)/controls.txt $(@D)/work/fhem/FHEM/controls.txt
	cp $(@D)/controls_fhem.txt $(@D)/work/fhem/FHEM/controls_fhem.txt
	tar czf $(BINARIES_DIR)/fhem.tgz --numeric-owner  --owner=1000 --group=1000 -C $(@D)/work .
	rm -rf $(@D)/work
endef
 


define FHEM_USERS
    fhem 1000 fhem 1000 * /opt/fhem /bin/sh - FHEM User
endef

define FHEM_DEVICES
    #/dev/foo  c  666  0  0  42  0  -  -  -
endef

define FHEM_PERMISSIONS
    /opt/fhem  r  755  fhem  fhem   -  -  -  -  -
    /bin/ping  r  4755  root  root   -  -  -  -  -
endef

$(eval $(generic-package))
