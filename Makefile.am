EXTRA_DIST = \
	COPYING \
	gtk-3.0 \
	gtk-3.20 \
	LICENSE_CC_BY_SA3 \
	README.md

INDEX              = index.theme
INDEX_NOKTO        = index.theme-nokto
GTK_NEXT_DIR       = gtk-3.22
GTK_2_DIR          = gtk-2.0
GNOME_DIR          = gnome-shell
GNOME_NOKTO_DIR    = gnome-shell-nokto
CINNAMON_DIR       = cinnamon
CINNAMON_NOKTO_DIR = cinnamon-nokto
METACITY_DIR       = metacity-1
UNITY_DIR          = unity
XFWM_DIR           = xfwm4
XFCE_DIR           = xfce-notify-4.0
CHROME_DIR         = chrome
PLANK_DIR          = plank

themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

install-data-hook:
	$(MKDIR_P) $(adaptadir)
	$(MKDIR_P) $(noktodir)

	cp -Rv $(EXTRA_DIST) $(adaptadir)
	cp -Rv $(GNOME_DIR) $(adaptadir)
	cp -Rv $(GNOME_NOKTO_DIR) $(noktodir)/$(GNOME_DIR)

	cd $(adaptadir)
	ln -sf ../Adapta/gtk-3.0 $(noktodir)/gtk-3.0
	ln -sf ../Adapta/gtk-3.20 $(noktodir)/gtk-3.20

	cp -Rv $(GTK_2_DIR) $(adaptadir)
	cp -Rv $(GTK_2_DIR) $(noktodir)
	mv $(noktodir)/$(GTK_2_DIR)/gtkrc $(noktodir)/$(GTK_2_DIR)/gtkrc-light
	mv $(noktodir)/$(GTK_2_DIR)/gtkrc-dark $(noktodir)/$(GTK_2_DIR)/gtkrc

	cp -Rv $(INDEX) $(adaptadir)
	cp -Rv $(INDEX_NOKTO) $(noktodir)/index.theme

if ENABLE_GTK_NEXT
	cp -Rv $(GTK_NEXT_DIR) $(adaptadir)
	ln -sf ../Adapta/$(GTK_NEXT_DIR) $(noktodir)/$(GTK_NEXT_DIR)
endif

if ENABLE_CINNAMON
	cp -Rv $(CINNAMON_DIR) $(adaptadir)
	cp -Rv $(CINNAMON_NOKTO_DIR) $(noktodir)/$(CINNAMON_DIR)
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	ln -sf ../Adapta/$(METACITY_DIR) $(noktodir)/$(METACITY_DIR)
endif
endif

if ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	ln -sf ../Adapta/$(METACITY_DIR) $(noktodir)/$(METACITY_DIR)
endif

if ENABLE_UNITY
	cp -Rv $(UNITY_DIR) $(adaptadir)
	ln -sf ../Adapta/$(UNITY_DIR) $(noktodir)/$(UNITY_DIR)
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	ln -sf ../Adapta/$(METACITY_DIR) $(noktodir)/$(METACITY_DIR)
endif
endif

if ENABLE_XFCE
	$(MKDIR_P) $(adaptadir)/$(XFWM_DIR)
	cp -Rv $(XFWM_DIR)/*.xpm $(adaptadir)/$(XFWM_DIR)
	cp -Rv $(XFWM_DIR)/themerc $(adaptadir)/$(XFWM_DIR)
	cp -Rv $(XFCE_DIR) $(adaptadir)
	ln -sf ../Adapta/$(XFWM_DIR) $(noktodir)/$(XFWM_DIR)
	ln -sf ../Adapta/$(XFCE_DIR) $(noktodir)/$(XFCE_DIR)
endif

if ENABLE_CHROME
	$(MKDIR_P) $(adaptadir)/$(CHROME_DIR)
	$(MKDIR_P) $(noktodir)/$(CHROME_DIR)
	cp -Rv $(CHROME_DIR)/adapta-theme.crx $(adaptadir)/$(CHROME_DIR)
	cp -Rv $(CHROME_DIR)/adapta-nokto-theme.crx $(noktodir)/$(CHROME_DIR)
endif

if ENABLE_PLANK
	cp -Rv $(PLANK_DIR) $(adaptadir)
	ln -sf ../Adapta/$(PLANK_DIR) $(noktodir)/$(PLANK_DIR)
endif

uninstall-hook:
	test -e $(adaptadir) && rm -rfv $(adaptadir)
	test -e $(noktodir) && rm -rfv $(noktodir)
