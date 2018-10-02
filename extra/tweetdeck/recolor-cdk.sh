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

SRC_LIGHT_FILE="./light/ColorDeck-adapta.cdk"
SRC_DARK_FILE="./dark/ColorDeck-adapta-nokto.cdk"
COL_FILE="../../gtk/sass/common/_colors.scss"
KEY_FILE="../../gtk/sass/common/_key_colors.scss"

# Default colours
accent1="`grep 'Teal300' $COL_FILE | \
                cut -d' ' -f3`"
suggested1="`grep 'Teal500' $COL_FILE | \
                cut -d' ' -f3`"

# Check and re-color color-scheme
if [ -e $KEY_FILE ]; then
    accent2="`grep 'key_accent' $KEY_FILE | \
              cut -d' ' -f2 | cut -d';' -f1`"
    suggested2="`grep 'key_suggestion' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $SRC_LIGHT_FILE.in $SRC_LIGHT_FILE && \
    cp -f $SRC_DARK_FILE.in $SRC_DARK_FILE && sleep 1

    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/gi" $SRC_LIGHT_FILE
        sed -i "s/$accent1/$accent2/gi" $SRC_DARK_FILE
        echo $accent1 is re-colored with $accent2.
    fi
    if [ $suggested1 != $suggested2 ]; then
        sed -i "s/$suggested1/$suggested2/gi" $SRC_LIGHT_FILE
        sed -i "s/$suggested1/$suggested2/gi" $SRC_DARK_FILE
        echo $suggested1 is re-colored with $suggested2.
    fi
else
    echo ../../gtk/sass/common/_key_colors.scss was not found. Stopped...
    exit 1
fi
