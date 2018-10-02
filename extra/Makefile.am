themedir     = $(datadir)/themes
adaptadir    = $(DESTDIR)$(themedir)/Adapta
noktodir     = $(DESTDIR)$(themedir)/Adapta-Nokto
adaptaetadir = $(DESTDIR)$(themedir)/Adapta-Eta
noktoetadir  = $(DESTDIR)$(themedir)/Adapta-Nokto-Eta

chromedir         = $(srcdir)/chrome
chrome_file       = $(chromedir)/adapta-theme.crx
chrome_nokto_file = $(chromedir)/adapta-nokto-theme.crx

plankdir   = $(srcdir)/plank
plank_file = $(plankdir)/dock.theme

telegramdir         = $(srcdir)/telegram
telegram_file       = $(telegramdir)/adapta.tdesktop-theme
telegram_nokto_file = $(telegramdir)/adapta-nokto.tdesktop-theme

geditdir   = $(srcdir)/gedit
gedit_file = \
	$(geditdir)/adapta.xml \
	$(geditdir)/README.md

tweetdeckdir         = $(srcdir)/tweetdeck
tweetdeck_file       = $(tweetdeckdir)/light/ColorDeck-adapta.cdk
tweetdeck_nokto_file = $(tweetdeckdir)/dark/ColorDeck-adapta-nokto.cdk

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
if ENABLE_CHROME_LEGACY
	$(MKDIR_P) $(adaptadir)/chrome
	$(MKDIR_P) $(noktodir)/chrome
	cp -Rv $(chrome_file) $(adaptadir)/chrome
	cp -Rv $(chrome_nokto_file) $(noktodir)/chrome

	cd $(adaptadir)
	ln -sf ../Adapta/chrome $(adaptaetadir)/chrome
	ln -sf ../Adapta-Nokto/chrome $(noktoetadir)/chrome
endif

if ENABLE_PLANK
	$(MKDIR_P) $(adaptadir)/plank
	cp -Rv $(plank_file) $(adaptadir)/plank
	cd $(adaptadir)
	ln -sf ../Adapta/plank $(noktodir)/plank
	ln -sf ../Adapta/plank $(adaptaetadir)/plank
	ln -sf ../Adapta/plank $(noktoetadir)/plank
endif

if ENABLE_TELEGRAM
	$(MKDIR_P) $(adaptadir)/telegram
	$(MKDIR_P) $(noktodir)/telegram
	cp -Rv $(telegram_file) $(adaptadir)/telegram
	cp -Rv $(telegram_nokto_file) $(noktodir)/telegram

	cd $(adaptadir)
	ln -sf ../Adapta/telegram $(adaptaetadir)/telegram
	ln -sf ../Adapta-Nokto/telegram $(noktoetadir)/telegram
endif

if ENABLE_TWEETDECK
	$(MKDIR_P) $(adaptadir)/tweetdeck
	$(MKDIR_P) $(noktodir)/tweetdeck
	cp -Rv $(tweetdeck_file) $(adaptadir)/tweetdeck
	cp -Rv $(tweetdeck_nokto_file) $(noktodir)/tweetdeck
	cd $(adaptadir)
	ln -sf ../Adapta/tweetdeck $(adaptaetadir)/tweetdeck
	ln -sf ../Adapta-Nokto/tweetdeck $(noktoetadir)/tweetdeck
endif

	$(MKDIR_P) $(adaptadir)/gedit
	cp -Rv $(gedit_file) $(adaptadir)/gedit
	cd $(adaptadir)
	ln -sf ../Adapta/gedit $(noktodir)/gedit

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_CHROME_LEGACY
	test -e $(noktodir)/chrome && rm -rfv $(noktodir)/chrome
	test -e $(adaptadir)/chrome && rm -rfv $(adaptadir)/chrome
	test -e $(noktoetadir)/chrome && rm -rfv $(noktoetadir)/chrome
	test -e $(adaptaetadir)/chrome && rm -rfv $(adaptaetadir)/chrome
endif

if ENABLE_PLANK
	test -e $(noktodir)/plank && rm -rfv $(noktodir)/plank
	test -e $(adaptadir)/plank && rm -rfv $(adaptadir)/plank
	test -e $(noktoetadir)/plank && rm -rfv $(noktoetadir)/plank
	test -e $(adaptaetadir)/plank && rm -rfv $(adaptaetadir)/plank
endif

if ENABLE_TELEGRAM
	test -e $(noktodir)/telegram && rm -rfv $(noktodir)/telegram
	test -e $(adaptadir)/telegram && rm -rfv $(adaptadir)/telegram
	test -e $(noktoetadir)/telegram && rm -rfv $(noktoetadir)/telegram
	test -e $(adaptaetadir)/telegram && rm -rfv $(adaptaetadir)/telegram
endif

if ENABLE_TWEETDECK
	test -e $(noktodir)/tweetdeck && rm -rfv $(noktodir)/tweetdeck
	test -e $(adaptadir)/tweetdeck && rm -rfv $(adaptadir)/tweetdeck
	test -e $(noktoetadir)/tweetdeck && rm -rfv $(noktoetadir)/tweetdeck
	test -e $(adaptaetadir)/tweetdeck && rm -rfv $(adaptaetadir)/tweetdeck
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
