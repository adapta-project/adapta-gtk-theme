themedir     = $(datadir)/themes
adaptadir    = $(DESTDIR)$(themedir)/Adapta
noktodir     = $(DESTDIR)$(themedir)/Adapta-Nokto
adaptaetadir = $(DESTDIR)$(themedir)/Adapta-Eta
noktoetadir  = $(DESTDIR)$(themedir)/Adapta-Nokto-Eta

metacitydir   = $(srcdir)/metacity-1
metacity_file = \
	$(metacitydir)/button_close_prelight.svg \
	$(metacitydir)/button_close_pressed.svg \
	$(metacitydir)/button_close.svg \
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
	$(metacitydir)/max_button_unmaximize_prelight.svg \
	$(metacitydir)/max_button_unmaximize_pressed.svg \
	$(metacitydir)/max_button_unmaximize.svg \
	$(metacitydir)/thumbnail.png \
	$(metacitydir)/metacity-theme-2.xml \
	$(metacitydir)/metacity-theme-3.xml

xfwmdir   = $(srcdir)/xfwm4
xfwm_file = \
	$(xfwmdir)/bottom-active.png \
	$(xfwmdir)/bottom-inactive.png \
	$(xfwmdir)/bottom-left-active.png \
	$(xfwmdir)/bottom-left-inactive.png \
	$(xfwmdir)/bottom-right-active.png \
	$(xfwmdir)/bottom-right-inactive.png \
	$(xfwmdir)/close-active.png \
	$(xfwmdir)/close-inactive.png \
	$(xfwmdir)/close-prelight.png \
	$(xfwmdir)/close-pressed.png \
	$(xfwmdir)/hide-active.png \
	$(xfwmdir)/hide-inactive.png \
	$(xfwmdir)/hide-prelight.png \
	$(xfwmdir)/hide-pressed.png \
	$(xfwmdir)/left-active.png \
	$(xfwmdir)/left-inactive.png \
	$(xfwmdir)/maximize-active.png \
	$(xfwmdir)/maximize-inactive.png \
	$(xfwmdir)/maximize-prelight.png \
	$(xfwmdir)/maximize-pressed.png \
	$(xfwmdir)/maximize-toggled-active.png \
	$(xfwmdir)/maximize-toggled-inactive.png \
	$(xfwmdir)/maximize-toggled-prelight.png \
	$(xfwmdir)/maximize-toggled-pressed.png \
	$(xfwmdir)/menu-active.png \
	$(xfwmdir)/menu-inactive.png \
	$(xfwmdir)/menu-prelight.png \
	$(xfwmdir)/menu-pressed.png \
	$(xfwmdir)/right-active.png \
	$(xfwmdir)/right-inactive.png \
	$(xfwmdir)/shade-active.png \
	$(xfwmdir)/shade-inactive.png \
	$(xfwmdir)/shade-prelight.png \
	$(xfwmdir)/shade-pressed.png \
	$(xfwmdir)/shade-toggled-active.png \
	$(xfwmdir)/shade-toggled-inactive.png \
	$(xfwmdir)/shade-toggled-prelight.png \
	$(xfwmdir)/shade-toggled-pressed.png \
	$(xfwmdir)/stick-active.png \
	$(xfwmdir)/stick-inactive.png \
	$(xfwmdir)/stick-prelight.png \
	$(xfwmdir)/stick-pressed.png \
	$(xfwmdir)/stick-toggled-active.png \
	$(xfwmdir)/stick-toggled-inactive.png \
	$(xfwmdir)/stick-toggled-prelight.png \
	$(xfwmdir)/stick-toggled-pressed.png \
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

openboxdir   = $(srcdir)/openbox-3
openbox_file = \
	$(openboxdir)/close.xbm \
	$(openboxdir)/desk_toggled.xbm \
	$(openboxdir)/desk.xbm \
	$(openboxdir)/iconify.xbm \
	$(openboxdir)/max_toggled.xbm \
	$(openboxdir)/max.xbm \
	$(openboxdir)/shade_toggled.xbm \
	$(openboxdir)/shade.xbm
openbox_rc_file = \
	$(openboxdir)/themerc
openbox_rc_nokto_file = \
	$(openboxdir)/themerc-nokto
openbox_compton_file = \
	$(openboxdir)/compton.conf

parallel_option = --null --no-notice --line-buffer --jobs 100%

# ***************************************************
# * Generate PNG images and clone SVG and XBM files *
# ***************************************************

# ignore -jN option for --enable-parallel
.NOTPARALLEL:

all:
if ENABLE_FLASHBACK
	cd $(srcdir)/asset/assets-metacity-scripts && \
	./clone-assets-metacity.sh && \
	./render-assets-metacity.sh
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
	cd $(srcdir)/asset/assets-metacity-scripts && \
	./clone-assets-metacity.sh && \
	./render-assets-metacity.sh
endif
endif

if ENABLE_MATE
if !ENABLE_FLASHBACK
	cd $(srcdir)/asset/assets-metacity-scripts && \
	./clone-assets-metacity.sh && \
	./render-assets-metacity.sh
endif
endif

if ENABLE_XFCE
if ENABLE_PARALLEL
	cd $(srcdir)/asset/assets-xfwm-scripts && \
		./recolor-assets-xfwm.sh
	cd $(srcdir)/asset/assets-xfwm-scripts && \
	$(PARALLEL) $(parallel_option) ./render-assets-xfwm.sh ::: \
		button1 \
		button2 \
		edge \
		title
else
	cd $(srcdir)/asset/assets-xfwm-scripts && \
		./recolor-assets-xfwm.sh && \
		./render-assets-xfwm.sh all
endif
endif

