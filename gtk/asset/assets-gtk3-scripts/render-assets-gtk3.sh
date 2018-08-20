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

INKSCAPE="`command -v inkscape`"

SRC_FILE="../assets-gtk3.svg"
ASSETS_DIR="../assets-gtk3"
INDEX=""
KEY_FILE="../../sass/common/_key_colors.scss"

inkver="`$INKSCAPE --version | awk '{print $2}' | cut -c 1-4`"
if [ "$inkver" = 0.91 ]; then
    non_scale_dpi=90
    scale_dpi=180
else
    non_scale_dpi=96
    scale_dpi=192
fi

#Renderer
render-non-scale() {
    $INKSCAPE --export-id=$i \
              --export-dpi="$non_scale_dpi" \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
                                                        2>>../inkscape.log
}

render-scale() {
    $INKSCAPE --export-id=$i \
              --export-dpi="$scale_dpi" \
              --export-id-only \
              --export-png=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null \
                                                          2>>../inkscape.log
}

# Generate PNG files
case "$1" in
    checkbox)
        INDEX=($(grep -e checkbox assets-gtk3.txt))
        ;;
    misc)
        INDEX=($(grep -e osd -e thumb -e needs assets-gtk3.txt))
        ;;
    radio)
        INDEX=($(grep -e radio assets-gtk3.txt))
        ;;
    slider)
        INDEX=($(grep -e slider assets-gtk3.txt))
        ;;
    toggle)
        INDEX=($(grep -e toggle assets-gtk3.txt))
        ;;
    window-close)
        INDEX=($(grep -e 'window-close' assets-gtk3.txt))
        ;;
    window-minimize)
        INDEX=($(grep -e 'window-minimize' assets-gtk3.txt))
        ;;
    window-maximize)
        INDEX=($(grep -e 'window-maximize' assets-gtk3.txt))
        ;;
    window-unmaximize)
        INDEX=($(grep -e 'window-unmaximize' assets-gtk3.txt))
        ;;
    all)
        INDEX="`cat assets-gtk3.txt`"
        ;;
    *)
        exit 1
        ;;
esac

for i in ${INDEX[@]}
do 
    if [ -f $ASSETS_DIR/$i.png ] && [ $KEY_FILE -ot $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f $ASSETS_DIR/$i.png ] && [ $KEY_FILE -nt $ASSETS_DIR/$i.png ]; then
        echo Re-rendering $ASSETS_DIR/$i.png
        echo $i.png >>../inkscape.log
        rm -f $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering $ASSETS_DIR/$i.png
        echo $i.png >>../inkscape.log
        render-non-scale
    fi

    if [ -f $ASSETS_DIR/$i@2.png ] && [ $KEY_FILE -ot $ASSETS_DIR/$i@2.png ]; then
        echo $ASSETS_DIR/$i@2.png exists.
    elif [ -f $ASSETS_DIR/$i@2.png ] && [ $KEY_FILE -nt $ASSETS_DIR/$i@2.png ]; then
        echo Re-rendering $ASSETS_DIR/$i@2.png
        echo $i@2.png >>../inkscape.log
        rm -f $ASSETS_DIR/$i@2.png
        render-scale
    else
        echo Rendering $ASSETS_DIR/$i@2.png
        echo $i@2.png >>../inkscape.log
        render-scale
    fi
done
