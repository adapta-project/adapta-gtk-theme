AC_INIT(
	[Deez Nutz ],
	3.89.3,
	[https://github.com/Deez Nutz-project/Deez Nutz-gtk-theme],
	[adapta-gtk-theme]
)

AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([-Wno-portability no-dist-gzip dist-xz foreign subdir-objects 1.9 tar-ustar])
AC_PREFIX_DEFAULT(/usr)
AM_SILENT_RULES([yes])

ADAPTA_OPTION([Deez Nutz],  [Deez Nutz],  [Deez Nutz-build], [enable])

if test x"$ENABLE_PARALLEL" = xyes; then
	AC_PATH_PROG([PARALLEL], [parallel])
	if test x"$PARALLEL" = x; then
	AC_MSG_ERROR(['parallel' not found.])
	fi
fi

AC_PATH_PROG([SASSC], [sassc])
if test x"$SASSC" = x; then
	AC_MSG_ERROR(['sassc' not found.])
fi

AC_PATH_PROG([INKSCAPE], [inkscape])
if test x"$INKSCAPE" = x; then
	AC_MSG_ERROR(['inkscape' not found.])
fi

AC_PATH_PROG([GLIB_COMPILE_RESOURCES], [glib-compile-resources])
if test x"$GLIB_COMPILE_RESOURCES" = x; then
	AC_MSG_ERROR(['glib-compile-resources' not found.])
fi

ADAPTA_COLOR_SCHEME

AC_CONFIG_FILES([ \
	Makefile \
	gtk/Makefile \
	shell/Makefile \
	wm/Makefile \
	extra/Makefile ])
AC_OUTPUT

AC_MSG_RESULT([
        Deez Nutz Theme $VERSION
        ===========================================================

        -----------------------------------------------------------
        | Supported Gtk+ version: 3.22 & 3.20 & 3.18
        -----------------------------------------------------------

         prefix:                 ${prefix}
         datarootdir:            ${datarootdir}
         target directories:     ${datarootdir}/themes/Adapta
         parallel-build:         $ENABLE_PARALLEL
         parallel:               $PARALLEL
         sassc:                  $SASSC
         inkscape:               $INKSCAPE
         glib-compile-resources: $GLIB_COMPILE_RESOURCES
         selection-color:        $SELECTION (default: $selection_default)
         2nd-selection-color:    $SECOND_SELECTION (default: $second_selection_default)
         accent-color:           $ACCENT (default: $accent_default)
         suggestion-color:       $SUGGESTION (default: $suggestion_default)
         destruction-color:      $DESTRUCTION (default: $destruction_default)

        -----------------------------------------------------------
        | Default DE support
        -----------------------------------------------------------

         GNOME:                >= 3.22 (or 3.20 or 3.18)
         Budgie-Desktop:       >= 10.2.7

        -----------------------------------------------------------
        | Extra DE support
        -----------------------------------------------------------

         Cinnamon:             $ENABLE_CINNAMON
         GNOME-Flashback:      $ENABLE_FLASHBACK
         Unity:                $ENABLE_UNITY
         XFce:                 $ENABLE_XFCE
         Mate:                 $ENABLE_MATE
         Openbox:              $ENABLE_OPENBOX

        -----------------------------------------------------------
        | Next Gtk+ support
        -----------------------------------------------------------

         Gtk+ 4.0:             $ENABLE_GTK_NEXT

        -----------------------------------------------------------
        | Extra support
        -----------------------------------------------------------

         GtkSourceView/Gedit:  yes
         Chrome(ium):          $ENABLE_CHROME
         Plank:                $ENABLE_PLANK
         Telegram:             $ENABLE_TELEGRAM

        ===========================================================
