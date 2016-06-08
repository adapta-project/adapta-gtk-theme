themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

chromedir = $(srcdir)/chrome
plankdir  = $(srcdir)/plank

install-data-local:
if ENABLE_CHROME
	$(MKDIR_P) $(adaptadir)/chrome
	$(MKDIR_P) $(noktodir)/chrome
	cp -Rv $(chromedir)/adapta-theme.crx $(adaptadir)/chrome
	cp -Rv $(chromedir)/adapta-nokto-theme.crx $(noktodir)/chrome
endif

if ENABLE_PLANK
	cp -Rv $(plankdir) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/plank $(noktodir)/plank
endif

uninstall-local:
if ENABLE_CHROME
	test -e $(noktodir)/chrome && rm -rfv $(noktodir)/chrome
	test -e $(adaptadir)/chrome && rm -rfv $(adaptadir)/chrome
endif

if ENABLE_PLANK
	test -e $(noktodir)/plank && rm -rfv $(noktodir)/plank
	test -e $(adaptadir)/plank && rm -rfv $(adaptadir)/plank
endif
