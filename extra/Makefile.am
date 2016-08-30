themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto
adaptaetadir = $(DESTDIR)$(themedir)/Adapta-Eta
noktoetadir  = $(DESTDIR)$(themedir)/Adapta-Nokto-Eta

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

	cd $(adaptadir)
	ln -sf ../Adapta/chrome $(adaptaetadir)/chrome
	ln -sf ../Adapta-Nokto/chrome $(noktoetadir)/chrome
endif

if ENABLE_PLANK
	$(MKDIR_P) $(adaptadir)/plank
	cp -Rv $(plank_file) $(adaptadir)/plank
	cd $(adaptadir)
	ln -sf ../Adapta/plank $(noktodir)/plank
	ln -sf ../Adapta/plank $(adaptaetadir)/plank
	ln -sf ../Adapta/plank $(noktoetadir)/plank
endif

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_CHROME
	test -e $(noktodir)/chrome && rm -rfv $(noktodir)/chrome
	test -e $(adaptadir)/chrome && rm -rfv $(adaptadir)/chrome
	test -e $(noktoetadir)/chrome && rm -rfv $(noktoetadir)/chrome
	test -e $(adaptaetadir)/chrome && rm -rfv $(adaptaetadir)/chrome
endif

if ENABLE_PLANK
	test -e $(noktodir)/plank && rm -rfv $(noktodir)/plank
	test -e $(adaptadir)/plank && rm -rfv $(adaptadir)/plank
	test -e $(noktoetadir)/plank && rm -rfv $(noktoetadir)/plank
	test -e $(adaptaetadir)/plank && rm -rfv $(adaptaetadir)/plank
endif

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

DISTCLEANFILES = \
	$(CLEANFILES)
