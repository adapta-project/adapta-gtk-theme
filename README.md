Robotic-gtk-theme
======

An adaptive Gtk+ theme based on the Robotic GTK+ theme.

Before using Robotic
-------------------

> **Note:**
>
>   **Nokto** is a dark variant.
>
>   **Eta** is a tiny Gtk+ 2.x/3.2x Gtk+ widget variant for saving space.
>
>   * To enable global dark theme, you use proper tools like Gnome-Tweak-Tool.
>     Or add this porperty to `[Settings]` section of `$HOME/.config/gtk-3.0/settings.ini`:
>
>     ```
>     [Settings]
>     gtk-application-prefer-dark-theme=1
>     ```
>
>   * I suggest you use the Eta variants if your LCD resolution is lower than FHD (1080p). Eta draws widgets around -20% to -30% spacing.
>   * Metacity theming supports Eta variants (>= 3.20.x or 3.22.x).

Required Components
-------------------
Robotic supports Gtk+ 3.22.x, 3.20.x and 3.18.x

 ```
 * Gtk+-3.0             >= 3.18.9
 * Gtk+-2.0             >= 2.24.30
 * gtk2-engines-pixbuf  >= 2.24.30
 * gtk2-engines-murrine >= 0.98.1
 ```

Supported Desktop Environments
------------------------------

 ```
 * GNOME-Shell     >= 3.18.3
 * GNOME-Flashback >= 3.18.2
 * Budgie-Desktop  >= 10.2.7
 * Unity7          >= 7.4.0
 * XFce4           >= 4.12.2
 * Mate            >= 1.14.0 (Gtk+ 3.2x only)
 * LXDE            >= 0.99.1 (Gtk+ 2.x only)
 ```

 > **Note:**
 >
 >   * Mate-Desktop support is a W.I.P.

Unsupported Gtk+ Based Desktop(s)
-------------------------------
 * Pantheon

 > **Note:**
 >
 >   * Robotic does NOT support elementaryOS.

Installation from Git (Prebuilt version)
----------------------------
Just do this:

```
./install-prebuilt.sh
```

This will install a pre-built copy of the theme with the correct colors set up, and will include the Robotic Variant of the Papirus icon theme. It will also attempt to use gsettings to set up the icons, theme, and shell theme (if the user-themes extension is enabled)

Installation from Git Source (Quick version)
----------------------------

Run these:

```
./deps.sh
./conf.sh
make
sudo make install
```

Installation from Git Source (Full version)
----------------------------

1. If previous versions were installed/existed, remove them first.

 ```
 sudo rm -rf /usr/share/themes/{Robotic,Robotic-Eta,Robotic-Nokto,Robotic-Nokto-Eta}
 rm -rf ~/.local/share/themes/{Robotic,Robotic-Eta,Robotic-Nokto,Robotic-Nokto-Eta}
 rm -rf ~/.themes/{Robotic,Robotic-Eta,Robotic-Nokto,Robotic-Nokto-Eta}
 ```

2. Check build-requirements:
 Currently Robotic bundles neither pre-generated stylesheets nor PNG images.
 So users and/or contributors should generate proper CSSs, PNGs and gresources at build-time.

 ```
 * autoconf
 * automake
 * inkscape
 * libgdk-pixbuf2.0-dev (gdk-pixbuf2-devel)  >= 2.32.2
 * libglib2.0-dev (glib2-devel)              >= 2.48.0
 * librsvg2-dev (librsvg2-devel)             >= 2.40.13
 * libsass0 (libsass)                        >= 3.3.6
 * libxml2-utils (libxml2)
 * pkg-config (pkgconfig)
 * sassc                                     >= 3.3.2
 ```
 
 You can install them using:
 ```
 sudo apt install -y autoconf automake inkscape libgdk-pixbuff2.0-dev \
    libglib2.0-dev librsvg2-dev libsass0 libxml2-utils pkg-config sassc
 ```

 > **Note:**
 >
 >   * In OpenSUSE, add 3 extra dependencies:
 >
 >     ```
 >     gdk-pixbuf-devel        >= 2.32.2
 >     gdk-pixbuf-loader-rsvg  >= 2.40.13
 >     librsvg-devel           >= 2.40.13
 >     ```
 >
 >   * Robotic employs **SassC** wrapper of `libsass` to generate CSS stylesheets.
 >   * Robotic uses `inkscape` to generate installable PNG files.
 >   * Robotic uses `glib-compile-resources` to compile the gresource files for Gtk+ and Gnome-Shell.

3. Build and install system-wide:

 ```
 ./autogen.sh \
    --enable-parallel \
    --disable-cinnamon \
    --disable-openbox \
    --enable-gtk_next \
    --with-selection_color=#FAA41A \
    --with-second_selection_color=#FFB13D \
    --with-accent_color=#48B9C7 \
    --with-suggestion_color=#73C48F \
    --with-destruction_color=#F15D22 \
    --enable-chrome \
    --enable-plank \
    --enable-telegram 
 make
 sudo make install
 ```

 > **Note:**
 >
 >   * Default prefix is `/usr`.
 >   * All 4 variants are installed by default.
 >   * `make` generates proper CSSs and PNGs to be installed.
 >     It will take about 5min to 15min to build.
 >     For example, Ubuntu's build-server takes 10min.
 >   * `sudo make install` installs multiple versioned theme and Gtk+ automatically selects the properly versioned one when running.

4. To speed up by using concurrency-build, pass this specific option to `autogen.sh`:

 ```
 --enable-parallel       enable parallel-build support (type: bool)
 ```

 > **Note:**
 >
 >   * This feature requires GNU `parallel`, so please add `parallel` to build-requirements.
 >     Parallel can execute multiple scripts and binaries to be suitable for multi-threading.
 >     It could especially shorten the rendering-time via `inkscape`.
 >   * `-jN` option to be passed to GNU `make` is surely usable, but Robotic currently employs `parallel`.
 >   * This feature should not be applied when packaging on remote/shared build-servers.

