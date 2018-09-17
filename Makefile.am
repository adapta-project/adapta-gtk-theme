ACLOCAL_AMFLAGS = -I m4

themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
briladir = $(DESTDIR)$(themedir)/Adapta-Brila
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto
adaptaetadir = $(DESTDIR)$(themedir)/Adapta-Eta
brilaetadir = $(DESTDIR)$(themedir)/Adapta-Brila-Eta
noktoetadir  = $(DESTDIR)$(themedir)/Adapta-Nokto-Eta

SUBDIRS = \
	gtk \
	shell \
	wm \
	extra

EXTRA_DIST = \
	COPYING \
	LICENSE_CC_BY_SA4 \
	README.md

install-data-hook:
	cp -Rv $(EXTRA_DIST) $(adaptadir)

uninstall-hook:
	test -e $(noktodir) && rm -rfv $(noktodir)
	test -e $(briladir) && rm -rfv $(briladir)
	test -e $(adaptadir) && rm -rfv $(adaptadir)
	test -e $(noktetaodir) && rm -rfv $(noktoetadir)
	test -e $(brilaetadir) && rm -rfv $(brilaetadir)
	test -e $(adaptaetadir) && rm -rfv $(adaptaetadir)
