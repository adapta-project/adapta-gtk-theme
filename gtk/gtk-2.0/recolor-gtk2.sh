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

SRC_FILE="colors.rc"
SRC_DARK_FILE="colors-dark.rc"

# Default colours
selection1="`grep 'Cyan500' ../sass/common/_colors.scss | \
		cut -d' ' -f3`"
accent1="`grep 'Teal300' ../sass/common/_colors.scss | \
		cut -d' ' -f3`"

# Check and re-color 'selection-color' and 'accent-color'
if [ -e "../sass/common/_key_colors.scss" ]; then
    selection2="`grep 'key_selection' ../sass/common/_key_colors.scss | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    accent2="`grep 'key_accent' ../sass/common/_key_colors.scss | \
                 cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $SRC_FILE.in $SRC_FILE && cp -f $SRC_DARK_FILE.in $SRC_DARK_FILE

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $SRC_FILE
        echo $selection1 is re-colored with $selection2 in $SRC_FILE.
        sed -i "s/$selection1/$selection2/gi" $SRC_DARK_FILE
        echo $selection1 is re-colored with $selection2 in $SRC_DARK_FILE.
    fi
    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/gi" $SRC_FILE
        echo $accent1 is re-colored with $accent2 in $SRC_FILE.
        sed -i "s/$accent1/$accent2/gi" $SRC_DARK_FILE
        echo $accent1 is re-colored with $accent2 in $SRC_DARK_FILE.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi

exit 0
