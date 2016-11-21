################################################################################
#
# perl-rpc-xml
#
################################################################################

PERL_RPC_XML_VERSION = 0.80
PERL_RPC_XML_SOURCE = RPC-XML-$(PERL_RPC_XML_VERSION).tar.gz
PERL_RPC_XML_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJRAY
PERL_RPC_XML_DEPENDENCIES = perl-xml-parser perl-libwww-perl
PERL_RPC_XML_LICENSE = Artistic or GPLv1+
PERL_RPC_XML_LICENSE_FILES = README

$(eval $(perl-package))
