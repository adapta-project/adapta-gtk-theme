themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
noktodir  = $(DESTDIR)$(themedir)/Adapta-Nokto

shelldir         = $(srcdir)/gnome-shell
shellnoktodir    = $(srcdir)/gnome-shell-nokto
cinnamondir      = $(srcdir)/cinnamon
cinnamonnoktodir = $(srcdir)/cinnamon-nokto
unitydir         = $(srcdir)/unity
xfcedir          = $(srcdir)/xfce-notify-4.0

install-data-local:
	cp -Rv $(shelldir) $(adaptadir)
	cp -Rv $(shellnoktodir) $(noktodir)/gnome-shell
if ENABLE_CINNAMON
	cp -Rv $(cinnamondir) $(adaptadir)
	cp -Rv $(cinnamonnoktodir) $(noktodir)/cinnamon
endif

if ENABLE_UNITY
	cp -Rv $(unitydir) $(adaptadir)
	cd $(adaptadir)
	ln -sf ../Adapta/unity $(noktodir)/unity
endif

if ENABLE_XFCE
	cp -Rv $(xfcedir) $(adaptadir)
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
