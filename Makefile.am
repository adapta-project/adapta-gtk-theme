EXTRA_DIST = \
	COPYING \
	gnome-shell \
	gtk-2.0 \
	gtk-3.20 \
	gtk-3.0 \
	README.md

INDEX        = index.theme
INDEX_NOKTO  = index.theme-nokto
GTK_NEXT_DIR = gtk-3.22
CINNAMON_DIR = cinnamon
METACITY_DIR = metacity-1
UNITY_DIR    = unity
XFCE_DIR     = xfwm4 \
               xfce-notify-4.0
CHROME_DIR   = chrome

themedir = $(datadir)/themes

install-data-hook:
	$(MKDIR_P) $(DESTDIR)$(themedir)/Adapta
	$(MKDIR_P) $(DESTDIR)$(themedir)/Adapta-Nokto
	cp -Rv $(EXTRA_DIST) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(EXTRA_DIST) $(DESTDIR)$(themedir)/Adapta-Nokto
	cp -Rv $(INDEX) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(INDEX_NOKTO) $(DESTDIR)$(themedir)/Adapta-Nokto/index.theme
	mv $(DESTDIR)$(themedir)/Adapta-Nokto/gtk-2.0/gtkrc \
		$(DESTDIR)$(themedir)/Adapta-Nokto/gtk-2.0/gtkrc-light
	mv $(DESTDIR)$(themedir)/Adapta-Nokto/gtk-2.0/gtkrc-dark \
		$(DESTDIR)$(themedir)/Adapta-Nokto/gtk-2.0/gtkrc

if ENABLE_GTK_NEXT
	cp -Rv $(GTK_NEXT_DIR) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(GTK_NEXT_DIR) $(DESTDIR)$(themedir)/Adapta-Nokto
endif

if ENABLE_CINNAMON
	cp -Rv $(CINNAMON_DIR) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(CINNAMON_DIR) $(DESTDIR)$(themedir)/Adapta-Nokto
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta-Nokto
endif
endif

if ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta-Nokto
endif

if ENABLE_UNITY
	cp -Rv $(UNITY_DIR) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(UNITY_DIR) $(DESTDIR)$(themedir)/Adapta-Nokto
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(METACITY_DIR) $(DESTDIR)$(themedir)/Adapta-Nokto
endif
endif

if ENABLE_XFCE
	cp -Rv $(XFCE_DIR) $(DESTDIR)$(themedir)/Adapta
	cp -Rv $(XFCE_DIR) $(DESTDIR)$(themedir)/Adapta-Nokto
endif

if ENABLE_CHROME
	$(MKDIR_P) $(DESTDIR)$(themedir)/Adapta/chrome
	$(MKDIR_P) $(DESTDIR)$(themedir)/Adapta-Nokto/chrome
	cp -Rv $(CHROME_DIR)/adapta-theme \
		$(DESTDIR)$(themedir)/Adapta/chrome
	cp -Rv $(CHROME_DIR)/adapta-theme.crx \
		$(DESTDIR)$(themedir)/Adapta/chrome
	cp -Rv $(CHROME_DIR)/adapta-nokto-theme \
		$(DESTDIR)$(themedir)/Adapta-Nokto/chrome
	cp -Rv $(CHROME_DIR)/adapta-nokto-theme.crx \
		$(DESTDIR)$(themedir)/Adapta-Nokto/chrome
endif

uninstall-hook:
	test -e $(DESTDIR)$(themedir)/Adapta && \
	rm -rfv $(DESTDIR)$(themedir)/Adapta
	test -e $(DESTDIR)$(themedir)/Adapta-Nokto && \
	rm -rfv $(DESTDIR)$(themedir)/Adapta-Nokto
