#!/bin/sh

# Gtk+ 3.18.x
bundle exec sass --update --sourcemap=none --watch \
	3.18/gtk.scss:../gtk-3.18/gtk.css
bundle exec sass --update --sourcemap=none --watch \
	3.18/gtk-dark.scss:../gtk-3.18/gtk-dark.css

# Gtk+ 3.20.x
bundle exec sass --update --sourcemap=none --watch \
	3.20/gtk.scss:../gtk-3.20/gtk.css
bundle exec sass --update --sourcemap=none --watch \
	3.20/gtk-dark.scss:../gtk-3.20/gtk-dark.css

# Gtk+ 3.22.x
bundle exec sass --update --sourcemap=none --watch \
	3.22/gtk.scss:../gtk-3.22/gtk.css
bundle exec sass --update --sourcemap=none --watch \
	3.22/gtk-dark.scss:../gtk-3.22/gtk-dark.css
