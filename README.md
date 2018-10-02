<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/logo_thumb.png" alt="Logo" align="left" /> Adapta-gtk-theme
======

An adaptive Gtk+ theme based on Material Design Guidelines.


02 Oct 2018
-----------
# [Important]
# Reverted all changes to 3.94.0.x and I will move to somewhere else.

Before using Adapta
-------------------

#### Typography

Adapta strongly depends on Material Design resources, especially its **fonts**.

 1. [**Roboto**](https://fonts.google.com/specimen/Roboto)
   - Very famous as the default truetype font in Android (English ver.).
   - Multilingual support is not good.
   - Weight used in Adapta: 300, 400, 500, 700

 2. [**Noto Sans**](https://fonts.google.com/specimen/Noto+Sans)
   - Noto (NO TOfu) sans-serif truetype/opentype font covers a lot of languages.
   - Developed by Monotype and Adobe.
   - Weight used in Adapta: 400, (500), 700

| |Primary|Secondary|Fallback|
|:-----:|:-----:|:-----:|:-----:|
|Gnome-Shell >= 3.26|**Roboto**|**NotoSans**|Sans-serif|
|Gnome-Shell =< 3.24|**NotoSans**||Sans-serif|
|Cinnamon           |**Roboto**||Sans-serif|

> **Note:**
>
> * Roboto is very nice with Adapta, but in some locales, it causes Tofu.
> * NotoSans may work well in various locales, but NotoSans lacks 500 (Medium) weight. So elements defined with 500 will be drawn with 400 automatically.
> * NotoSans CJK supports 500 weight.
> * NotoSans is used as the 'password chars **U+25CF**' only in Gnome-Shell >= 3.26.

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
|Gtk+ 3.24.x |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|
|Mutter      |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|
|Metacity    |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|
|Muffin      |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|
|XFwm4       |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|
|Marco       |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|
|Openbox-3   |<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-on.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|<img src="https://github.com/adapta-project/adapta-github-resources/blob/master/images/check-off.png" align="center" />|

> **Note:**
>
>   * **Nokto** is a dark variant.
>   * **Eta** is a tiny Gtk+ 2.x/3.2x Gtk+ widget variant for saving space.
>   * I suggest you use the Eta variants if your LCD resolution is lower than FHD (1080p). Eta draws widgets around -20% to -30% spacing.
>   * Metacity theming supports Eta variants (>= 3.2x).

Elements
--------
![Materials](https://github.com/adapta-project/adapta-github-resources/blob/master/images/Materials.png)

Required Components
-------------------
Adapta supports Gtk+ 3.24.x, 3.22.x and 3.20.x

 ```
 * Gtk+-3.0             >= 3.20.0
 * Gtk+-2.0             >= 2.24.30
 * gtk2-engines-pixbuf  >= 2.24.30
 * gtk2-engines-murrine >= 0.98.1
 ```

Supported Desktop Environments
------------------------------

 ```
 * GNOME-Shell     >= 3.20.0
 * GNOME-Flashback >= 3.20
 * Budgie-Desktop  >= 10.4
 * Cinnamon        >= 3.2.0
 * XFce4           >= 4.12.2
 * Mate            >= 1.14.0
 * LXDE            >= 0.99.1 (Gtk+ 2.x only)
 ```

Unsupported Gtk+ Based Desktop(s)
-------------------------------
 * Pantheon
 * Unity7

 > **Note:**
 >
 >   * Adapta does NOT support elementaryOS.

Installation from Package(s)
----------------------------
 Package(s) can be found in the official main repositories of these distributions:

 * **Arch (community)**

 * **Fedora**

 * **openSUSE (Tumbleweed)**

 * **Solus**

 Personal repository:

 * PPA: [**Stable-channel**](https://launchpad.net/~tista/+archive/ubuntu/adapta)
        and [**Dev-channel**](https://launchpad.net/~tista/+archive/ubuntu/adapta-nightly)

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
 * libxml2-utils (libxml2)
 * pkg-config (pkgconfig)
 * sassc                                     >= 3.3

 * parallel                                  (if --enable-parallel)
 ```

 > **Note:**
 >
 >   * In OpenSUSE, add an extra dependency:
 >
 >     ```
 >     gdk-pixbuf-devel        >= 2.32.2
 >     ```
 >
 >   * Adapta employs **SassC** wrapper of `libsass` to generate CSS stylesheets.
 >   * Adapta uses `inkscape` to generate installable PNG files.
 >   * Adapta uses `glib-compile-resources` to compile the gresource files for Gtk+ and Gnome-Shell.
 >   * `glib-2.0 >= 2.53`, Gnome-Shell 3.26 theming is used if `--enable-gnome`.

3. Build and install system-wide:

 ```
 ./autogen.sh --prefix=/usr
 make
 sudo make install
 ```

 > **Note:**
 >
 >   * Default prefix is `/usr/local`.
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
 --disable-gnome         disable gnome-shell support (type: bool)
 --disable-cinnamon      disable cinnamon support (type: bool)
 --disable-flashback     disable flashback support (type: bool)
 --disable-xfce          disable xfce support (type: bool)
 --disable-mate          disable mate support (type: bool)
 --disable-openbox       disable openbox support (type: bool)
 ```

 > **Note:**
 >
 >   * The installer installs Budgie-Desktop support even if all of options above were applied.
 >   * Cinnamon/Mate support hooks `metacity-1` directory even if GNOME-Flashback support was disabled.

6. To enable extra Gtk+ release support, pass these options:

 ```
 --enable-gtk_next      enable Gtk+ 4.0 support (type: bool)
 ```

7. To change the default 4 **Key-Colors**, pass these options:

 ```
 --with-selection_color        Primary color for 'selected-items' (Default: #00BCD4 = Cyan500, type: string)
 --with-accent_color           Secondary color for notifications and OSDs (Default: #4DB6AC = Teal300, type: string)
 --with-suggestion_color       Secondary color for 'suggested' buttons (Default: #009688 = Teal500, type: string)
 --with-destruction_color      Tertiary color for 'destructive' buttons (Default: #FF5252 = RedA200, type: string)
 ```

 > **Note:**
 >
 >   * Color-codes are defined as `#` + 6-digit `HEX`s (Standard RGB definitions in HTML codes).
 >     Uppercases are strongly recommended in Adapta code-base.
 >   * The Material Design Color Palette can be found [**here**](https://www.google.com/design/spec/style/color.html#color-color-palette).
 >   * Example: If you would like to use 'Teal500' as selection_color, use this:
 >
 >     ```./autogen.sh --with-selection_color=#009688```
 >
 >     This switchese the theme to almost Teal key colors.
 >   * Basically `selection_color` and `suggestion_color` should use `500` colors,
 >     and `accent_color` should use `300` colors.
 >   * While doing `make`, Adapta changes those 4 colors in all stylesheets and images,
 >     and `make clean` cleans up all generated files from source directories.
 >   * This feature unfortunately is not supported in `Openbox-3` and `Telegram 1.0` theming.

GtkSourceView/Gedit Color Scheme Support
----------------------------------------
 A theme file `adapta.xml` is installed by default into `Adapta(-Nokto)/gedit` directory.
 See details in [**README.md**](/extra/gedit/README.md).

 > **Note:**
 >
 >   * The color-scheme can be used in Gnome-Builder, Gnome-Sushi, Meld and Gedit if installed to 
 >     `~/.local/share/gtksourceview-3.0/styles` or `~/.local/share/gtksourceview-4/styles` directory.
 >   * Currently only dark-variant is supported.

Visual Studio Code (VS Code) Theme Support
------------------------------------------
 1. Linux-themes (Author: SolarLiner): [**Visual Studio Marketplace**](https://marketplace.visualstudio.com/items?itemName=SolarLiner.linux-themes)

 2. Vscode-theme-adapted (Author: About-Code): [**Visual Studio Marketplace**](https://marketplace.visualstudio.com/items?itemName=about-code.vscode-theme-adapted)

Extra Browser Support
---------------------
 To try our color samples for FirefoxColor test pilot, check these URLs:

  1. [**Adapta**](https://color.firefox.com/?theme=XQAAAALUAAAAAAAAAABBKYhm849SCiazH1KEGccwS-xNVAWBvoBvsLDMFdiXwrZEjOV1NwO6XqPerXD8qZXG0Ve0ysSRDO_Fqq_1SFIUTSKR-LFqpoxVvvpw1Iq_PQcwWXZZeVXaSfmGGjCCdDkcOR3IcXyEWy-CbpLupG_UOE7d7U-IqXDfj3RCFFTYAW-cbj4Hku3mPIskyg-xRys_ul6HSl3J_IaFQA)

  2. [**Adapta-Nokto**](https://color.firefox.com/?theme=XQAAAALUAAAAAAAAAABBKYhm849SCiazH1KEGccwS-xNVAVNrWV6_89xtxNWy3sM0X99YG7itotZ8sB9kkK0owJCyKXJNAryj9IJU_wtu72r-X3skC4prCeW-fnJweq-4xu9tLmeXj8UkSdZGnzwrWVCNr3bToa6Zufrkj2b7e0PqstuOnN1gdAzjKSHwEJvdQThz-ruhge78cW2PaG0mCwQPvE72cX8OQiA)


 To try legacy Chrome(ium) specific theming (`< 59.0.30xx`), pass this option:

 ```
 --enable-chrome-legacy     enable legacy Chrome(ium) support (type: bool)
 ```

 The compressed `crx` files will be installed into `Adapta/chrome` and `Adapta-Nokto/chrome`.

 > **Note:**
 >
 >   * Chrome(ium) 59.0.30xx or newer, theming is pulled from Gtk+ 3.x directly.
 >     So `Settings > Appearance > Themes` should be `GTK+`.
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

Extra Tweetdeck Support
-----------------------
 To try "Colordeck for Tweetdeck" extension theming, pass this option:

 ```
 --enable-tweetdeck      enable Tweetdeck-colordeck support (type: bool)
 ```

 The installer installs `cdk` files into `Adapta*/tweetdeck` directories if Tweetdeck support is enabled.
 Then open the file via Colordeck -> import > "Colors" -> Choose File.

 > **Note:**
 >
 >   * [**Chrome Web Store**](https://chrome.google.com/webstore/detail/colordeck-for-tweetdeck/jgoilgghdiafcdpgaddhfnlnhjhiejjl)
 >   * [**Firefox Add-ons**](https://addons.mozilla.org/en-US/firefox/addon/colordeck/)
 >   * Light and dark variants are supported.
 >   * Currently those files support "Colors" only, so enabling "Colors" checkbox is enough.

Other Projects
------
This is a list of community projects, related to Adapta:
 - [**Adapta KDE**](https://github.com/PapirusDevelopmentTeam/adapta-kde) - Port of this theme to KDE Plasma 5.
 - [**Discord-Adapta-Nokto**](https://github.com/Scrumplex/Discord-Adpata-Nokto) - Adapta-oriented theme for Discord

Work in Progress
----------------
* Performance tuning
* Conversion to Gtk+ 4.0

TODO
----
* Prepare for Meson build system (priority: high)
* Prepare for x3 scaling (priority: mid or low)

Public License
--------------
 GPLv2.0

 > **Note:**
 >
 > SVG files are licensed under CC BY-SA 4.0.
 > And an icon-theme in Cinnamon thumbnails:
 > [**Paper Icons**](http://snwh.org/paper/icons) by Sam Hewitt is licensed under CC-SA-4.0.

Donations
---------


Special Thanks to
--------------
 Nana-4, the developer of Materia (formerly Flat-Plat).

 And all supporters, thank you.
