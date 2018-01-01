#!/bin/sh
#
# This file is part of adapta-gtk-theme
#
# Copyright (C) 2016-2018 Tista <tista.gma500@gmail.com>
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
PKG_CONFIG="`command -v pkg-config`"

# Gnome-Shell
GIO_VERSION="`$PKG_CONFIG --modversion glib-2.0`"
GIO_MAJOR_VERSION="`echo $GIO_VERSION | cut -d'.' -f1`"
GIO_MINOR_VERSION="`echo $GIO_VERSION | cut -d'.' -f2`"

if [ $GIO_MAJOR_VERSION -eq "2" ] && [ $GIO_MINOR_VERSION -lt "48" ]; then
    echo Unmet dependency: glib-2.0 >= 2.48.0
    exit 1
else
    if [ $GIO_MINOR_VERSION -ge "53" ]; then
        GNOME_SCSS_VERSION="3.26"
        echo Processing for GNOME '>=' $GNOME_SCSS_VERSION
    else
        GNOME_SCSS_VERSION="3.24"
        echo Processing for GNOME '=<' $GNOME_SCSS_VERSION
    fi

    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell.scss \
        ../gnome-shell/gnome-shell.css
    echo Wrote ../gnome-shell/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-dark.scss \
        ../gnome-shell-nokto/gnome-shell.css
    echo Wrote ../gnome-shell-nokto/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-eta.scss \
        ../gnome-shell-eta/gnome-shell.css
    echo Wrote ../gnome-shell-eta/gnome-shell.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/gnome-shell-dark-eta.scss \
        ../gnome-shell-nokto-eta/gnome-shell.css
    echo Wrote ../gnome-shell-nokto-eta/gnome-shell.css
    if [ $GIO_MINOR_VERSION -ge "53" ]; then
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3.scss \
            ../gnome-shell/gdm3-Adapta.css
        echo Wrote ../gnome-shell/gdm3-Adapta.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-dark.scss \
            ../gnome-shell-nokto/gdm3-Adapta-Nokto.css
        echo Wrote ../gnome-shell-nokto/gdm3-Adapta-Nokto.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-eta.scss \
            ../gnome-shell-eta/gdm3-Adapta-Eta.css
        echo Wrote ../gnome-shell-eta/gdm3-Adapta-Eta.css
        $SASSC \
            gnome-shell/$GNOME_SCSS_VERSION/gdm3-dark-eta.scss \
            ../gnome-shell-nokto-eta/gdm3-Adapta-Nokto-Eta.css
        echo Wrote ../gnome-shell-nokto-eta/gdm3-Adapta-Nokto-Eta.css
    fi
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell/pad-osd.css
    echo Wrote ../gnome-shell/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell-nokto/pad-osd.css
    echo Wrote ../gnome-shell-nokto/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell-eta/pad-osd.css
    echo Wrote ../gnome-shell-eta/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/pad-osd.scss \
        ../gnome-shell-nokto-eta/pad-osd.css
    echo Wrote ../gnome-shell-nokto-eta/pad-osd.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/stylesheet.scss \
        ../gnome-shell/extensions/window-list/stylesheet.css
    echo Wrote ../gnome-shell/extensions/window-list/stylesheet.css
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/classic.scss \
        ../gnome-shell/extensions/window-list/classic.css
    echo Wrote ../gnome-shell/extensions/window-list/classic.css
    if [ ! -d ../gnome-shell/extensions/workspaces-to-dock ]; then
        mkdir -p ../gnome-shell/extensions/workspaces-to-dock
    fi
    $SASSC \
        gnome-shell/$GNOME_SCSS_VERSION/workspaces-to-dock.scss \
        ../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css
    echo Wrote ../gnome-shell/extensions/workspaces-to-dock/workspaces-to-dock.css
fi

# Cinnamon
if [ ! -d ../cinnamon ]; then
    mkdir -p ../cinnamon
fi
echo Processing for CINNAMON
$SASSC \
    cinnamon/cinnamon.scss ../cinnamon/cinnamon.css
echo Wrote ../cinnamon/cinnamon.css

if [ ! -d ../cinnamon-nokto ]; then
    mkdir -p ../cinnamon-nokto
fi
$SASSC \
    cinnamon/cinnamon-dark.scss ../cinnamon-nokto/cinnamon.css
echo Wrote ../cinnamon-nokto/cinnamon.css

exit 0
