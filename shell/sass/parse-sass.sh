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

SASSC="`command -v sassc` -M -t compact"
GNOME_SHELL=`command -v gnome-shell`
GNOME_VERSION="`$GNOME_SHELL --version | cut -d' ' -f3 | cut -d'.' -f1-2`"
GNOME_MINOR_VERSION="`echo $GNOME_VERSION | cut -d'.' -f2`"

if [ $GNOME_MINOR_VERSION -gt "24" ]; then
    # Gnome-Shell 3.25 or higher
    $SASSC \
        gnome-shell/3.26/gnome-shell.scss ../gnome-shell/gnome-shell.css
    $SASSC \
        gnome-shell/3.26/gnome-shell-dark.scss ../gnome-shell-nokto/gnome-shell.css
    $SASSC \
        gnome-shell/3.26/gnome-shell-eta.scss ../gnome-shell-eta/gnome-shell.css
    $SASSC \
        gnome-shell/3.26/gnome-shell-dark-eta.scss ../gnome-shell-nokto-eta/gnome-shell.css
    $SASSC \
        gnome-shell/3.26/pad-osd.scss ../gnome-shell/pad-osd.css
    $SASSC \
        gnome-shell/3.26/stylesheet.scss ../gnome-shell/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/3.26/classic.scss ../gnome-shell/extensions/window-list/classic.css
    $SASSC \
        gnome-shell/3.26/workspaces-to-dock.scss ../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css
else
    # Gnome-Shell 3.24 or lower
    $SASSC \
        gnome-shell/3.24/gnome-shell.scss ../gnome-shell/gnome-shell.css
    $SASSC \
        gnome-shell/3.24/gnome-shell-dark.scss ../gnome-shell-nokto/gnome-shell.css
    $SASSC \
        gnome-shell/3.24/gnome-shell-eta.scss ../gnome-shell-eta/gnome-shell.css
    $SASSC \
        gnome-shell/3.24/gnome-shell-dark-eta.scss ../gnome-shell-nokto-eta/gnome-shell.css
    $SASSC \
        gnome-shell/3.24/pad-osd.scss ../gnome-shell/pad-osd.css
    $SASSC \
        gnome-shell/3.24/stylesheet.scss ../gnome-shell/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/3.24/classic.scss ../gnome-shell/extensions/window-list/classic.css
    $SASSC \
        gnome-shell/3.24/workspaces-to-dock.scss ../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css
fi

# Cinnamon
$SASSC \
    cinnamon/cinnamon.scss ../cinnamon/cinnamon.css
$SASSC \
    cinnamon/cinnamon-dark.scss ../cinnamon-nokto/cinnamon.css

exit 0
