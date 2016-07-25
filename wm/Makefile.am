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
	$(xfwmdir)/close-active.png \
	$(xfwmdir)/close-inactive.png \
	$(xfwmdir)/close-prelight.png \
	$(xfwmdir)/close-pressed.png \
	$(xfwmdir)/hide-active.png \
	$(xfwmdir)/hide-inactive.png \
	$(xfwmdir)/hide-prelight.png \
	$(xfwmdir)/hide-pressed.png \
	$(xfwmdir)/maximize-active.png \
	$(xfwmdir)/maximize-inactive.png \
	$(xfwmdir)/maximize-prelight.png \
	$(xfwmdir)/maximize-pressed.png \
	$(xfwmdir)/menu-active.png \
	$(xfwmdir)/menu-inactive.png \
	$(xfwmdir)/menu-prelight.png \
	$(xfwmdir)/menu-pressed.png \
	$(xfwmdir)/shade-active.png \
	$(xfwmdir)/shade-inactive.png \
	$(xfwmdir)/shade-prelight.png \
	$(xfwmdir)/shade-pressed.png \
	$(xfwmdir)/stick-active.png \
	$(xfwmdir)/stick-inactive.png \
	$(xfwmdir)/stick-prelight.png \
	$(xfwmdir)/stick-pressed.png \
	$(xfwmdir)/themerc \
	$(xfwmdir)/title-1-active-shaded.png \
	$(xfwmdir)/title-1-active.png \
	$(xfwmdir)/title-1-inactive.png \
	$(xfwmdir)/title-2-active.png \
	$(xfwmdir)/title-2-inactive.png \
	$(xfwmdir)/title-3-active.png \
	$(xfwmdir)/title-3-inactive.png \
	$(xfwmdir)/title-4-active.png \
	$(xfwmdir)/title-4-inactive.png \
	$(xfwmdir)/title-5-active.png \
	$(xfwmdir)/title-5-inactive.png \
	$(xfwmdir)/top-left-active-shaded.png \
	$(xfwmdir)/top-left-active.png \
	$(xfwmdir)/top-left-inactive.png \
	$(xfwmdir)/top-right-active-shaded.png \
	$(xfwmdir)/top-right-active.png \
	$(xfwmdir)/top-right-inactive.png

# *******************************************
# * Generate PNG images and clone SVG files *
# *******************************************

all:
if ENABLE_FLASHBACK
	cd $(srcdir)/asset/assets-metacity-scripts && \
	./clone-assets-metacity.sh
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
	cd $(srcdir)/asset/assets-metacity-scripts && \
	./clone-assets-metacity.sh
endif
endif

if ENABLE_UNITY
if !ENABLE_FLASHBACK
	cd $(srcdir)/asset/assets-metacity-scripts && \
	./clone-assets-metacity.sh
endif
endif

if ENABLE_XFCE
if ENABLE_PARALLEL
	cd $(srcdir)/asset/assets-xfwm-scripts && \
		./recolor-assets-xfwm.sh
	cd $(srcdir)/asset/assets-xfwm-scripts && \
	$(PARALLEL) --no-notice --line-buffer -j0 bash ::: \
		render-assets-xfwm-button.sh \
		render-assets-xfwm-edge.sh \
		render-assets-xfwm-title.sh
else
	cd $(srcdir)/asset/assets-xfwm-scripts && \
		./render-assets-xfwm.sh
endif
endif

# *****************
# * Install files *
# *****************

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

# *******************
# * Uninstall files *
# *******************

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

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

if ENABLE_FLASHBACK
CLEANFILES += \
	$(metacitydir)/*.svg \
	$(srcdir)/asset/assets-metacity/button_close_pressed.svg \
	$(srcdir)/asset/assets-metacity/button_close_prelight.svg
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
CLEANFILES += \
	$(metacitydir)/*.svg \
	$(srcdir)/asset/assets-metacity/button_close_pressed.svg \
	$(srcdir)/asset/assets-metacity/button_close_prelight.svg
endif
endif

if ENABLE_UNITY
if !ENABLE_FLASHBACK
CLEANFILES += \
	$(metacitydir)/*.svg \
	$(srcdir)/asset/assets-metacity/button_close_pressed.svg \
	$(srcdir)/asset/assets-metacity/button_close_prelight.svg
endif
endif

if ENABLE_XFCE
CLEANFILES += \
	$(xfwmdir)/*.png \
	$(srcdir)/asset/assets-xfwm/close-pressed.svg \
	$(srcdir)/asset/assets-xfwm/close-prelight.svg \
	$(srcdir)/asset/assets-xfwm/menu-pressed.svg
endif

DISTCLEANFILES = \
	$(CLEANFILES)
