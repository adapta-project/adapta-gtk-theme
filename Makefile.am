EXTRA_DIST = \
	cinnamon \
	COPYING \
	gnome-shell \
	gtk-2.0 \
	gtk-3.20 \
	gtk-3.18 \
	index.theme \
	metacity-1 \
	README.md \
	unity

themedir = $(datadir)/themes

install-data-hook:
	$(MKDIR_P) $(DESTDIR)/usr/share/themes/Adapta
	cp -Rv $(EXTRA_DIST) $(DESTDIR)/usr/share/themes/Adapta

uninstall-hook:
	test -e $(DESTDIR)/usr/share/themes/Adapta && rm -rfv $(DESTDIR)/usr/share/themes/Adapta
