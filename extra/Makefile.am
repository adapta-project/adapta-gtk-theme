themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

chromedir         = $(srcdir)/chrome
chrome_file       = $(chromedir)/adapta-theme.crx
chrome_nokto_file = $(chromedir)/adapta-nokto-theme.crx

plankdir   = $(srcdir)/plank
plank_file = $(plankdir)/dock.theme

# ******************
# * Generate files *
# ******************

all:

# *****************
# * Install files *
# *****************

install-data-local:
if ENABLE_CHROME
	$(MKDIR_P) $(adaptadir)/chrome
	$(MKDIR_P) $(noktodir)/chrome
	cp -Rv $(chrome_file) $(adaptadir)/chrome
	cp -Rv $(chrome_nokto_file) $(noktodir)/chrome
endif

if ENABLE_PLANK
	$(MKDIR_P) $(adaptadir)/plank
	cp -Rv $(plank_file) $(adaptadir)/plank
	cd $(adaptadir)
	ln -sf ../Adapta/plank $(noktodir)/plank
endif

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_CHROME
	test -e $(noktodir)/chrome && rm -rfv $(noktodir)/chrome
	test -e $(adaptadir)/chrome && rm -rfv $(adaptadir)/chrome
endif

if ENABLE_PLANK
	test -e $(noktodir)/plank && rm -rfv $(noktodir)/plank
	test -e $(adaptadir)/plank && rm -rfv $(adaptadir)/plank
endif

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

DISTCLEANFILES = \
	$(CLEANFILES)
