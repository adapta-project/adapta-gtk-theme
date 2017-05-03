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

INKSCAPE="`command -v inkscape`"

SRC_FILE="../assets-gtk2.svg"
ASSETS_DIR="../assets-gtk2"
INDEX="assets-gtk2-scrollbar.txt"
KEY_FILE="../../sass/common/_key_colors.scss"

inkver="`$INKSCAPE --version | awk '{print $2}' | cut -c 1-4`"
if [ "$inkver" = 0.91 ]; then
    non_scale_dpi=90
else
    non_scale_dpi=96
fi

# Renderer
render-non-scale() {
    ID=`echo $i | tr '/' '_'`
    $INKSCAPE --export-id=$ID \
              --export-dpi="$non_scale_dpi" \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
                                                        2>>../inkscape.log
}

# Generate PNG files
for i in $(<$INDEX)
do
    SUB_DIR=`echo $i | cut -f1 -d '/'`
    if [ '!' -d $ASSETS_DIR/$SUB_DIR ]; then
        mkdir  $ASSETS_DIR/$SUB_DIR; 
    fi

    if [ -f  $ASSETS_DIR/$i.png ] && [ $KEY_FILE -ot  $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f  $ASSETS_DIR/$i.png ] && [ $KEY_FILE -nt  $ASSETS_DIR/$i.png ]; then
        echo Re-rendering  $ASSETS_DIR/$i.png
        echo $i.png >>../inkscape.log
        rm -f  $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering  $ASSETS_DIR/$i.png
        echo $i.png >>../inkscape.log
        render-non-scale
    fi
done
