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

SRC_DIR="assets-xfce"
ASSETS_DIR="../xfce-notify-4.0"
INDEX="assets-xfce.txt"
RECOLOR_FILE1="./assets-xfce/flat-button-active.svg"
RECOLOR_FILE2="./assets-xfce/flat-button-hover.svg"
KEY_FILE="../../gtk/sass/common/_key_colors.scss"

# Default colours
accent1="`grep 'Teal300' ../../gtk/sass/common/_colors.scss | \
                cut -d' ' -f3`"

# Check and re-color 'flat-button-active' and 'flat-button-hover' file
if [ -e $KEY_FILE ]; then
    accent2="`grep 'key_accent' $KEY_FILE | \
              cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $RECOLOR_FILE1.in $RECOLOR_FILE1
    cp -f $RECOLOR_FILE2.in $RECOLOR_FILE2

    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/gi" $RECOLOR_FILE1
        sed -i "s/$accent1/$accent2/gi" $RECOLOR_FILE2
        echo $accent1 is re-colored with $accent2.
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
    else
        echo Cloning $ASSETS_DIR/$i.svg
        cp $SRC_DIR/$i.svg $ASSETS_DIR
    fi
done

exit 0
