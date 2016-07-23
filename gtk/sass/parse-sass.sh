#!/bin/sh
#
# This file is part of adapta-gtk-theme
#
# Copyright (C) 2016 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

# Gtk+ 3.18.x, Gtk+ 3.20.x, Gtk+ 3.22.x
bundle exec sass --update --sourcemap=none --watch \
	3.18/gtk.scss:../gtk-3.18/gtk.css \
	3.18/gtk-dark.scss:../gtk-3.18/gtk-dark.css \
	3.20/gtk.scss:../gtk-3.20/gtk.css \
	3.20/gtk-dark.scss:../gtk-3.20/gtk-dark.css \
	3.22/gtk.scss:../gtk-3.22/gtk.css \
	3.22/gtk-dark.scss:../gtk-3.22/gtk-dark.css
