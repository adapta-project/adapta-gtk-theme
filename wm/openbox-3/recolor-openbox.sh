#! /bin/bash
#
# This file is part of adapta-gtk-theme
#
# Copyright (C) 2018 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

SRC_DIR="."
RECOLOR_FILE1="themerc"
RECOLOR_FILE2="themerc-brila"
RECOLOR_FILE3="themerc-nokto"
COL_FILE="../../gtk/sass/common/_colors.scss"
KEY_FILE="../../gtk/sass/common/resources/_key_colors.scss"

# Default colours
accent1="`grep 'Indigo300' $COL_FILE | cut -d' ' -f3`"

# Check and re-color 'close-pressed' and 'menu-pressed' button
if [ -e $KEY_FILE ]; then
    accent2="`grep 'key_accent' $KEY_FILE | cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $SRC_DIR/$RECOLOR_FILE1.in $SRC_DIR/$RECOLOR_FILE1 && \
    cp -f $SRC_DIR/$RECOLOR_FILE2.in $SRC_DIR/$RECOLOR_FILE2 && \
    cp -f $SRC_DIR/$RECOLOR_FILE3.in $SRC_DIR/$RECOLOR_FILE3

    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$selection2/gi" $SRC_DIR/$RECOLOR_FILE1
        sed -i "s/$accent1/$selection2/gi" $SRC_DIR/$RECOLOR_FILE2
        sed -i "s/$accent1/$selection2/gi" $SRC_DIR/$RECOLOR_FILE3
        echo $selection1 is re-colored with $selection2.
    fi
else
    echo ../../gtk/sass/common/resources/_key_colors.scss was not found. Stopped...
    exit 1
fi
