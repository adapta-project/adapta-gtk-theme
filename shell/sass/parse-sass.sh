#!/bin/sh
#
# This file is part of adapta-gtk-theme
#
# Copyright (C) 2016-2017 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

#################
# Generate CSSs #
#################

# Gnome-Shell
sassc -t compact \
    gnome-shell/gnome-shell.scss ../gnome-shell/gnome-shell.css
sassc -t compact \
    gnome-shell/gnome-shell-dark.scss ../gnome-shell-nokto/gnome-shell.css
sassc -t compact \
    gnome-shell/gnome-shell-eta.scss ../gnome-shell-eta/gnome-shell.css
sassc -t compact \
    gnome-shell/gnome-shell-dark-eta.scss ../gnome-shell-nokto-eta/gnome-shell.css
sassc -t compact \
    gnome-shell/pad-osd.scss ../gnome-shell/pad-osd.css
sassc -t compact \
    gnome-shell/stylesheet.scss ../gnome-shell/extensions/window-list/stylesheet.css
sassc -t compact \
    gnome-shell/classic.scss ../gnome-shell/extensions/window-list/classic.css
sassc -t compact \
    gnome-shell/workspaces-to-dock.scss ../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css

# Cinnamon
sassc -t compact \
    cinnamon/cinnamon.scss ../cinnamon/cinnamon.css
sassc -t compact \
    cinnamon/cinnamon-dark.scss ../cinnamon-nokto/cinnamon.css

exit 0
