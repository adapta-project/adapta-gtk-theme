ACLOCAL_AMFLAGS = -I m4

themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Pop
noktodir  = $(DESTDIR)$(themedir)/Pop-Nokto
adaptaetadir = $(DESTDIR)$(themedir)/Pop-Eta
noktoetadir  = $(DESTDIR)$(themedir)/Pop-Nokto-Eta

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
	test -e $(adaptadir) && rm -rfv $(adaptadir)
	test -e $(noktetaodir) && rm -rfv $(noktoetadir)
	test -e $(adaptaetadir) && rm -rfv $(adaptaetadir)
