EXTRA_DIST = \
	cinnamon \
	COPYING \
	gnome-shell \
	gtk-2.0 \
	gtk-3.20 \
	gtk-3.0 \
	index.theme \
	metacity-1 \
	README.md \
	unity

themedir = $(datadir)/themes

install-data-hook:
	$(MKDIR_P) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(EXTRA_DIST) $(DESTDIR)$(themedir)/Adapta

uninstall-hook:
	test -e $(DESTDIR)$(themedir)/Adapta && \
	rm -rfv $(DESTDIR)$(themedir)/Adapta
