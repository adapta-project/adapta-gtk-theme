themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

metacitydir = $(srcdir)/metacity-1
metacity_file = \
	$(metacitydir)/button_close_prelight.svg \
	$(metacitydir)/button_close_pressed.svg \
	$(metacitydir)/button_close.svg \
	$(metacitydir)/button_fill.svg \
	$(metacitydir)/button_maximize_prelight.svg \
	$(metacitydir)/button_maximize_pressed.svg \
	$(metacitydir)/button_maximize.svg \
	$(metacitydir)/button_menu_prelight.svg \
	$(metacitydir)/button_menu_pressed.svg \
	$(metacitydir)/button_menu.svg \
	$(metacitydir)/button_minimize_prelight.svg \
	$(metacitydir)/button_minimize_pressed.svg \
	$(metacitydir)/button_minimize.svg \
	$(metacitydir)/button_shade_prelight.svg \
	$(metacitydir)/button_shade_pressed.svg \
	$(metacitydir)/button_shade.svg \
	$(metacitydir)/button_unshade_prelight.svg \
	$(metacitydir)/button_unshade_pressed.svg \
	$(metacitydir)/button_unshade.svg \
	$(metacitydir)/max_button_close.svg \
	$(metacitydir)/max_button_maximize_prelight.svg \
	$(metacitydir)/max_button_maximize_pressed.svg \
	$(metacitydir)/max_button_maximize.svg \
	$(metacitydir)/max_button_menu_prelight.svg \
	$(metacitydir)/max_button_menu_pressed.svg \
	$(metacitydir)/max_button_menu.svg \
	$(metacitydir)/max_button_minimize_prelight.svg \
	$(metacitydir)/max_button_minimize_pressed.svg \
	$(metacitydir)/max_button_minimize.svg \
	$(metacitydir)/max_button_shade_prelight.svg \
	$(metacitydir)/max_button_shade_pressed.svg \
	$(metacitydir)/max_button_shade.svg \
	$(metacitydir)/max_button_unmaximize_prelight.svg \
	$(metacitydir)/max_button_unmaximize_pressed.svg \
	$(metacitydir)/max_button_unmaximize.svg \
	$(metacitydir)/max_button_unshade_prelight.svg \
	$(metacitydir)/max_button_unshade_pressed.svg \
	$(metacitydir)/max_button_unshade.svg \
	$(metacitydir)/metacity-theme-3.xml

xfwmdir = $(srcdir)/xfwm4
xfwm_file = \
	$(xfwmdir)/close-active.xpm \
	$(xfwmdir)/close-inactive.xpm \
	$(xfwmdir)/close-prelight.xpm \
	$(xfwmdir)/close-pressed.xpm \
	$(xfwmdir)/hide-active.xpm \
	$(xfwmdir)/hide-inactive.xpm \
	$(xfwmdir)/hide-prelight.xpm \
	$(xfwmdir)/hide-pressed.xpm \
	$(xfwmdir)/maximize-active.xpm \
	$(xfwmdir)/maximize-inactive.xpm \
	$(xfwmdir)/maximize-prelight.xpm \
	$(xfwmdir)/maximize-pressed.xpm \
	$(xfwmdir)/menu-active.xpm \
	$(xfwmdir)/menu-inactive.xpm \
	$(xfwmdir)/menu-prelight.xpm \
	$(xfwmdir)/menu-pressed.xpm \
	$(xfwmdir)/shade-active.xpm \
	$(xfwmdir)/shade-inactive.xpm \
	$(xfwmdir)/shade-prelight.xpm \
	$(xfwmdir)/shade-pressed.xpm \
	$(xfwmdir)/stick-active.xpm \
	$(xfwmdir)/stick-inactive.xpm \
	$(xfwmdir)/stick-prelight.xpm \
	$(xfwmdir)/stick-pressed.xpm \
	$(xfwmdir)/themerc \
	$(xfwmdir)/title-1-active-shaded.xpm \
	$(xfwmdir)/title-1-active.xpm \
	$(xfwmdir)/title-1-inactive.xpm \
	$(xfwmdir)/title-2-active.xpm \
	$(xfwmdir)/title-2-inactive.xpm \
	$(xfwmdir)/title-3-active.xpm \
	$(xfwmdir)/title-3-inactive.xpm \
	$(xfwmdir)/title-4-active.xpm \
	$(xfwmdir)/title-4-inactive.xpm \
	$(xfwmdir)/title-5-active.xpm \
	$(xfwmdir)/title-5-inactive.xpm \
	$(xfwmdir)/top-left-active-shaded.xpm \
	$(xfwmdir)/top-left-active.xpm \
	$(xfwmdir)/top-left-inactive.xpm \
	$(xfwmdir)/top-right-active-shaded.xpm \
	$(xfwmdir)/top-right-active.xpm \
	$(xfwmdir)/top-right-inactive.xpm

install-data-local:
if ENABLE_FLASHBACK
	$(MKDIR_P) $(adaptadir)/metacity-1
	cp -Rv $(metacity_file) $(adaptadir)/metacity-1
	cd $(adaptadir)
	ln -sf ../Adapta/metacity-1 $(noktodir)/metacity-1
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
	$(MKDIR_P) $(adaptadir)/metacity-1
	cp -Rv $(metacity_file) $(adaptadir)/metacity-1
	cd $(adaptadir)
	ln -sf ../Adapta/metacity-1 $(noktodir)/metacity-1
endif
endif

if ENABLE_UNITY
if !ENABLE_FLASHBACK
	$(MKDIR_P) $(adaptadir)/metacity-1
	cp -Rv $(metacity_file) $(adaptadir)/metacity-1
	cd $(adaptadir)
	ln -sf ../Adapta/metacity-1 $(noktodir)/metacity-1
endif
endif

if ENABLE_XFCE
	$(MKDIR_P) $(adaptadir)/xfwm4
	cp -Rv $(xfwm_file) $(adaptadir)/xfwm4
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