if ENABLE_OPENBOX
	cd $(srcdir)/asset/assets-openbox-scripts && \
		./clone-assets-openbox.sh
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
	ln -sf ../Adapta/metacity-1 $(adaptaetadir)/metacity-1
	ln -sf ../Adapta/metacity-1 $(noktoetadir)/metacity-1
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
	$(MKDIR_P) $(adaptadir)/metacity-1
	cp -Rv $(metacity_file) $(adaptadir)/metacity-1
	cd $(adaptadir)
	ln -sf ../Adapta/metacity-1 $(noktodir)/metacity-1
	ln -sf ../Adapta/metacity-1 $(adaptaetadir)/metacity-1
	ln -sf ../Adapta/metacity-1 $(noktoetadir)/metacity-1
endif
endif

if ENABLE_MATE
if !ENABLE_FLASHBACK
	$(MKDIR_P) $(adaptadir)/metacity-1
	cp -Rv $(metacity_file) $(adaptadir)/metacity-1
	cd $(adaptadir)
	ln -sf ../Adapta/metacity-1 $(noktodir)/metacity-1
	ln -sf ../Adapta/metacity-1 $(adaptaetadir)/metacity-1
	ln -sf ../Adapta/metacity-1 $(noktoetadir)/metacity-1
endif
endif

if ENABLE_XFCE
	$(MKDIR_P) $(adaptadir)/xfwm4
	cp -Rv $(xfwm_file) $(adaptadir)/xfwm4
	cd $(adaptadir)
	ln -sf ../Adapta/xfwm4 $(noktodir)/xfwm4
endif

if ENABLE_OPENBOX
	$(MKDIR_P) $(adaptadir)/openbox-3
	$(MKDIR_P) $(noktodir)/openbox-3
	cp -Rv $(openbox_file) $(adaptadir)/openbox-3
	cp -Rv $(openbox_rc_file) $(adaptadir)/openbox-3/themerc
	cp -Rv $(openbox_compton_file) $(adaptadir)/openbox-3/
	cp -Rv $(openbox_file) $(noktodir)/openbox-3
	cp -Rv $(openbox_rc_nokto_file) $(noktodir)/openbox-3/themerc
endif

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_FLASHBACK
	test -e $(noktodir)/metacity-1 && rm -rfv $(noktodir)/metacity-1
	test -e $(adaptadir)/metacity-1 && rm -rfv $(adaptadir)/metacity-1
	test -e $(noktoetadir)/metacity-1 && rm -rfv $(noktoetadir)/metacity-1
	test -e $(adaptaetadir)/metacity-1 && rm -rfv $(adaptaetadir)/metacity-1
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
	test -e $(noktodir)/metacity-1 && rm -rfv $(noktodir)/metacity-1
	test -e $(adaptadir)/metacity-1 && rm -rfv $(adaptadir)/metacity-1
	test -e $(noktoetadir)/metacity-1 && rm -rfv $(noktoetadir)/metacity-1
	test -e $(adaptaetadir)/metacity-1 && rm -rfv $(adaptaetadir)/metacity-1
endif
endif

if ENABLE_MATE
if !ENABLE_FLASHBACK
	test -e $(noktodir)/metacity-1 && rm -rfv $(noktodir)/metacity-1
	test -e $(adaptadir)/metacity-1 && rm -rfv $(adaptadir)/metacity-1
	test -e $(noktoetadir)/metacity-1 && rm -rfv $(noktoetadir)/metacity-1
	test -e $(adaptaetadir)/metacity-1 && rm -rfv $(adaptaetadir)/metacity-1
endif
endif

if ENABLE_XFCE
	test -e $(noktodir)/xfwm4 && rm -rfv $(noktodir)/xfwm4
	test -e $(adaptadir)/xfwm4 && rm -rfv $(adaptadir)/xfwm4
endif

if ENABLE_OPENBOX
	test -e $(noktodir)/openbox-3 && rm -rfv $(noktodir)/openbox-3
	test -e $(adaptadir)/openbox-3 && rm -rfv $(adaptadir)/openbox-3
endif

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

if ENABLE_FLASHBACK
CLEANFILES += \
	$(metacitydir)/*.svg \
	$(metacitydir)/*.png \
	$(srcdir)/asset/assets-metacity/button_close_pressed.svg \
	$(srcdir)/asset/assets-metacity/button_close_prelight.svg \
	$(srcdir)/asset/inkscape.log
endif

if ENABLE_CINNAMON
if !ENABLE_FLASHBACK
CLEANFILES += \
	$(metacitydir)/*.svg \
	$(metacitydir)/*.png \
	$(srcdir)/asset/assets-metacity/button_close_pressed.svg \
	$(srcdir)/asset/assets-metacity/button_close_prelight.svg \
	$(srcdir)/asset/inkscape.log
endif
endif

if ENABLE_MATE
if !ENABLE_FLASHBACK
CLEANFILES += \
	$(metacitydir)/*.svg \
	$(metacitydir)/*.png \
	$(srcdir)/asset/assets-metacity/button_close_pressed.svg \
	$(srcdir)/asset/assets-metacity/button_close_prelight.svg \
	$(srcdir)/asset/inkscape.log
endif
endif

if ENABLE_XFCE
CLEANFILES += \
	$(xfwmdir)/*.png \
	$(srcdir)/asset/assets-xfwm/close-pressed.svg \
	$(srcdir)/asset/assets-xfwm/close-prelight.svg \
	$(srcdir)/asset/inkscape.log
endif

if ENABLE_OPENBOX
CLEANFILES += \
	$(openboxdir)/*.xbm
endif

DISTCLEANFILES = \
	$(CLEANFILES)
