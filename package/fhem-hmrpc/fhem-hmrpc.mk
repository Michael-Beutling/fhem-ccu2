################################################################################
#
# FHEM-HMRPC
#
################################################################################

FHEM_HMRPC_VERSION = master
FHEM_HMRPC_SITE_METHOD = git
FHEM_HMRPC_SITE = https://github.com/henryk/fhem-HMRPC.git
FHEM_HMRPC_LICENSE = GPLv3+
FHEM_HMRPC_LICENSE_FILES = LICENSE
FHEM_HMRPC_DEPENDENCIES = fhem

define FHEM_HMRPC_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0740 $(@D)/FHEM/60_HMRPC.pm $(TARGET_DIR)/opt/fhem/FHEM
    $(INSTALL) -D -m 0740 $(@D)/FHEM/61_HMDEV.pm $(TARGET_DIR)/opt/fhem/FHEM
    $(INSTALL) -D -m 0640 $(@D)/controls_HMRPC.txt $(TARGET_DIR)/opt/fhem/FHEM
endef

$(eval $(generic-package))
