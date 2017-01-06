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

ASSETS_DIR="../assets-gtk3"
ASSETS_CLONE_DIR="../assets-clone"
INDEX_CLONE="assets-clone-gtk3.txt"

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
