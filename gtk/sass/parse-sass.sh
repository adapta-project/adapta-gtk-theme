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

###############
# Print usage #
###############

# Usage: ./parse-sass.sh [ -a ]
#
# Optional arguments:
#    -a        generates CSSs for all of Gtk+ version

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

# evenize minor version number of gtk+-3.0
major="`pkg-config --modversion gtk+-3.0 | cut -d. -f1`"
minor="`pkg-config --modversion gtk+-3.0 | cut -d. -f2`"
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

PARALLEL="`command -v parallel`"
THREADS="$(($(getconf _NPROCESSORS_ONLN) + 1))"

case "$1" in
    -a)
        if [ -f "$PARALLEL" ]; then
            $PARALLEL --no-notice --line-buffer -j$THREADS \
            bundle exec sass --update --sourcemap=none --watch --style=compact ::: \
		3.18/gtk.scss:../gtk-3.18/gtk.css \
		3.18/gtk-dark.scss:../gtk-3.18/gtk-dark.css \
		3.20/gtk.scss:../gtk-3.20/gtk.css \
		3.20/gtk-dark.scss:../gtk-3.20/gtk-dark.css \
		3.20/gtk-eta.scss:../gtk-3.20-eta/gtk.css \
		3.20/gtk-dark-eta.scss:../gtk-3.20-eta/gtk-dark.css \
		3.22/gtk.scss:../gtk-3.22/gtk.css \
		3.22/gtk-dark.scss:../gtk-3.22/gtk-dark.css \
		3.22/gtk-eta.scss:../gtk-3.22-eta/gtk.css \
		3.22/gtk-dark-eta.scss:../gtk-3.22-eta/gtk-dark.css \
		4.0/gtk.scss:../gtk-4.0/gtk.css \
		4.0/gtk-dark.scss:../gtk-4.0/gtk-dark.css \
		4.0/gtk-eta.scss:../gtk-4.0-eta/gtk.css \
		4.0/gtk-dark-eta.scss:../gtk-4.0-eta/gtk-dark.css
        else
            bundle exec sass --update --sourcemap=none --watch --style=compact \
		3.18/gtk.scss:../gtk-3.18/gtk.css \
		3.18/gtk-dark.scss:../gtk-3.18/gtk-dark.css \
		3.20/gtk.scss:../gtk-3.20/gtk.css \
		3.20/gtk-dark.scss:../gtk-3.20/gtk-dark.css \
		3.20/gtk-eta.scss:../gtk-3.20-eta/gtk.css \
		3.20/gtk-dark-eta.scss:../gtk-3.20-eta/gtk-dark.css \
		3.22/gtk.scss:../gtk-3.22/gtk.css \
		3.22/gtk-dark.scss:../gtk-3.22/gtk-dark.css \
		3.22/gtk-eta.scss:../gtk-3.22-eta/gtk.css \
		3.22/gtk-dark-eta.scss:../gtk-3.22-eta/gtk-dark.css \
		4.0/gtk.scss:../gtk-4.0/gtk.css \
		4.0/gtk-dark.scss:../gtk-4.0/gtk-dark.css \
		4.0/gtk-eta.scss:../gtk-4.0-eta/gtk.css \
		4.0/gtk-dark-eta.scss:../gtk-4.0-eta/gtk-dark.css
        fi
        ;;
    *)
        if [ -f "$PARALLEL" ]; then
            $PARALLEL --no-notice --line-buffer -j$THREADS \
            bundle exec sass --update --sourcemap=none --watch --style=compact ::: \
		"$major"."$css_minor"/gtk.scss:../gtk-"$major"."$css_minor"/gtk.css \
		"$major"."$css_minor"/gtk-dark.scss:../gtk-"$major"."$css_minor"/gtk-dark.css \
		"$major"."$css_minor"/gtk-eta.scss:../gtk-"$major"."$css_minor"-eta/gtk.css \
		"$major"."$css_minor"/gtk-dark-eta.scss:../gtk-"$major"."$css_minor"-eta/gtk-dark.css
        else
            bundle exec sass --update --sourcemap=none --watch --style=compact \
		"$major"."$css_minor"/gtk.scss:../gtk-"$major"."$css_minor"/gtk.css \
		"$major"."$css_minor"/gtk-dark.scss:../gtk-"$major"."$css_minor"/gtk-dark.css \
		"$major"."$css_minor"/gtk-eta.scss:../gtk-"$major"."$css_minor"-eta/gtk.css \
		"$major"."$css_minor"/gtk-dark-eta.scss:../gtk-"$major"."$css_minor"-eta/gtk-dark.css
        fi
        ;;
esac

exit 0
