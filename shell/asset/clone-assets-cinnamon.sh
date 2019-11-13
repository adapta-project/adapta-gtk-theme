#! /bin/bash
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

SRC_DIR="assets-cinnamon"
ASSETS_DIR="../cinnamon/assets"
ASSETS_DARK_DIR="../cinnamon-nokto/assets"
INDEX="assets-cinnamon.txt"
KEY_FILE="../../gtk/sass/common/_key_colors.scss"

Recolor(){
    if [ "$1" != "$2" ]; then
        sed -i "s/$1/$2/gi" "$SRC_DIR/$3"
        echo "$3 is re-colored with $2."
    fi
}

Cloning(){ echo "Cloning $2"; cp "$1" "$2"; }
Exists(){ echo "$1 exists."; }

# Default colours
while read -a LINE; do
    case "${LINE[*]}" in
        *Cyan500*) selection1="${LINE[2]}" ;;
        *Teal300*) accent1="${LINE[2]}" ;;
        *RedA200*) destruction1="${LINE[2]}" ;;
    esac
done < ../../gtk/sass/common/_colors.scss

# Check and re-color SVG files
if [ -f "$KEY_FILE" ]; then
    while read -a LINE; do
        case "${LINE[*]}" in
              *key_selection*) selection2=${LINE[1]%;} ;;
                 *key_accent*) accent2=${LINE[1]%;} ;;
            *key_destruction*) destruction2=${LINE[1]%;} ;;
        esac
    done < "$KEY_FILE"

    Clone

    IFS=$'\n'
    for i in $(<"$INDEX"); do
        s="${i%% *}" # source
        r="${i#* }" # recolor flag

        if [ "$r" = "r1" ]; then
            cp -f "$SRC_DIR/$s.in" "$SRC_DIR/$s"
            Recolor "$selection1" "$selection2" "$s"
        elif [ "$r" = "r2" ]; then
            cp -f "$SRC_DIR/$s.in" "$SRC_DIR/$s"
            Recolor "$accent1" "$accent2" "$s"
        elif [ "$r" = "r3" ]; then
            cp -f "$SRC_DIR/$s.in" "$SRC_DIR/$s"
            Recolor "$destruction1" "$destruction2" "$s"
        fi
    done
    unset IFS
else
    echo "_key_colors.scss was not found. Stopped..." >&2
    exit 1
fi

# Clone stock SVG files
IFS=$'\n'

for i in $(<"$INDEX"); do
    s="${i%% *}.svg"                        # source
    f="$(cut -d'/' -f3 <<< "${i%% *}"`.svg  # file name
    v="${i:0:1}"                            # variant type
    d="${i#?*/}"                            # target directory

    if [ "$v" = "c" ]; then # 'commmon'
        if [ -f "$ASSETS_DIR/$d/$f" ] && \
            [ "$SRC_DIR/$s" -ot "$ASSETS_DIR/$d/$f" ]; then
            Exists "$ASSETS_DIR/$d/$f"
            Exists "$ASSETS_DARK_DIR/$d/$f"
        else
            Cloning "$SRC_DIR/$s" "$ASSETS_DIR/$d/$f"
            Cloning "$SRC_DIR/$s" "$ASSETS_DARK_DIR/$d/$f"
        fi
    elif [ "$v" = "l" ]; then # 'light'
        if [ -f "$ASSETS_DIR/$d/$f" ]\
        && [ "$SRC_DIR/$s" -ot "$ASSETS_DIR/$d/$f" ]; then
            Exists "$ASSETS_DIR/$d/$f"
        else
            Cloning "$SRC_DIR/$s" "$ASSETS_DIR/$d/$f"
        fi
    else # 'dark'
        if [ -f "$ASSETS_DARK_DIR/$d/$f" ]\
        && [ "$SRC_DIR/$s" -ot "$ASSETS_DARK_DIR/$d/$f" ]; then
            Exists "$ASSETS_DARK_DIR/$d/$f"
        else
            Cloning "$SRC_DIR/$s" "$ASSETS_DARK_DIR/$d/$f"
        fi
    fi
done
unset IFS

exit 0
