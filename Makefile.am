EXTRA_DIST = \
	COPYING \
	gnome-shell \
	gtk-2.0 \
	gtk-3.20 \
	gtk-3.0 \
	index.theme \
	README.md

CINNAMON_DIR = cinnamon
METACITY_DIR = metacity-1
UNITY_DIR    = unity

themedir = $(datadir)/themes

install-data-hook:
	$(MKDIR_P) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(EXTRA_DIST) $(DESTDIR)$(themedir)/Adapta

if ENABLE_CINNAMON
	cp -Rv $(CINNAMON_DIR) $(DESTDIR)$(themedir)/Adapta
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta
endif
endif

if ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta
endif

if ENABLE_UNITY
	cp -Rv $(UNITY_DIR) $(DESTDIR)$(themedir)/Adapta
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta
endif
endif

uninstall-hook:
	test -e $(DESTDIR)$(themedir)/Adapta && \
	rm -rfv $(DESTDIR)$(themedir)/Adapta
