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

###############
# Print usage #
###############

# Usage: ./parse-sass.sh [ -a ]
#
# Optional arguments:
#    -a        generates CSSs for all of Gtk+ versioned

usage() {
    sed -rn '/^# Usage/,${/^#/!q;s/^# ?//;p}' "$0"
}

if [ "$1" = '-h' ] || [ "$1" = '--help' ] || [ "$1" = 'help' ]; then
    usage
    exit 1
fi

##########################
# Check Gtk+-3.0 version #
##########################

PKG_CONFIG="`command -v pkg-config`"

# evenize minor version number of gtk+-3.0
major="`$PKG_CONFIG --modversion gtk+-3.0 | cut -d. -f1`"
minor="`$PKG_CONFIG --modversion gtk+-3.0 | cut -d. -f2`"
if [ $(expr "$minor" % 2) -ne 0 ]; then
    css_minor="$(expr $minor + 1)"
else
    css_minor="$minor"
fi

if [ ! -d ./"$major"."$css_minor" ]; then
    echo version "$major"."$minor".x is not supported.
    exit 1
fi

#################
# Generate CSSs #
#################

SASSC="`command -v sassc` -M -t compact"

case "$1" in
    -a)
        if [ ! -d ../gtk-3.20 ]; then
            mkdir -p ../gtk-3.20 ../gtk-3.20-eta
        fi
        $SASSC 3.20/gtk.scss ../gtk-3.20/gtk-contained.css
        $SASSC 3.20/gtk-dark.scss ../gtk-3.20/gtk-contained-dark.css
        $SASSC 3.20/gtk-eta.scss ../gtk-3.20-eta/gtk-contained.css
        $SASSC 3.20/gtk-dark-eta.scss ../gtk-3.20-eta/gtk-contained-dark.css
        if [ ! -d ../gtk-3.20-nokto ]; then
            mkdir -p ../gtk-3.20-nokto ../gtk-3.20-nokto-eta
        fi
        cp -f ../gtk-3.20/gtk-contained-dark.css ../gtk-3.20-nokto/gtk-contained-dark.css
        cp -f ../gtk-3.20-eta/gtk-contained-dark.css ../gtk-3.20-nokto-eta/gtk-contained-dark.css

        if [ ! -d ../gtk-3.22 ]; then
            mkdir -p ../gtk-3.22 ../gtk-3.22-eta
        fi
        $SASSC 3.22/gtk.scss ../gtk-3.22/gtk-contained.css
        $SASSC 3.22/gtk-dark.scss ../gtk-3.22/gtk-contained-dark.css
        $SASSC 3.22/gtk-eta.scss ../gtk-3.22-eta/gtk-contained.css
        $SASSC 3.22/gtk-dark-eta.scss ../gtk-3.22-eta/gtk-contained-dark.css
        if [ ! -d ../gtk-3.22-nokto ]; then
            mkdir -p ../gtk-3.22-nokto ../gtk-3.22-nokto-eta
        fi
        cp -f ../gtk-3.22/gtk-contained-dark.css ../gtk-3.22-nokto/gtk-contained-dark.css
        cp -f ../gtk-3.22-eta/gtk-contained-dark.css ../gtk-3.22-nokto-eta/gtk-contained-dark.css

        if [ ! -d ../gtk-3.24 ]; then
            mkdir -p ../gtk-3.24 ../gtk-3.24-eta
        fi
        $SASSC 3.24/gtk.scss ../gtk-3.24/gtk-contained.css
        $SASSC 3.24/gtk-dark.scss ../gtk-3.24/gtk-contained-dark.css
        $SASSC 3.24/gtk-eta.scss ../gtk-3.24-eta/gtk-contained.css
        $SASSC 3.24/gtk-dark-eta.scss ../gtk-3.24-eta/gtk-contained-dark.css
        if [ ! -d ../gtk-3.24-nokto ]; then
            mkdir -p ../gtk-3.24-nokto ../gtk-3.24-nokto-eta
        fi
        cp -f ../gtk-3.24/gtk-contained-dark.css ../gtk-3.24-nokto/gtk-contained-dark.css
        cp -f ../gtk-3.24-eta/gtk-contained-dark.css ../gtk-3.24-nokto-eta/gtk-contained-dark.css

        if [ ! -d ../gtk-4.0 ]; then
            mkdir -p ../gtk-4.0 ../gtk-4.0-eta
        fi
        $SASSC 4.0/gtk.scss ../gtk-4.0/gtk-contained.css
        $SASSC 4.0/gtk-dark.scss ../gtk-4.0/gtk-contained-dark.css
        $SASSC 4.0/gtk-eta.scss ../gtk-4.0-eta/gtk-contained.css
        $SASSC 4.0/gtk-dark-eta.scss ../gtk-4.0-eta/gtk-contained-dark.css
        if [ ! -d ../gtk-4.0-nokto ]; then
            mkdir -p ../gtk-4.0-nokto ../gtk-4.0-nokto-eta
        fi
        cp -f ../gtk-4.0/gtk-contained-dark.css ../gtk-4.0-nokto/gtk-contained-dark.css
        cp -f ../gtk-4.0-eta/gtk-contained-dark.css ../gtk-4.0-nokto-eta/gtk-contained-dark.css

        if [ ! -d ../xfce-notify-4.0 ]; then
            mkdir -p ../xfce-notify-4.0
        fi
        $SASSC common/xfce-notify-4.0.scss ../xfce-notify-4.0/gtk.css
        ;;
    *)
        if [ ! -d ../gtk-"$major"."$css_minor" ]; then
            mkdir -p ../gtk-"$major"."$css_minor" \
                     ../gtk-"$major"."$css_minor"-eta
        fi

        $SASSC \
            "$major"."$css_minor"/gtk.scss ../gtk-"$major"."$css_minor"/gtk-contained.css
        echo Wrote ../gtk-"$major"."$css_minor"/gtk-contained.css
        $SASSC \
            "$major"."$css_minor"/gtk-dark.scss ../gtk-"$major"."$css_minor"/gtk-contained-dark.css
        echo Wrote ../gtk-"$major"."$css_minor"/gtk-contained-dark.css
        $SASSC \
            "$major"."$css_minor"/gtk-eta.scss ../gtk-"$major"."$css_minor"-eta/gtk-contained.css
        echo Wrote ../gtk-"$major"."$css_minor"-eta/gtk-contained.css
        $SASSC \
            "$major"."$css_minor"/gtk-dark-eta.scss ../gtk-"$major"."$css_minor"-eta/gtk-contained-dark.css
        echo Wrote ../gtk-"$major"."$css_minor"-eta/gtk-contained-dark.css

        if [ ! -d ../gtk-"$major"."$css_minor"-nokto ]; then
            mkdir -p ../gtk-"$major"."$css_minor"-nokto \
                     ../gtk-"$major"."$css_minor"-nokto-eta
        fi
        cp -f ../gtk-"$major"."$css_minor"/gtk-contained-dark.css \
            ../gtk-"$major"."$css_minor"-nokto/gtk-contained-dark.css
        echo Copied ../gtk-"$major"."$css_minor"-nokto/gtk-contained-dark.css
        cp -f ../gtk-"$major"."$css_minor"-eta/gtk-contained-dark.css \
            ../gtk-"$major"."$css_minor"-nokto-eta/gtk-contained-dark.css
        echo Copied ../gtk-"$major"."$css_minor"-nokto-eta/gtk-contained-dark.css
        ;;
esac

exit 0
