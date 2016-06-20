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

SRC_DIR="assets-metacity"
ASSETS_DIR="../metacity-1"
INDEX="assets-metacity.txt"
RECOLOR_FILE="./assets-metacity/button_close_pressed.svg"
KEY_FILE="../../gtk/sass/common/_key_colors.scss"

# Default colours
selection1="`grep 'Cyan500' ../../gtk/sass/common/_colors.scss | \
                   cut -d' ' -f3`"

# Check and re-color 'button_close_pressed' button
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $RECOLOR_FILE.in $RECOLOR_FILE
    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/g" $RECOLOR_FILE
        echo $selection1 is re-colored with $selection2.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi

# Clone stock SVG files
for i in $(<$INDEX)
do
    if [ -f $ASSETS_DIR/$i.svg ] && \
        [ $SRC_DIR/$i.svg -ot $ASSETS_DIR/$i.svg ]; then
        echo $ASSETS_DIR/$i.svg exists.
    elif [ -f $ASSETS_DIR/$i.svg ] && \
        [ $SRC_DIR/$i.svg -nt $ASSETS_DIR/$i.svg ]; then
        echo Re-cloning $ASSETS_DIR/$i.svg
        cp $SRC_DIR/$i.svg $ASSETS_DIR
    else
        echo Cloning $ASSETS_DIR/$i.svg
        cp $SRC_DIR/$i.svg $ASSETS_DIR
    fi
done

exit 0
