themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

GNOME_DIR          = $(srcdir)/gnome-shell
GNOME_NOKTO_DIR    = $(srcdir)/gnome-shell-nokto
CINNAMON_DIR       = $(srcdir)/cinnamon
CINNAMON_NOKTO_DIR = $(srcdir)/cinnamon-nokto
UNITY_DIR          = $(srcdir)/unity
XFCE_DIR           = $(srcdir)/xfce-notify-4.0

install-data-local:
	cp -Rv $(GNOME_DIR) $(adaptadir)
	cp -Rv $(GNOME_NOKTO_DIR) $(noktodir)/gnome-shell
if ENABLE_CINNAMON
	cp -Rv $(CINNAMON_DIR) $(adaptadir)
	cp -Rv $(CINNAMON_NOKTO_DIR) $(noktodir)/cinnamon
endif

if ENABLE_UNITY
	cp -Rv $(UNITY_DIR) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/unity $(noktodir)/unity
endif

if ENABLE_XFCE
	cp -Rv $(XFCE_DIR) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/xfce-notify-4.0 $(noktodir)/xfce-notify-4.0
endif

uninstall-local:
	test -e $(noktodir)/gnome-shell && rm -rfv $(noktodir)/gnome-shell
	test -e $(adaptadir)/gnome-shell && rm -rfv $(adaptadir)/gnome-shell

if ENABLE_CINNAMON
	test -e $(noktodir)/cinnamon && rm -rfv $(noktodir)/cinnamon
	test -e $(adaptadir)/cinnamon && rm -rfv $(adaptadir)/cinnamon
endif

if ENABLE_UNITY
	test -e $(noktodir)/unity && rm -rfv $(noktodir)/unity
	test -e $(adaptadir)/unity && rm -rfv $(adaptadir)/unity
endif

if ENABLE_XFCE
	test -e $(noktodir)/xfce-notify-4.0 && rm -rfv $(noktodir)/xfce-notify-4.0
	test -e $(adaptadir)/xfce-notify-4.0 && rm -rfv $(adaptadir)/xfce-notify-4.0
endif
