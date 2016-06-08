themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

GTK_318_DIR  = $(srcdir)/gtk-3.0
GTK_320_DIR  = $(srcdir)/gtk-3.20

GTK_2_DIR    = $(srcdir)/gtk-2.0

GTK_NEXT_DIR = $(srcdir)/gtk-3.22

INDEX       = $(srcdir)/index.theme
INDEX_NOKTO = $(srcdir)/index.theme-nokto

install-data-local:
	$(MKDIR_P) $(adaptadir)
	$(MKDIR_P) $(noktodir)

	cp -Rv $(INDEX) $(adaptadir)
	cp -Rv $(INDEX_NOKTO) $(noktodir)/index.theme

	cp -Rv $(GTK_318_DIR) $(adaptadir)
	cp -Rv $(GTK_320_DIR) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/gtk-3.0 $(noktodir)/gtk-3.0
	ln -sf ../Adapta/gtk-3.20 $(noktodir)/gtk-3.20

	cp -Rv $(GTK_2_DIR) $(adaptadir)
	cp -Rv $(GTK_2_DIR) $(noktodir)
	mv $(noktodir)/gtk-2.0/gtkrc $(noktodir)/gtk-2.0/gtkrc-light
	mv $(noktodir)/gtk-2.0/gtkrc-dark $(noktodir)/gtk-2.0/gtkrc

if ENABLE_GTK_NEXT
	cp -Rv $(GTK_NEXT_DIR) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/gtk-3.22 $(noktodir)/gtk-3.22
endif
