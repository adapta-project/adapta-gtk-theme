themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

METACITY_DIR = $(srcdir)/metacity-1
XFWM_DIR     = $(srcdir)/xfwm4

install-data-local:
if ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/metacity-1 $(noktodir)/metacity-1
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/metacity-1 $(noktodir)/metacity-1
endif
endif

if ENABLE_UNITY
if !ENABLE_FLASHBACK
	cp -Rv $(METACITY_DIR) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/metacity-1 $(noktodir)/metacity-1
endif
endif

if ENABLE_XFCE
	$(MKDIR_P) $(adaptadir)/xfwm4
	cp -Rv $(XFWM_DIR)/*.xpm $(adaptadir)/xfwm4
	cp -Rv $(XFWM_DIR)/themerc $(adaptadir)/xfwm4
	cd $(adaptadir)
	ln -sf ../Adapta/xfwm4 $(noktodir)/xfwm4
endif

uninstall-local:
if ENABLE_FLASHBACK
	test -e $(noktodir)/metacity-1 && rm -rfv $(noktodir)/metacity-1
	test -e $(adaptadir)/metacity-1 && rm -rfv $(adaptadir)/metacity-1
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
	test -e $(noktodir)/metacity-1 && rm -rfv $(noktodir)/metacity-1
	test -e $(adaptadir)/metacity-1 && rm -rfv $(adaptadir)/metacity-1
endif
endif

if ENABLE_UNITY
if !ENABLE_FLASHBACK
	test -e $(noktodir)/metacity-1 && rm -rfv $(noktodir)/metacity-1
	test -e $(adaptadir)/metacity-1 && rm -rfv $(adaptadir)/metacity-1
endif
endif

if ENABLE_XFCE
	test -e $(noktodir)/xfwm4 && rm -rfv $(noktodir)/xfwm4
	test -e $(adaptadir)/xfwm4 && rm -rfv $(adaptadir)/xfwm4
endif
