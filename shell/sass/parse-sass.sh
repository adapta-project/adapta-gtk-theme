#!/bin/sh

# Gnome-Shell
bundle exec sass --update --sourcemap=none --watch \
	gnome-shell/gnome-shell.scss:../gnome-shell/gnome-shell.css
bundle exec sass --update --sourcemap=none --watch \
	gnome-shell/gnome-shell-dark.scss:../gnome-shell-nokto/gnome-shell.css

# Gnome-Shell-Extensions
bundle exec sass --update --sourcemap=none --watch \
	gnome-shell/stylesheet.scss:../gnome-shell/extensions/window-list/stylesheet.css
bundle exec sass --update --sourcemap=none --watch \
	gnome-shell/classic.scss:../gnome-shell/extensions/window-list/classic.css
bundle exec sass --update --sourcemap=none --watch \
	gnome-shell/workspaces-to-dock.scss:../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css
