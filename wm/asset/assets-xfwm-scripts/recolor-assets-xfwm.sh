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

SRC_DIR="../assets-xfwm"
RECOLOR_FILE1="./../assets-xfwm/close-pressed.svg"
RECOLOR_FILE2="./../assets-xfwm/close-prelight.svg"
COL_FILE="../../../gtk/sass/common/_colors.scss"
KEY_FILE="../../../gtk/sass/common/_key_colors.scss"

# Default colours
selection1="`grep 'Cyan500' $COL_FILE | \
                   cut -d' ' -f3`"
destruction1="`grep 'RedA200' $COL_FILE | \
                     cut -d' ' -f3`"

# Check and re-color 'close-pressed' and 'menu-pressed' button
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    destruction2="`grep 'key_destruction' $KEY_FILE | \
                   cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $RECOLOR_FILE1.in $RECOLOR_FILE1
    cp -f $RECOLOR_FILE2.in $RECOLOR_FILE2

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $RECOLOR_FILE1
        echo $selection1 is re-colored with $selection2.
    fi

    if [ $destruction1 != $destruction2 ]; then
        sed -i "s/$destruction1/$destruction2/gi" $RECOLOR_FILE2
        echo $destruction1 is re-colored with $destruction2.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi
