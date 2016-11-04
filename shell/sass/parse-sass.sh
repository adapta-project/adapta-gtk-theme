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

# Gnome-Shell
bundle exec sass --update --sourcemap=none --watch --style=compact \
	gnome-shell/gnome-shell.scss:../gnome-shell/gnome-shell.css \
	gnome-shell/gnome-shell-dark.scss:../gnome-shell-nokto/gnome-shell.css \
	gnome-shell/gnome-shell-eta.scss:../gnome-shell-eta/gnome-shell.css \
	gnome-shell/gnome-shell-dark-eta.scss:../gnome-shell-nokto-eta/gnome-shell.css \
	gnome-shell/stylesheet.scss:../gnome-shell/extensions/window-list/stylesheet.css \
	gnome-shell/classic.scss:../gnome-shell/extensions/window-list/classic.css \
	gnome-shell/workspaces-to-dock.scss:../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css

# Cinnamon
bundle exec sass --update --sourcemap=none --watch --style=compact \
	cinnamon/cinnamon.scss:../cinnamon/cinnamon.css \
	cinnamon/cinnamon-dark.scss:../cinnamon-nokto/cinnamon.css
