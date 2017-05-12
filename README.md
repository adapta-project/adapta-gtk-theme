<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/logo_thumb.png" alt="Logo" align="left" /> Adapta-gtk-theme
======

An adaptive Gtk+ theme based on Material Design Guidelines.

Before using Adapta
-------------------

#### Typography

Adapta strongly depends on Material Design resources, especially its **fonts**.

 1. [**Noto Sans**](https://fonts.google.com/specimen/Noto+Sans)
   - Noto (NO TOfu) sans-serif truetype/opentype font covers a lot of languages.
   - Developed by Google and Adobe.
   - Weight used in Adapta: 400, (500), 700

 2. [**Roboto**](https://fonts.google.com/specimen/Roboto)
   - Very famous as the default truetype font in Android (English ver.).
   - Multilingual support is not good.
   - Weight used in Adapta: 400, 500, 700

> **Note:**
>
> * Roboto is very nice with Adapta, but in some locales, it causes Tofu.
> * NotoSans may work well in vairous locales, but NotoSans lacks 500 (Medium) weight. So elements defined with 500 will be drawn with 400 automatically.
> * NotoSans CJK supports 500 weight.

Adapta uses **NotoSans** as the primary font-family in Gnome-Shell and Cinnamon (Cantarell is for fallback).
In some distributions, users may need to install `fonts-noto-hinted`.

Adapta is designed with nominal **13px (or 14px)** Roboto font.
In Gnome, "window-scaling-factor = 1.0" means `-gtk-dpi = 96`, it also means:
  ```
  13 [px] x 72 [pt/inch] / 96 [px/inch] = 9.75 [pt]
  14 [px] x 72 [pt/inch] / 96 [px/inch] = 10.5 [pt]
  ```
That's the reason why `13.33px = 10pt` is used for rem/px conversion in Gtk+ 3.2x theming (In Gtk+ 3.18.x theming, em unit is directly used).

> **Note:**
>
> NotoSans CJK (ChineseJapaneseKorean) opentype fonts are actually **0.1em taller than Roboto fonts**, so if 10pt Roboto was suitable on your LCDs, set 9pt for NotoSans CJK families.

**Verify the fonts are rendered correctly via font-viewer tools like Gnome-Font-Viewer.**

Variant Matrix
--------------

| |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/sunlight.png" align="left"/> Adapta|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/moon.png" align="left"/> Adapta-Nokto|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/sunlight-eta.png" align="left"/> Adapta-Eta|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/moon-eta.png" align="left"/> Adapta-Nokto-Eta|
|:-----:|:-----:|:-----:|:-----:|:-----:|
|Gtk+ 2.24.x |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|
|Gtk+ 3.20.x |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|
|Gtk+ 3.22.x |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|
|Mutter      |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|
|Metacity    |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|
|Muffin      |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|
|Compiz      |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|
|XFwm4       |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|
|Marco       |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|
|Openbox-3   |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|

> **Note:**
>
>   * **Nokto** is a dark variant.
>   * **Eta** is a tiny Gtk+ 2.x/3.2x Gtk+ widget variant for saving space.
>   * I suggest you use the Eta variants if your LCD resolution is lower than FHD (1080p). Eta draws widgets around -20% to -30% spacing.
>   * Metacity theming supports Eta variants (>= 3.20.x or 3.22.x).

Elements
--------
![Materials](https://github.com/adapta-project/adapta-github-resources/blob/master/images/Materials.png)

Required Components
-------------------
Adapta supports Gtk+ 3.22.x and 3.20.x

 ```
 * Gtk+-3.0             >= 3.20.0
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
 * Cinnamon        >= 2.8.6
 * Unity7          >= 7.4.0 (Gtk+ 3.x only)
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
 >   * Adapta does NOT support elementaryOS.

Installation from Package(s)
----------------------------
 * AUR: https://aur.archlinux.org/packages/adapta-gtk-theme/

 * Copr: https://copr.fedorainfracloud.org/coprs/heikoada/gtk-themes/

 * OBS (openSUSE Tumbleweed): https://build.opensuse.org/package/show/home:Ronis_BR/adapta-gtk-theme

 * PPA: https://launchpad.net/~tista/+archive/ubuntu/adapta

 > **Note:**
 >
 >   * Solus OS has an eopkg (ypkg) in main repository.

Installation from Git Source
----------------------------
1. If previous versions were installed/existed, remove them first.

 ```
 sudo rm -rf /usr/share/themes/{Adapta,Adapta-Eta,Adapta-Nokto,Adapta-Nokto-Eta}
 rm -rf ~/.local/share/themes/{Adapta,Adapta-Eta,Adapta-Nokto,Adapta-Nokto-Eta}
 rm -rf ~/.themes/{Adapta,Adapta-Eta,Adapta-Nokto,Adapta-Nokto-Eta}
 ```

2. Check build-requirements:
 Currently Adapta bundles neither pre-generated stylesheets nor PNG images.
 So users and/or contributors should generate proper CSSs, PNGs and gresources at build-time.

 ```
 * autoconf
 * automake
 * inkscape                                  >= 0.91
 * libgdk-pixbuf2.0-dev (gdk-pixbuf2-devel)  >= 2.32.2
 * libglib2.0-dev (glib2-devel)              >= 2.48.0
 * librsvg2-dev (librsvg2-devel)             >= 2.40.13
 * libsass0 (libsass)                        >= 3.3
 * libxml2-utils (libxml2)
 * pkg-config (pkgconfig)
 * sassc                                     >= 3.3
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
 >   * Adapta employs **SassC** wrapper of `libsass` to generate CSS stylesheets.
 >   * Adapta uses `inkscape` to generate installable PNG files.
 >   * Adapta uses `glib-compile-resources` to compile the gresource files for Gtk+ and Gnome-Shell.

3. Build and install system-wide:

 ```
 ./autogen.sh
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
 >   * `-jN` option to be passed to GNU `make` is surely usable, but Adapta currently employs `parallel`.
 >   * This feature should not be applied when packaging on remote/shared build-servers.

5. To disable some DE supports, pass these specific options to `autogen.sh`:

 ```
 --disable-cinnamon      disable cinnamon support (type: bool)
 --disable-flashback     disable flashback support (type: bool)
 --disable-unity         disable unity support (type: bool)
 --disable-xfce          disable xfce support (type: bool)
 --disable-mate          disable mate support (type: bool)
 --disable-openbox       disable openbox support (type: bool)
 ```

 > **Note:**
 >
 >   * The installer installs GNOME/Budgie-Desktop support even if all of options above were applied.
 >   * Cinnamon/Unity/Mate support hooks `metacity-1` directory even if GNOME-Flashback support was disabled.

6. To enable extra Gtk+ release support, pass this option:

 ```
 --enable-gtk_legacy    enable Gtk+ 3.18 support (type: bool)
 --enable-gtk_next      enable Gtk+ 4.0 support (type: bool)
 ```

7. To change the default 5 **Key-Colors**, pass these options:

 ```
 --with-selection_color        Primary color for 'selected-items' (Default: #00BCD4 = Cyan500, type: int)
 --with-second_selection_color Primary color for 'select' effects (Default: #4DD0E1 = Cyan300, type: int)
 --with-accent_color           Secondary color for notifications and OSDs (Default: #4DB6AC = Teal300, type: int)
 --with-suggestion_color       Secondary color for 'suggested' buttons (Default: #009688 = Teal500, type: int)
 --with-destruction_color      Tertiary color for 'destructive' buttons (Default: #FF5252 = RedA200, type: int)
 ```

 > **Note:**
 >
 >   * Color-codes are defined as `#` + 6-digit `HEX`s (Standard RGB definitions in HTML codes).
 >     Uppercases are strongly recommended in Adapta code-base.
 >   * The Material Design Color Palette can be found [here](https://www.google.com/design/spec/style/color.html#color-color-palette).
 >   * Example: If you would like to use 'Teal500' as selection_color, use this:
 >
 >     ```./autogen.sh --with-selection_color=#009688 --with-second_selection_color=#4DB6AC```
 >
 >     This switchese the theme to almost Teal key colors.
 >   * Basically `selection_color` and `suggestion_color` should use `500` colors,
 >     and `second_selection_color` and `accent_color` should use `300` colors.
 >   * While doing `make`, Adapta changes those 5 colors in all stylesheets and images,
 >     and `make clean` cleans up all generated files from source directories.
 >   * This feature unfortunately is not supported in `Openbox-3` and `Telegram 1.0` theming.

GtkSourceView/Gedit Color Scheme Support
---------------------------------------
 A theme file `adapta.xml` is installed by default into `Adapta(-Nokto)/gedit` directory.
 See details in [`README.md`](/extra/gedit/README.md).

 > **Note:**
 >
 >   * The color-scheme can be used in Gnome-Builder and Gedit if installed to `~/.local/share/gtksourceview-3.0/styles` directory.
 >   * Currently only dark-variant is supported.

Extra Browser Support
---------------------
 To try experimental browser specific theming, pass this option:

 ```
 --enable-chrome         enable Chrome(ium) support (type: bool)
 ```

 The compressed `crx` files will be installed into `Adapta/chrome` and `Adapta-Nokto/chrome`.

 > **Note:**
 >
 >   * Currently only Chrome(ium) theming is supported.
 >   * Chrome(ium) 59.0.30xx or newer, theming is pulled from Gtk+ 3.x directly.
 >
 >   * Vivaldi can make custom themes via settings like these:
 >     ```
 >     Background: #FAFBFC (#263238)
 >     Foreground: #263238 (#CFD8DC)
 >     Highlight:  #00BCD4
 >     Accent:     #222D32
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
 >   * Both Adapta and Adapta-Nokto shares the same theming.
 >   * Don't expect too much. Plank is NOT a themeable widget for me!

Extra Compositor Support
------------------------
 Compton is the famous stand-alone compositor that works well with the Openbox window-manager. The installer installs recommended configuration file `compton.conf` into `Adapta/openbox-3` directory if Openbox support is enabled.

 Next, copy that file into `~/.config/` and restart compton to read the settings.  That compositor still has some limitations in its features for Adapta, however.

Extra Telegram Support
----------------------
 To try "Telegram 1.0" theming, pass this option:

 ```
 --enable-telegram      enable Telegram 1.0 support (type: bool)
 ```

 The installer installs compressed `tdesktop-theme` files into `Adapta/telegram` and `Adapta-Nokto/telegram` directories if Telegram support is enabled.
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
* Prepare for FlatPak packaging (priority: mid)
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
