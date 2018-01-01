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

ASSETS_DIR="../assets-gtk2"
ASSETS_CLONE_DIR="../assets-clone"
INDEX_CLONE="assets-clone-gtk2.txt"

# Clone stock SVG files
for i in $(<$INDEX_CLONE)
do
    case $i in
    "null" )
        if [ -f $ASSETS_DIR/Others/$i.svg ]; then
            echo $ASSETS_DIR/Others/$i.svg exists.
        else
            echo Cloning $i.svg into $ASSETS_DIR/Others
            cp $ASSETS_CLONE_DIR/$i.svg $ASSETS_DIR/Others
        fi
        ;;
    "z-depth"* )
        if [ -f $ASSETS_DIR/Shadows/$i.svg ]; then
            echo $ASSETS_DIR/Shadows/$i.svg exists.
        else
            echo Cloning $i.svg into $ASSETS_DIR/Shadows
            cp $ASSETS_CLONE_DIR/$i.svg $ASSETS_DIR/Shadows
        fi
        ;;
    esac    
done
