################################################################################
#
# perl-xml-parser
#
################################################################################

PERL_XML_PARSER_VERSION = 2.44
PERL_XML_PARSER_SOURCE = XML-Parser-$(PERL_XML_PARSER_VERSION).tar.gz
PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
PERL_XML_PARSER_DEPENDENCIES = perl-libwww-perl
PERL_XML_PARSER_LICENSE = Artistic or GPLv1+
PERL_XML_PARSER_LICENSE_FILES = README
PERL_XML_PARSER_CONF_OPTS = EXPATLIBPATH=$(STAGING_DIR)/usr/lib EXPATINCPATH=$(STAGING_DIR)/usr/include verbose
PERL_XML_PARSER_CONF_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"


define PERL_XML_PARSER_CONFIGURE_1CMDS
                cd $(PERL_XML_PARSER_SRCDIR)/Expat $(PERL_XML_PARSER_CONF_ENV) \
                PERL_MM_USE_DEFAULT=1 \
                PERL_AUTOINSTALL=--skipdeps \
                $(PERL_RUN) Makefile.PL \
                        AR="$(TARGET_AR)" \
                        FULL_AR="$(TARGET_AR)" \
                        CC="$(TARGET_CC)" \
                        CCFLAGS="$(TARGET_CFLAGS)" \
                        OPTIMIZE=" " \
                        LD="$(TARGET_CC)" \
                        LDDLFLAGS="-shared $(TARGET_LDFLAGS)" \
                        LDFLAGS="$(TARGET_LDFLAGS)" \
                        DESTDIR=$(TARGET_DIR) \
                        INSTALLDIRS=vendor \
                        INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$(PERL_VERSION) \
                        INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$(PERL_VERSION)/$(PERL_ARCHNAME) \
                        INSTALLVENDORBIN=/usr/bin \
                        INSTALLVENDORSCRIPT=/usr/bin \
                        INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
                        INSTALLVENDORMAN3DIR=/usr/share/man/man3 \
                        $(PERL_XML_PARSER_CONF_OPTS)
		false
                cd $(PERL_XML_PARSER_SRCDIR); $(PERL_XML_PARSER_CONF_ENV) \
                PERL_MM_USE_DEFAULT=1 \
                PERL_AUTOINSTALL=--skipdeps \
                $(PERL_RUN) Makefile.PL \
                        AR="$(TARGET_AR)" \
                        FULL_AR="$(TARGET_AR)" \
                        CC="$(TARGET_CC)" \
                        CCFLAGS="$(TARGET_CFLAGS)" \
                        OPTIMIZE=" " \
                        LD="$(TARGET_CC)" \
                        LDDLFLAGS="-shared $(TARGET_LDFLAGS)" \
                        LDFLAGS="$(TARGET_LDFLAGS)" \
                        DESTDIR=$(TARGET_DIR) \
                        INSTALLDIRS=vendor \
                        INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$(PERL_VERSION) \
                        INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$(PERL_VERSION)/$(PERL_ARCHNAME) \
                        INSTALLVENDORBIN=/usr/bin \
                        INSTALLVENDORSCRIPT=/usr/bin \
                        INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
                        INSTALLVENDORMAN3DIR=/usr/share/man/man3 \
                        $(PERL_XML_PARSER_CONF_OPTS)


endef

define PERL_XML_PARSER_FIX_MAKEFILE
	#set
	sed -i -e "s#^CC = .*#CC = $(TARGET_CC)#" "$(PERL_XML_PARSER_SRCDIR)Expat/Makefile"
	#false
endef
PERL_XML_PARSER_POST_CONFIGURE_HOOKS += PERL_XML_PARSER_FIX_MAKEFILE

$(eval $(perl-package))
