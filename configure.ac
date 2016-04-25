AC_INIT(
	[Adapta ],
	3.20.3,
	[https://github.com/tista500/Adapta],
	[adapta-gtk-theme]
)

AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([-Wno-portability no-dist-gzip dist-xz foreign subdir-objects 1.9 tar-ustar])
AC_PREFIX_DEFAULT(/usr)
AM_SILENT_RULES([yes])

ADAPTA_OPTION([CINNAMON],  [cinnamon],  [Cinnamon],  [disable])
ADAPTA_OPTION([FLASHBACK], [flashback], [Flashback], [disable])
ADAPTA_OPTION([UNITY],     [unity],     [Unity],     [disable])
ADAPTA_OPTION([XFCE],      [xfce],      [XFce],      [disable])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT

AC_MSG_RESULT([
        Adapta Gtk+ Theme $VERSION
        ========================

        * Supported Gtk+ version: 3.20 & 3.18
        -------------------------------------

        prefix:               ${prefix}
        datarootdir:          ${datarootdir}

        * Default DE support
        -------------------------------------

        GNOME:                >= 3.20 (or 3.18)
        Budgie-Desktop:       >= 10.2.4

        * Extra DE support
        -------------------------------------

        Cinnamon:             $ENABLE_CINNAMON
        GNOME-Flashback:      $ENABLE_FLASHBACK
        Unity:                $ENABLE_UNITY
        XFce:                 $ENABLE_XFCE

        run 'make' and 'sudo make install'.
])
