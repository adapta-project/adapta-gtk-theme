#!/bin/sh

sh -c 'cd ./../gnome-shell && glib-compile-resources \
	gnome-shell-theme.gresource.xml'
sh -c 'cd ./../gnome-shell-nokto && glib-compile-resources \
	gnome-shell-theme.gresource.xml'
