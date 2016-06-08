themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

gtk318dir  = $(srcdir)/gtk-3.0
gtk320dir  = $(srcdir)/gtk-3.20

gtk2dir    = $(srcdir)/gtk-2.0

gtknextdir = $(srcdir)/gtk-3.22

index       = $(srcdir)/index.theme
index_nokto = $(srcdir)/index.theme-nokto

install-data-local:
	$(MKDIR_P) $(adaptadir)
	$(MKDIR_P) $(noktodir)

	cp -Rv $(index) $(adaptadir)
	cp -Rv $(index_nokto) $(noktodir)/index.theme

	cp -Rv $(gtk318dir) $(adaptadir)
	cp -Rv $(gtk320dir) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/gtk-3.0 $(noktodir)/gtk-3.0
	ln -sf ../Adapta/gtk-3.20 $(noktodir)/gtk-3.20

	cp -Rv $(gtk2dir) $(adaptadir)
	cp -Rv $(gtk2dir) $(noktodir)
	mv $(noktodir)/gtk-2.0/gtkrc $(noktodir)/gtk-2.0/gtkrc-light
	mv $(noktodir)/gtk-2.0/gtkrc-dark $(noktodir)/gtk-2.0/gtkrc

if ENABLE_GTK_NEXT
	cp -Rv $(gtknextdir) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/gtk-3.22 $(noktodir)/gtk-3.22
endif

uninstall-local:
	test -e $(noktodir)/index.theme && rm -rfv $(noktodir)/index.theme
	test -e $(noktodir)/gtk-3.0 && rm -rfv $(noktodir)/gtk-3.0
	test -e $(noktodir)/gtk-3.20 && rm -rfv $(noktodir)/gtk-3.20
	test -e $(noktodir)/gtk-2.0 && rm -rfv $(noktodir)/gtk-2.0

	test -e $(adaptadir)/index.theme && rm -rfv $(adaptadir)/index.theme
	test -e $(adaptadir)/gtk-3.0 && rm -rfv $(adaptadir)/gtk-3.0
	test -e $(adaptadir)/gtk-3.20 && rm -rfv $(adaptadir)/gtk-3.20
	test -e $(adaptadir)/gtk-2.0 && rm -rfv $(adaptadir)/gtk-2.0

if ENABLE_GTK_NEXT
	test -e $(noktodir)/gtk-3.22 && rm -rfv $(noktodir)/gtk-3.22
	test -e $(adaptadir)/gtk-3.22 && rm -rfv $(adaptadir)/gtk-3.22
endif
