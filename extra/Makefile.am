themedir     = $(datadir)/themes
adaptadir    = $(DESTDIR)$(themedir)/Adapta
briladir     = $(DESTDIR)$(themedir)/Adapta-Brila
noktodir     = $(DESTDIR)$(themedir)/Adapta-Nokto
adaptaetadir = $(DESTDIR)$(themedir)/Adapta-Eta
brilaetadir  = $(DESTDIR)$(themedir)/Adapta-Brila-Eta
noktoetadir  = $(DESTDIR)$(themedir)/Adapta-Nokto-Eta

plankdir         = $(srcdir)/plank
plank_light_file = $(plankdir)/dock-light.theme
plank_dark_file  = $(plankdir)/dock-dark.theme

telegramdir         = $(srcdir)/telegram
telegram_file       = $(telegramdir)/adapta.tdesktop-theme
telegram_brila_file = $(telegramdir)/adapta-brila.tdesktop-theme
telegram_nokto_file = $(telegramdir)/adapta-nokto.tdesktop-theme

geditdir   = $(srcdir)/gedit
gedit_file = \
	$(geditdir)/adapta.xml \
	$(geditdir)/README.md

tweetdeckdir         = $(srcdir)/tweetdeck
tweetdeck_light_file = $(tweetdeckdir)/light/ColorDeck-adapta.cdk
tweetdeck_dark_file  = $(tweetdeckdir)/dark/ColorDeck-adapta-nokto.cdk

# ******************
# * Generate files *
# ******************

all:
if ENABLE_TWEETDECK
	cd $(tweetdeckdir) && ./recolor-cdk.sh
endif

# *****************
# * Install files *
# *****************

install-data-local:
if ENABLE_PLANK
	$(MKDIR_P) $(adaptadir)/plank
	$(MKDIR_P) $(briladir)/plank
	$(MKDIR_P) $(noktodir)/plank
	$(MKDIR_P) $(adaptaetadir)/plank
	$(MKDIR_P) $(brilaetadir)/plank
	$(MKDIR_P) $(noktoetadir)/plank
	cp -Rv $(plank_dark_file) $(adaptadir)/plank/dock.theme
	cp -Rv $(plank_light_file) $(briladir)/plank/dock.theme
	cp -Rv $(plank_dark_file) $(noktodir)/plank/dock.theme
	cp -Rv $(plank_dark_file) $(adaptaetadir)/plank/dock.theme
	cp -Rv $(plank_light_file) $(brilaetadir)/plank/dock.theme
	cp -Rv $(plank_dark_file) $(noktoetadir)/plank/dock.theme
endif

if ENABLE_TELEGRAM
	$(MKDIR_P) $(adaptadir)/telegram
	$(MKDIR_P) $(briladir)/telegram
	$(MKDIR_P) $(noktodir)/telegram
	cp -Rv $(telegram_file) $(adaptadir)/telegram
	cp -Rv $(telegram_brila_file) $(briladir)/telegram
	cp -Rv $(telegram_nokto_file) $(noktodir)/telegram
endif

if ENABLE_TWEETDECK
	$(MKDIR_P) $(adaptadir)/tweetdeck
	$(MKDIR_P) $(briladir)/tweetdeck
	$(MKDIR_P) $(noktodir)/tweetdeck
	cp -Rv $(tweetdeck_light_file) $(adaptadir)/tweetdeck
	cp -Rv $(tweetdeck_light_file) $(briladir)/tweetdeck
	cp -Rv $(tweetdeck_dark_file) $(noktodir)/tweetdeck
endif

	$(MKDIR_P) $(adaptadir)/gedit
	cp -Rv $(gedit_file) $(adaptadir)/gedit
	cd $(adaptadir)
	ln -sf ../Adapta/gedit $(noktodir)/gedit

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_PLANK
	test -e $(noktodir)/plank && rm -rfv $(noktodir)/plank
	test -e $(briladir)/plank && rm -rfv $(briladir)/plank
	test -e $(adaptadir)/plank && rm -rfv $(adaptadir)/plank
	test -e $(noktoetadir)/plank && rm -rfv $(noktoetadir)/plank
	test -e $(brilaetadir)/plank && rm -rfv $(brilaetadir)/plank
	test -e $(adaptaetadir)/plank && rm -rfv $(adaptaetadir)/plank
endif

if ENABLE_TELEGRAM
	test -e $(noktodir)/telegram && rm -rfv $(noktodir)/telegram
	test -e $(briladir)/telegram && rm -rfv $(briladir)/telegram
	test -e $(adaptadir)/telegram && rm -rfv $(adaptadir)/telegram
endif

if ENABLE_TWEETDECK
	test -e $(noktodir)/tweetdeck && rm -rfv $(noktodir)/tweetdeck
	test -e $(briladir)/tweetdeck && rm -rfv $(briladir)/tweetdeck
	test -e $(adaptadir)/tweetdeck && rm -rfv $(adaptadir)/tweetdeck
endif

	test -e $(noktodir)/gedit && rm -rfv $(noktodir)/gedit
	test -e $(adaptadir)/gedit && rm -rfv $(adaptadir)/gedit

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

if ENABLE_TWEETDECK
CLEANFILES += \
	$(tweetdeckdir)/light/ColorDeck-adapta.cdk \
	$(tweetdeckdir)/dark/ColorDeck-adapta-nokto.cdk
endif

DISTCLEANFILES = \
	$(CLEANFILES)
