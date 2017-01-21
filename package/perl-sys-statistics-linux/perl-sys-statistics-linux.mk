################################################################################
#
# perl-sys-statistics-linux
#
################################################################################

PERL_SYS_STATISTICS_LINUX_VERSION = 0.66
PERL_SYS_STATISTICS_LINUX_SOURCE = Sys-Statistics-Linux-$(PERL_SYS_STATISTICS_LINUX_VERSION).tar.gz
PERL_SYS_STATISTICS_LINUX_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BL/BLOONIX
PERL_SYS_STATISTICS_LINUX_DEPENDENCIES = host-perl-module-build
PERL_SYS_STATISTICS_LINUX_LICENSE = Artistic or GPLv1+
PERL_SYS_STATISTICS_LINUX_LICENSE_FILES = README

$(eval $(perl-package))
