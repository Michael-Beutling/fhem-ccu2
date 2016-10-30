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
	wget `cat $(@D)/controls.txt` -O $(@D)/controls_fhem.txt
	echo revision=`gawk 'NR==1{print $$2}' '$(@D)/controls_fhem.txt'`
	svn checkout -r `gawk 'NR==1{print $$2}' '$(@D)/controls_fhem.txt'` svn://svn.code.sf.net/p/fhem/code/trunk '$(@D)'
	cp $(@D)/controls.txt $(@D)/fhem/FHEM/
	cp $(@D)/controls_fhem.txt $(@D)/fhem/FHEM/
endef

define FHEM_INSTALL_TARGET_CMDS
    $(INSTALL) -d -m 0750 $(TARGET_DIR)/opt/fhem
    cp -rv  $(@D)/fhem/FHEM  $(TARGET_DIR)/opt/fhem
    $(INSTALL) -D -m 0640 $(@D)/fhem/fhem.cfg $(TARGET_DIR)/opt/fhem
    $(INSTALL) -D -m 0740 $(@D)/fhem/fhem.pl $(TARGET_DIR)/opt/fhem
    cp -rv $(@D)/fhem/webfrontend $(TARGET_DIR)/opt/fhem
    $(INSTALL) -D -m 0640 $(@D)/fhem/configDB.pm $(TARGET_DIR)/opt/fhem
    cp -rv $(@D)/fhem/log $(TARGET_DIR)/opt/fhem
    cp -rv $(@D)/fhem/www $(TARGET_DIR)/opt/fhem
    $(INSTALL) -D -m 0766 $(FHEM_PKGDIR)S70fhem $(TARGET_DIR)/etc/init.d/
endef

define FHEM_USERS
    fhem -1 fhem -1 * /opt/fhem /bin/sh - FHEM User
endef

define FHEM_DEVICES
    #/dev/foo  c  666  0  0  42  0  -  -  -
endef

define FHEM_PERMISSIONS
    /opt/fhem  r  755  fhem  fhem   -  -  -  -  -
endef

$(eval $(generic-package))
