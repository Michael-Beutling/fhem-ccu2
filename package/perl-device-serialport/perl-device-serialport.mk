################################################################################
#
# perl-device-serialport
#
################################################################################

PERL_DEVICE_SERIALPORT_VERSION = 1.04
PERL_DEVICE_SERIALPORT_SOURCE = Device-SerialPort-$(PERL_DEVICE_SERIALPORT_VERSION).tar.gz
PERL_DEVICE_SERIALPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CO/COOK
PERL_DEVICE_SERIALPORT_LICENSE_FILES = README

$(eval $(perl-package))