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

# Gnome-Shell
GNOME_SHELL=`command -v gnome-shell`
GNOME_VERSION="`$GNOME_SHELL --version | cut -d' ' -f3 | cut -d'.' -f1-2`"
GNOME_MAJOR_VERSION="`echo $GNOME_VERSION | cut -d'.' -f1`"
GNOME_MINOR_VERSION="`echo $GNOME_VERSION | cut -d'.' -f2`"

if [ -e $GNOME_SHELL ] && [ $GNOME_MAJOR_VERSION -eq "3" ] && \
    [ $GNOME_MINOR_VERSION -ge "18" ]; then

    if [ $GNOME_MINOR_VERSION -gt "24" ]; then
        GNOME_SCSS_VERSION=$GNOME_MAJOR_VERSION.26
    else
        GNOME_SCSS_VERSION=$GNOME_MAJOR_VERSION.24
    fi

    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell.scss \
        ../gnome-shell/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-dark.scss \
        ../gnome-shell-nokto/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-eta.scss \
        ../gnome-shell-eta/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-dark-eta.scss \
        ../gnome-shell-nokto-eta/gnome-shell.css
    if [ $GNOME_MINOR_VERSION -gt "24" ]; then
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3.scss \
            ../gnome-shell/gdm3-Adapta.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-dark.scss \
            ../gnome-shell-nokto/gdm3-Adapta-Nokto.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-eta.scss \
            ../gnome-shell-eta/gdm3-Adapta-Eta.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-dark-eta.scss \
            ../gnome-shell-nokto-eta/gdm3-Adapta-Nokto-Eta.css
    fi
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/stylesheet.scss \
        ../gnome-shell/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/classic.scss \
        ../gnome-shell/extensions/window-list/classic.css
    if [ ! -d ../gnome-shell/extensions/workspaces-to-dock ]; then
        mkdir -p ../gnome-shell/extensions/workspaces-to-dock
    fi
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/workspaces-to-dock.scss \
        ../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css
fi

# Cinnamon
if [ ! -d ../cinnamon ]; then
    mkdir -p ../cinnamon
fi
$SASSC \
    cinnamon/cinnamon.scss ../cinnamon/cinnamon.css

if [ ! -d ../cinnamon-nokto ]; then
    mkdir -p ../cinnamon-nokto
fi
$SASSC \
    cinnamon/cinnamon-dark.scss ../cinnamon-nokto/cinnamon.css

exit 0
