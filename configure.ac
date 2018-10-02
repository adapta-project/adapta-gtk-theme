m4_define([adapta_major_version], [3])
m4_define([adapta_minor_version], [95])
m4_define([adapta_micro_version], [0])
m4_define([adapta_version], [adapta_major_version.adapta_minor_version.adapta_micro_version])
m4_define([adapta_git_url], [https://github.com/adapta-project/adapta-gtk-theme])

AC_INIT(
	[Adapta ],
	[adapta_version],
	[adapta_git_url],
	[adapta-gtk-theme]
)
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([
	-Wno-portability \
	no-dist-gzip \
	dist-xz \
	foreign \
	subdir-objects \
	1.9 \
	tar-ustar
])
AC_PREFIX_DEFAULT(/usr/local)
AM_SILENT_RULES([yes])

ADAPTA_OPTION([PARALLEL],     [parallel],     [parallel-build],      [disable])
ADAPTA_OPTION([GTK_NEXT],     [gtk_next],     [Gtk-4.0],             [disable])
ADAPTA_OPTION([GNOME],        [gnome],        [Gnome-Shell],         [enable])
ADAPTA_OPTION([CINNAMON],     [cinnamon],     [Cinnamon],            [enable])
ADAPTA_OPTION([FLASHBACK],    [flashback],    [Flashback],           [enable])
ADAPTA_OPTION([XFCE],         [xfce],         [XFce],                [enable])
ADAPTA_OPTION([MATE],         [mate],         [Mate],                [enable])
ADAPTA_OPTION([OPENBOX],      [openbox],      [Openbox],             [enable])
ADAPTA_OPTION([CHROME_LEGACY],[chrome_legacy],[Chrome(ium)-legacy],  [disable])
ADAPTA_OPTION([PLANK],        [plank],        [Plank],               [disable])
ADAPTA_OPTION([TELEGRAM],     [telegram],     [Telegram],            [disable])
ADAPTA_OPTION([TWEETDECK],    [tweetdeck],    [Tweetdeck-Colordeck], [disable])

PKG_PROG_PKG_CONFIG
AS_IF([test -z "$PKG_CONFIG"], [AC_MSG_ERROR(['pkg-config' not found.])])

PKG_CHECK_MODULES(GDK_PIXBUF, [gdk-pixbuf-2.0 >= 2.32.2])
PKG_CHECK_MODULES(GLIB,       [glib-2.0 >= 2.48.0])

AC_PATH_TOOL([GLIB_COMPILE_RESOURCES], [glib-compile-resources])
if test x"$GLIB_COMPILE_RESOURCES" = x; then
	AC_MSG_ERROR(['glib-compile-resources' not found.])
fi

AC_PATH_TOOL([INKSCAPE], [inkscape])
if test x"$INKSCAPE" = x; then
	AC_MSG_ERROR(['inkscape' not found.])
fi

AC_PATH_TOOL([SASSC], [sassc])
if test x"$SASSC" = x; then
	AC_MSG_ERROR(['sassc' not found.])
fi

if test x"$ENABLE_PARALLEL" = xyes; then
	AC_PATH_TOOL([PARALLEL], [parallel])
	if test x"$PARALLEL" = x; then
		AC_MSG_ERROR(['parallel' not found.])
	fi
fi

if test x"$ENABLE_GNOME" = xyes; then
	ADAPTA_GNOME
fi
AM_CONDITIONAL(GNOME_IS_326_OR_NEWER, [test x"$GNOME_SCSS_VERSION" = x3.26])

ADAPTA_COLOR_SCHEME

AC_CONFIG_FILES([
	Makefile \
	gtk/Makefile \
	shell/Makefile \
	wm/Makefile \
	extra/Makefile
])
AC_OUTPUT
AC_MSG_RESULT([
        Adapta Gtk+ Theme $VERSION
        =================================================================

         prefix:                 ${prefix}
         datarootdir:            ${datarootdir}
         target directories:     ${datarootdir}/themes/Adapta
                                 ${datarootdir}/themes/Adapta-Nokto
                                 ${datarootdir}/themes/Adapta-Eta
                                 ${datarootdir}/themes/Adapta-Nokto-Eta

         glib-compile-resources: $GLIB_COMPILE_RESOURCES
         inkscape:               $INKSCAPE
         sassc:                  $SASSC

         parallel-build:         $ENABLE_PARALLEL (default: no)
         parallel:               $PARALLEL

         selection-color:        $SELECTION (default: $selection_default)
         accent-color:           $ACCENT (default: $accent_default)
         suggestion-color:       $SUGGESTION (default: $suggestion_default)
         destruction-color:      $DESTRUCTION (default: $destruction_default)

        -----------------------------------------------------------------
        | Supported Gtk+ Version
        -----------------------------------------------------------------

         Gtk+ 2.0:               always
         Gtk+ 3.20:              always
         Gtk+ 3.22:              always
         Gtk+ 3.24:              always
         Gtk+ 4.0:               $ENABLE_GTK_NEXT (default: no)

        -----------------------------------------------------------------
        | DE and WM Support
        -----------------------------------------------------------------

         Budgie-Desktop:         always (>= 10.4)
         GNOME:                  $ENABLE_GNOME (SCSS ver. $GNOME_SCSS_VERSION) (default: yes)
         Cinnamon:               $ENABLE_CINNAMON (default: yes)
         GNOME-Flashback:        $ENABLE_FLASHBACK (default: yes)
         XFce:                   $ENABLE_XFCE (default: yes)
         Mate:                   $ENABLE_MATE (default: yes)
         Openbox:                $ENABLE_OPENBOX (default: yes)

        -----------------------------------------------------------------
        | Extra Support
        -----------------------------------------------------------------

         GtkSourceView/Gedit:    always
         Chrome(ium)-legacy:     $ENABLE_CHROME_LEGACY (default: no)
         Plank:                  $ENABLE_PLANK (default: no)
         Telegram:               $ENABLE_TELEGRAM (default: no)
         Tweetdeck-Colordeck:    $ENABLE_TWEETDECK (default: no)

        =================================================================
                                   =>> run 'make' and 'sudo make install'
])
