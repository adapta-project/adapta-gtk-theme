#! /bin/bash
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

SRC_DIR="assets-unity"
ASSETS_DIR="../unity"
INDEX="assets-unity.txt"
RECOLOR_FILE1="./assets-unity/close_focused_pressed.svg"
RECOLOR_FILE2="./assets-unity/progress_bar_fill.svg"
RECOLOR_FILE3="./assets-unity/progress_bar_trough.svg"
RECOLOR_FILE4="./assets-unity/close_focused_prelight.svg"
KEY_FILE="../../gtk/sass/common/_key_colors.scss"

# Default colours
selection1="`grep 'Cyan500' ../../gtk/sass/common/_colors.scss | \
                   cut -d' ' -f3`"
accent1="`grep 'Teal300' ../../gtk/sass/common/_colors.scss | \
                cut -d' ' -f3`"
destruction1="`grep 'RedA200' ../../gtk/sass/common/_colors.scss | \
                     cut -d' ' -f3`"

# Check and re-color 'close_focused_pressed', 'progess_bar_fill'
# and 'progress_bar_trough' file
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    accent2="`grep 'key_accent' $KEY_FILE | \
              cut -d' ' -f2 | cut -d';' -f1`"
    destruction2="`grep 'key_destruction' $KEY_FILE | \
                   cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $RECOLOR_FILE1.in $RECOLOR_FILE1
    cp -f $RECOLOR_FILE2.in $RECOLOR_FILE2
    cp -f $RECOLOR_FILE3.in $RECOLOR_FILE3
    cp -f $RECOLOR_FILE4.in $RECOLOR_FILE4

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $RECOLOR_FILE1
        echo $selection1 is re-colored with $selection2.
    fi
    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/gi" $RECOLOR_FILE2
        sed -i "s/$accent1/$accent2/gi" $RECOLOR_FILE3
        echo $accent1 is re-colored with $accent2.
    fi
    if [ $destruction1 != $destruction2 ]; then
        sed -i "s/$destruction1/$destruction2/gi" $RECOLOR_FILE4
        echo $destruction1 is re-colored with $destruction2.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi

# Clone stock SVG files and make sym-links
IFS=$'
'
for i in $(<$INDEX)
do
    if [ `echo $i | wc -w` == 1 ]; then
        s="`echo $i | cut -d' ' -f1`"
        if [ -f $ASSETS_DIR/$s.svg ] && \
            [ $SRC_DIR/$s.svg -ot $ASSETS_DIR/$s.svg ]; then
            echo $ASSETS_DIR/$s.svg exists.
        else
            echo Cloning $ASSETS_DIR/$s.svg
            cp $SRC_DIR/$s.svg $ASSETS_DIR
        fi
    else
        src="`echo $i | cut -d' ' -f3`"
        sym="`echo $i | cut -d' ' -f1`"
        echo Making symlinks $ASSETS_DIR/$sym.svg
        ln -sf $src.svg $ASSETS_DIR/$sym.svg
    fi
done
unset IFS

exit 0
