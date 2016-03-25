Adapta
=========
<img src="img/Button.gif" alt="Button" align="right" />
An adaptive Gtk+ theme based on Material Design Guidelines.
Lots of elements are forked from Flat-Plat: https://github.com/nana-4/Flat-Plat

Elements
--------
![Materials](img/Materials.png)

Required Components
-------------------
* Gtk+-3.0 >= 3.20
* Gtk+-2.0 >= 2.24.30
* gtk2-engines-pixbuf >= 2.24.30

Legacy Gtk+ 3.18.x was moved to https://github.com/tista500/Adapta/tree/3.18.x

Supported Desktop Environments
------------------------------
* GNOME 3.20
  * gnome-shell >= 3.19.92
  * mutter >= 3.19.92
* GNOME-Flashback 3.18.x
  * metacity >= 3.18.1
  * gnome-panel >= 3.18.1
* budgie-desktop 10.2.4

Unsupported Gtk+ Based Desktops
-------------------------------
* Cinnamon
* Mate
* XFce4
* Pantheon

Installation
------------
1. Check `autoconf`, `automake` and `pkg-config` (`pkgconfig`) are installed.
2. Build and install system-wide:
   ```
   ./autogen.sh
   make
   sudo make install
   ```
   * Default prefix is `/usr`
   * `make` actually does nothing (for future release)

3. Use `gnome-tweak-tool` to change the theme.

Work in Progress
----------------
* Conversion to Gtk+ 3.20 or git master

TODO
----
* Add Cinnamon 2.8 theme styling (regardless)

Public License
--------------
* License: GPLv2

Special Thanks to
--------------
Nana-4, the developer of Flat-Plat.
