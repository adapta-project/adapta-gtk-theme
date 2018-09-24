#!/bin/sh
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

glib-compile-resources --sourcedir="../gnome-shell" \
                       --target="../gnome-shell/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-brila" \
                       --target="../gnome-shell-brila/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-nokto" \
                       --target="../gnome-shell-nokto/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-eta" \
                       --target="../gnome-shell-eta/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-brila-eta" \
                       --target="../gnome-shell-brila-eta/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
glib-compile-resources --sourcedir="../gnome-shell-nokto-eta" \
                       --target="../gnome-shell-nokto-eta/gnome-shell-theme.gresource" \
                       ./gnome-shell/gnome-shell-theme.gresource.xml
