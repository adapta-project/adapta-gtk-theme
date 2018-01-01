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

SRC_DIR="../assets-openbox"
ASSETS_DIR="../../openbox-3"
INDEX="assets-openbox.txt"

# Clone stock XBM files
for i in $(<$INDEX)
do
    if [ -f $ASSETS_DIR/$i.xbm ] && \
        [ $SRC_DIR/$i.xbm -ot $ASSETS_DIR/$i.xbm ]; then
        echo $ASSETS_DIR/$i.xbm exists.
    else
        echo Cloning $ASSETS_DIR/$i.xbm
        cp $SRC_DIR/$i.xbm $ASSETS_DIR
    fi
done

exit 0
