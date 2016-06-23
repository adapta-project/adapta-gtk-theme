#! /bin/bash
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

INKSCAPE="/usr/bin/inkscape"

SRC_DIR="assets-xfwm"
ASSETS_DIR="../xfwm4"
INDEX="assets-xfwm.txt"
RECOLOR_FILE1="./assets-xfwm/close-pressed.svg"
RECOLOR_FILE2="./assets-xfwm/menu-pressed.svg"
RECOLOR_FILE3="./assets-xfwm/close-prelight.svg"
KEY_FILE="../../gtk/sass/common/_key_colors.scss"

# Default colours
selection1="`grep 'Cyan500' ../../gtk/sass/common/_colors.scss | \
                   cut -d' ' -f3`"
destruction1="`grep 'RedA200' ../../gtk/sass/common/_colors.scss | \
                     cut -d' ' -f3`"

# Renderer
render-non-scale() {
    $INKSCAPE --export-png=$ASSETS_DIR/$i.png $SRC_DIR/$i.svg >/dev/null #\
}

# Check and re-color 'close-pressed' and 'menu-pressed' button
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    destruction2="`grep 'key_destruction' $KEY_FILE | \
                   cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $RECOLOR_FILE1.in $RECOLOR_FILE1
    cp -f $RECOLOR_FILE2.in $RECOLOR_FILE2
    cp -f $RECOLOR_FILE3.in $RECOLOR_FILE3

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/g" $RECOLOR_FILE1
        sed -i "s/$selection1/$selection2/g" $RECOLOR_FILE2
        echo $selection1 is re-colored with $selection2.
    fi

    if [ $destruction1 != $destruction2 ]; then
        sed -i "s/$destruction1/$destruction2/g" $RECOLOR_FILE3
        echo $destruction1 is re-colored with $destruction2.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi

# Generate PNG files
for i in $(<$INDEX)
do 
    if [ -f $ASSETS_DIR/$i.png ] && \
        [ $SRC_DIR/$i.svg -ot $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f $ASSETS_DIR/$i.png ] && \
        [ $SRC_DIR/$i.svg -nt $ASSETS_DIR/$i.png ]; then
        echo Re-rendering $ASSETS_DIR/$i.png
        rm -f $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering $ASSETS_DIR/$i.png
        render-non-scale
    fi
done

exit 0
