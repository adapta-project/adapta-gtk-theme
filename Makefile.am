EXTRA_DIST = \
	COPYING \
	gnome-shell \
	gtk-3.0 \
	gtk-3.20 \
	README.md

INDEX              = index.theme
INDEX_NOKTO        = index.theme-nokto
GTK_NEXT_DIR       = gtk-3.22
GTK_2_DIR          = gtk-2.0
CINNAMON_DIR       = cinnamon
CINNAMON_NOKTO_DIR = cinnamon-nokto
METACITY_DIR       = metacity-1
UNITY_DIR          = unity
XFCE_DIR           = xfwm4 \
                     xfce-notify-4.0
CHROME_DIR         = chrome

themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

install-data-hook:
	$(MKDIR_P) $(adaptadir)
	$(MKDIR_P) $(noktodir)

	cp -Rv $(EXTRA_DIST) $(adaptadir)

	ln -sf $(adaptadir)/gnome-shell $(noktodir)/gnome-shell
	ln -sf $(adaptadir)/gtk-3.0 $(noktodir)/gtk-3.0
	ln -sf $(adaptadir)/gtk-3.20 $(noktodir)/gtk-3.20

	cp -Rv $(GTK_2_DIR) $(adaptadir)
	cp -Rv $(GTK_2_DIR) $(noktodir)
	mv $(noktodir)/gtk-2.0/gtkrc $(noktodir)/gtk-2.0/gtkrc-light
	mv $(noktodir)/gtk-2.0/gtkrc-dark $(noktodir)/gtk-2.0/gtkrc

	cp -Rv $(INDEX) $(adaptadir)
	cp -Rv $(INDEX_NOKTO) $(noktodir)/index.theme

if ENABLE_GTK_NEXT
	cp -Rv $(GTK_NEXT_DIR) $(adaptadir)
	ln -sf $(adaptadir)/$(GTK_NEXT_DIR) $(noktodir)/$(GTK_NEXT_DIR)
endif

if ENABLE_CINNAMON
	cp -Rv $(CINNAMON_DIR) $(adaptadir)
	cp -Rv $(CINNAMON_NOKTO_DIR) $(noktodir)/$(CINNAMON_DIR)
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	ln -sf $(adaptadir)/$(METACITY_DIR) $(noktodir)/$(METACITY_DIR)
endif
endif

if ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	ln -sf $(adaptadir)/$(METACITY_DIR) $(noktodir)/$(METACITY_DIR)
endif

if ENABLE_UNITY
	cp -Rv $(UNITY_DIR) $(adaptadir)
	ln -sf $(adaptadir)/$(UNITY_DIR) $(noktodir)/$(UNITY_DIR)
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	ln -sf $(adaptadir)/$(METACITY_DIR) $(noktodir)/$(METACITY_DIR)
endif
endif

if ENABLE_XFCE
	cp -Rv $(XFCE_DIR) $(adaptadir)
	ln -sf $(adaptadir)/xfwm4 $(noktodir)/xfwm4
	ln -sf $(adaptadir)/xfce-notify-4.0 $(noktodir)/xfce-notify-4.0
endif

if ENABLE_CHROME
	$(MKDIR_P) $(adaptadir)/chrome
	$(MKDIR_P) $(noktodir)/chrome
	cp -Rv $(CHROME_DIR)/adapta-theme $(adaptadir)/chrome
	cp -Rv $(CHROME_DIR)/adapta-theme.crx $(adaptadir)/chrome
	cp -Rv $(CHROME_DIR)/adapta-nokto-theme $(noktodir)/chrome
	cp -Rv $(CHROME_DIR)/adapta-nokto-theme.crx $(noktodir)/chrome
endif

uninstall-hook:
	test -e $(adaptadir) && rm -rfv $(adaptadir)
	test -e $(noktodir) && rm -rfv $(noktodir)
