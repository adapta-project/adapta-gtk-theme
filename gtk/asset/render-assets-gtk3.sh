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

SRC_FILE="assets-gtk3.svg"
ASSETS_DIR="assets-gtk3"
ASSETS_CLONE_DIR="assets-clone"
INDEX="assets-gtk3.txt"
INDEX_CLONE="assets-clone-gtk3.txt"
KEY_FILE="../sass/common/_key_colors.scss"

# Default colours
selection1="`grep 'Cyan500' ../sass/common/_colors.scss | \
                   cut -d' ' -f3`"
accent1="`grep 'Teal300' ../sass/common/_colors.scss | \
                cut -d' ' -f3`"
suggestion1="`grep 'Teal500' ../sass/common/_colors.scss | \
                    cut -d' ' -f3`"
destruction1="`grep 'RedA200' ../sass/common/_colors.scss | \
                     cut -d' ' -f3`"

#Renderer
render-non-scale() {
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null #\
}

render-scale() {
    $INKSCAPE --export-id=$i \
              --export-dpi=180 \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null #\
}

# Check and re-color color-scheme
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    accent2="`grep 'key_accent' $KEY_FILE | \
              cut -d' ' -f2 | cut -d';' -f1`"
    suggestion2="`grep 'key_suggestion' $KEY_FILE | \
                  cut -d' ' -f2 | cut -d';' -f1`"
    destruction2="`grep 'key_destruction' $KEY_FILE | \
                   cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $SRC_FILE.in $SRC_FILE && sleep 1

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/g" $SRC_FILE
        echo $selection1 is re-colored with $selection2.
    fi
    if [ $accent1 != $accent2 ]; then
        sed -i "s/$accent1/$accent2/g" $SRC_FILE
        echo $accent1 is re-colored with $accent2.
    fi
    if [ $suggestion1 != $suggestion2 ]; then
        sed -i "s/$suggestion1/$suggestion2/g" $SRC_FILE
        echo $suggestion1 is re-colored with $suggestion2.
    fi
    if [ $destruction1 != $destruction2 ]; then
        sed -i "s/$destruction1/$destruction2/g" $SRC_FILE
        echo $destruction1 is re-colored with $destruction2.
    fi
else
    echo _key_colors.scss was not found. Stopped...
    exit 1
fi

# Generate PNG files
for i in $(<$INDEX)
do 
    if [ -f $ASSETS_DIR/$i.png ] && [ $KEY_FILE -ot $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f $ASSETS_DIR/$i.png ] && [ $KEY_FILE -nt $ASSETS_DIR/$i.png ]; then
        echo Re-rendering $ASSETS_DIR/$i.png
        rm -f $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering $ASSETS_DIR/$i.png
        render-non-scale
    fi

    if [ -f $ASSETS_DIR/$i@2.png ] && [ $KEY_FILE -ot $ASSETS_DIR/$i@2.png ]; then
        echo $ASSETS_DIR/$i@2.png exists.
    elif [ -f $ASSETS_DIR/$i@2.png ] && [ $KEY_FILE -nt $ASSETS_DIR/$i@2.png ]; then
        echo Re-rendering $ASSETS_DIR/$i@2.png
        rm -f $ASSETS_DIR/$i@2.png
        render-scale
    else
        echo Rendering $ASSETS_DIR/$i@2.png
        render-scale
    fi
done

# Clone stock SVG files
for i in $(<$INDEX_CLONE)
do
    if [ -f $ASSETS_DIR/$i.svg ]; then
        echo $ASSETS_DIR/$i.svg exists.
    else
        echo Cloning $i.svg into $ASSETS_DIR
        cp $ASSETS_CLONE_DIR/$i.svg $ASSETS_DIR
    fi
done

exit 0
