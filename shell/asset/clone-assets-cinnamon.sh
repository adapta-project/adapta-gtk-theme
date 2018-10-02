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

# Default colours
selection1="`grep 'Cyan500' ../../gtk/sass/common/_colors.scss | \
                   cut -d' ' -f3`"
accent1="`grep 'Teal300' ../../gtk/sass/common/_colors.scss | \
                cut -d' ' -f3`"
destruction1="`grep 'RedA200' ../../gtk/sass/common/_colors.scss | \
                     cut -d' ' -f3`"

# Check and re-color SVG files
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    accent2="`grep 'key_accent' $KEY_FILE | \
              cut -d' ' -f2 | cut -d';' -f1`"
    destruction2="`grep 'key_destruction' $KEY_FILE | \
                   cut -d' ' -f2 | cut -d';' -f1`"

IFS=$'
'
for i in $(<$INDEX)
do
    s="`echo $i | cut -d' ' -f1`.svg" # source
    r="`echo $i | cut -d' ' -f2`" # recolor flag

    if [ "$r" = "r1" ]; then
        cp -f $SRC_DIR/$s.in $SRC_DIR/$s

        if [ $selection1 != $selection2 ]; then
            sed -i "s/$selection1/$selection2/gi" $SRC_DIR/$s
            echo $s is re-colored with $selection2.
        fi
    elif [ "$r" = "r2" ]; then
        cp -f $SRC_DIR/$s.in $SRC_DIR/$s

        if [ $accent1 != $accent2 ]; then
            sed -i "s/$accent1/$accent2/gi" $SRC_DIR/$s
            echo $s is re-colored with $accent2.
        fi
    elif [ "$r" = "r3" ]; then
        cp -f $SRC_DIR/$s.in $SRC_DIR/$s

        if [ $destruction1 != $destruction2 ]; then
            sed -i "s/$destruction1/$destruction2/gi" $SRC_DIR/$s
            echo $s is re-colored with $destruction2.
        fi
    fi
done
unset IFS

else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi

# Clone stock SVG files
IFS=$'
'
for i in $(<$INDEX)
do
    s="`echo $i | cut -d' ' -f1`.svg"                 # source
    f="`echo $i | cut -d' ' -f1 | cut -d'/' -f3`.svg" # file name
    v="`echo $i | cut -c1`"                           # variant type
    d="`echo $i | cut -d'/' -f2`"                     # target directory

    if [ $v = "c" ]; then # 'commmon'
        if [ -f $ASSETS_DIR/$d/$f ] && \
            [ $SRC_DIR/$s -ot $ASSETS_DIR/$d/$f ]; then
            echo $ASSETS_DIR/$d/$f exists.
            echo $ASSETS_DARK_DIR/$d/$f exists.
        else
            echo Cloning $ASSETS_DIR/$d/$f
            cp $SRC_DIR/$s $ASSETS_DIR/$d/$f
            echo Cloning $ASSETS_DARK_DIR/$d/$f
            cp $SRC_DIR/$s $ASSETS_DARK_DIR/$d/$f
        fi
    elif [ $v = "l" ]; then # 'light'
        if [ -f $ASSETS_DIR/$d/$f ] && \
            [ $SRC_DIR/$s -ot $ASSETS_DIR/$d/$f ]; then
            echo $ASSETS_DIR/$d/$f exists.
        else
            echo Cloning $ASSETS_DIR/$d/$f
            cp $SRC_DIR/$s $ASSETS_DIR/$d/$f
        fi
    else # 'dark'
        if [ -f $ASSETS_DARK_DIR/$d/$f ] && \
            [ $SRC_DIR/$s -ot $ASSETS_DARK_DIR/$d/$f ]; then
            echo $ASSETS_DARK_DIR/$d/$f exists.
        else
            echo Cloning $ASSETS_DARK_DIR/$d/$f
            cp $SRC_DIR/$s $ASSETS_DARK_DIR/$d/$f
        fi
    fi
done
unset IFS

exit 0