5. To disable some DE supports, pass these specific options to `autogen.sh`:

 ```
 --disable-flashback     disable flashback support (type: bool)
 --disable-unity         disable unity support (type: bool)
 --disable-xfce          disable xfce support (type: bool)
 --disable-mate          disable mate support (type: bool)
 ```

 > **Note:**
 >
 >   * The installer installs GNOME/Budgie-Desktop support even if all of options above were applied.
 >   * Cinnamon/Unity/Mate support hooks `metacity-1` directory even if GNOME-Flashback support was disabled.

6. To enable next Gtk+ release support, pass this option:

 ```
 --enable-gtk_next      enable Gtk+ 4.0 support (type: bool)
 ```

7. To change the default 5 **Key-Colors**, pass these options:

 ```
 --with-selection_color        Primary color for 'selected-items' (Default: #574F4A = Cyan500, type: int)
 --with-second_selection_color Primary color for 'select' effects (Default: #4DD0E1 = Cyan300, type: int)
 --with-accent_color           Secondary color for notifications and OSDs (Default: #48B9C7 = Teal300, type: int)
 --with-suggestion_color       Secondary color for 'suggested' buttons (Default: #009688 = Teal500, type: int)
 --with-destruction_color      Tertiary color for 'destructive' buttons (Default: #FF5252 = RedA200, type: int)
 ```

 > **Note:**
 >
 >   * Color-codes are defined as `#` + 6-digit `HEX`s (Standard RGB definitions in HTML codes).
 >     Uppercases are strongly recommended in Robotic code-base.
 >   * The Material Design Color Palette can be found [here](https://www.google.com/design/spec/style/color.html#color-color-palette).
 >   * Example: If you would like to use 'Teal500' as selection_color, use this:
 >
 >     ```./autogen.sh --with-selection_color=#009688 --with-second_selection_color=#48B9C7```
 >
 >     This switchese the theme to almost Teal key colors.
 >   * Basically `selection_color` and `suggestion_color` should use `500` colors,
 >     and `second_selection_color` and `accent_color` should use `300` colors.
 >   * While doing `make`, Robotic changes those 5 colors in all stylesheets and images,
 >     and `make clean` cleans up all generated files from source directories.
 >   * This feature unfortunately is not supported in `Openbox-3` and `Telegram 1.0` theming.

GtkSourceView/Gedit Color Scheme Support
---------------------------------------
 A theme file `adapta.xml` is installed by default into `Robotic(-Nokto)/gedit` directory.
 See details in [`README.md`](/extra/gedit/README.md).

 > **Note:**
 >
 >   * The color-scheme can be used in Gnome-Builder and Gedit if installed to `gtksourceview-3.0/styles` directory.
 >   * Currently only dark-variant is supported.

Extra Browser Support
---------------------
 To try experimental browser specific theming, pass this option:

 ```
 --enable-chrome         enable Chrome(ium) support (type: bool)
 ```

 The compressed `crx` files will be installed into `Robotic/chrome` and `Robotic-Nokto/chrome`.

 > **Note:**
 >
 >   * Currently only Chrome(ium) theming is supported.
 >
 >   * Vivaldi can make custom themes via settings like these:
 >     ```
 >     Background: #FAFBFC (#333333)
 >     Foreground: #574F4A (#F6F6F6)
 >     Highlight:  #574F4A
 >     Accent:     #4E4844
 >     Accent Color from Active Page: [ ]
 >     Apply Accent Color to Window:  [*]
 >     Transparent Tabs:              [*]
 >     Corner Rounding:               2px
 >     ```

Extra Dock Support
------------------
 To try "Plank" theming, pass this option:

 ```
 --enable-plank         enable Plank support (type: bool)
 ```

 Then select `Gtk+` via `plank --preferences`.

 > **Note:**
 >
 >   * Both Robotic and Robotic-Nokto shares the same theming.
 >   * Don't expect too much. Plank is NOT a themeable widget for me!

Extra Compositor Support
------------------------
 Compton is the famous stand-alone compositor that works well with the Openbox window-manager. The installer installs recommended configuration file `compton.conf` into `Robotic/openbox-3` directory if Openbox support is enabled.

 Next, copy that file into `~/.config/` and restart compton to read the settings.  That compositor still has some limitations in its features for Robotic, however.

Extra Telegram Support
----------------------
 To try "Telegram 1.0" theming, pass this option:

 ```
 --enable-telegram      enable Telegram 1.0 support (type: bool)
 ```

 The installer installs compressed `tdesktop-theme` files into `Robotic/telegram` and `Robotic-Nokto/telegram` directories if Telegram support is enabled.
 Then open the file via Telegram > Main Menu > Settings > Chat background > Choose from file.

 > **Note:**
 >
 >   * The `adapta.tdesktop-theme` is for light-variant, and `adapta-nokto.tdesktop-theme` is for dark-variant.
 >   * Bundled noise-texture images are for *tiled* mode.
 >   * Telegram support is a W.I.P currently.

Work in Progress
----------------
* Conversion to Gtk+ 4.0

TODO
----
* Move Gtk+ 3.18.x theming to legacy (priority: Mid)
* Prepare for Steam theming (priority: Low)
* Add Firefox specific theming (priority: undecided)

Public License
--------------
 GPLv2.0

 > **Note:**
 >
 > SVG files are licensed under CC BY-SA 4.0

Special Thanks to
--------------
 Nana-4, the developer of Flat-Plat.
 tista500 and the Adapta Theme Project: https://github.com/adapta-project
