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

###############
# Print usage #
###############

# Usage: ./compile-gresource.sh GTK_VERSION
#
# Example:
#   ./compile-gresource.sh 3.22
#
#   compile gtk.gresouce for Gtk+ version 3.22

usage() {
    sed -rn '/^# Usage/,${/^#/!q;s/^# ?//;p}' "$0"
}

#############
# Compiling #
#############

xml="gtk.gresource.xml"

case "$1" in
    3.18)
        cp "$xml".in ../gtk-"$1"/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"/"$xml"
        cd ../gtk-"$1" && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1" \
                                             ../gtk-"$1"/"$xml"
        echo '@import url("resource:///org/adapta-project/gtk-'$1'/gtk-contained.css");' \
            > ../gtk-"$1"/gtk.css
        echo '@import url("resource:///org/adapta-project/gtk-'$1'/gtk-contained-dark.css");' \
            > ../gtk-"$1"/gtk-dark.css

        rm -f ../gtk-"$1"/"$xml"
        rm -rf ../gtk-"$1"/assets
        ;;
    3.20|3.22|4.0)
        cp "$xml".in ../gtk-"$1"/"$xml"
        cp "$xml".in ../gtk-"$1"-eta/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"/"$xml"
        sed -i "s|@VERSION[@]|$1-eta|g" ../gtk-"$1"-eta/"$xml"
        cd ../gtk-"$1" && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        cd ../gtk-"$1"-eta && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1" \
                                             ../gtk-"$1"/"$xml"
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-eta \
                                             ../gtk-"$1"-eta/"$xml"
        echo '@import url("resource:///org/adapta-project/gtk-'$1'/gtk-contained.css");' \
            > ../gtk-"$1"/gtk.css
        echo '@import url("resource:///org/adapta-project/gtk-'$1'/gtk-contained-dark.css");' \
            > ../gtk-"$1"/gtk-dark.css
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-eta/gtk-contained.css");' \
            > ../gtk-"$1"-eta/gtk.css
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-eta/gtk-contained-dark.css");' \
            > ../gtk-"$1"-eta/gtk-dark.css

        rm -f ../gtk-"$1"/"$xml"
        rm -f ../gtk-"$1"-eta/"$xml"
        rm -rf ../gtk-"$1"/assets
        rm -rf ../gtk-"$1"-eta/assets
        ;;
    *)
        usage && exit 1
        ;;
esac

exit 0
