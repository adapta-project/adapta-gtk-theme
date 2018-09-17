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

RC_FILE="gtkrc"
RC_DARK_FILE="gtkrc-light"
RC_LIGHT_FILE="gtkrc-dark"

# Default colours
selection1="`grep 'Indigo500' ../sass/common/_colors.scss | \
		cut -d' ' -f3`"
accent1="`grep 'Indigo300' ../sass/common/_colors.scss | \
		cut -d' ' -f3`"

# Set variant specific names
cp -f $RC_FILE.in $RC_FILE && cp -f $RC_DARK_FILE.in $RC_DARK_FILE \
    && cp -f $RC_LIGHT_FILE.in $RC_LIGHT_FILE

sed -i "s|@VARIANT[@]||g" "$RC_FILE"
sed -i "s|@VARIANT[@]||g" "$RC_DARK_FILE"
sed -i "s|@VARIANT[@]||g" "$RC_LIGHT_FILE"

cp -f $RC_FILE.in $RC_FILE-eta && cp -f $RC_DARK_FILE.in $RC_DARK_FILE-eta \
    && cp -f $RC_LIGHT_FILE.in $RC_LIGHT_FILE-eta

sed -i "s|@VARIANT[@]|-eta|g" "$RC_FILE"-eta
sed -i "s|@VARIANT[@]|-eta|g" "$RC_DARK_FILE"-eta
sed -i "s|@VARIANT[@]|-eta|g" "$RC_LIGHT_FILE"-eta

# Check and re-color 'selection-color' and 'accent-color'
if [ -e "../sass/common/resources/_key_colors.scss" ]; then
    selection2="`grep 'key_selection' ../sass/common/resources/_key_colors.scss | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    accent2="`grep 'key_accent' ../sass/common/resources/_key_colors.scss | \
                 cut -d' ' -f2 | cut -d';' -f1`"

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $RC_FILE
        echo $selection1 is re-colored with $selection2 in $RC_FILE.
        sed -i "s/$selection1/$selection2/gi" $RC_DARK_FILE
        echo $selection1 is re-colored with $selection2 in $RC_DARK_FILE.
        sed -i "s/$selection1/$selection2/gi" $RC_LIGHT_FILE
        echo $selection1 is re-colored with $selection2 in $RC_LIGHT_FILE.
        sed -i "s/$selection1/$selection2/gi" $RC_FILE-eta
        echo $selection1 is re-colored with $selection2 in $RC_FILE-eta.
        sed -i "s/$selection1/$selection2/gi" $RC_DARK_FILE-eta
        echo $selection1 is re-colored with $selection2 in $RC_DARK_FILE-eta.
        sed -i "s/$selection1/$selection2/gi" $RC_LIGHT_FILE-eta
        echo $selection1 is re-colored with $selection2 in $RC_LIGHT_FILE-eta.
    fi
    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/gi" $RC_FILE
        echo $accent1 is re-colored with $accent2 in $RC_FILE.
        sed -i "s/$accent1/$accent2/gi" $RC_DARK_FILE
        echo $accent1 is re-colored with $accent2 in $RC_DARK_FILE.
        sed -i "s/$accent1/$accent2/gi" $RC_LIGHT_FILE
        echo $accent1 is re-colored with $accent2 in $RC_LIGHT_FILE.
        sed -i "s/$accent1/$accent2/gi" $RC_FILE-eta
        echo $accent1 is re-colored with $accent2 in $RC_FILE-eta.
        sed -i "s/$accent1/$accent2/gi" $RC_DARK_FILE-eta
        echo $accent1 is re-colored with $accent2 in $RC_DARK_FILE-eta.
        sed -i "s/$accent1/$accent2/gi" $RC_LIGHT_FILE-eta
        echo $accent1 is re-colored with $accent2 in $RC_LIGHT_FILE-eta.
    fi
else
    echo ../sass/common/resources/_key_colors.scss was not found. Stopped...
    exit 1
fi

exit 0
