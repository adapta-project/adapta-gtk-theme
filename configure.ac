AC_INIT(
	[Adapta ],
	3.22.2,
	[https://github.com/adapta-project/adapta-gtk-theme],
	[adapta-gtk-theme]
)

AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([-Wno-portability no-dist-gzip dist-xz foreign subdir-objects 1.9 tar-ustar])
AC_PREFIX_DEFAULT(/usr)
AM_SILENT_RULES([yes])

ADAPTA_OPTION([PARALLEL],  [parallel],  [parallel-build], [disable])
ADAPTA_OPTION([GTK_NEXT],  [gtk_next],  [Gtk-3.24],       [disable])
ADAPTA_OPTION([CINNAMON],  [cinnamon],  [Cinnamon],       [disable])
ADAPTA_OPTION([FLASHBACK], [flashback], [Flashback],      [disable])
ADAPTA_OPTION([UNITY],     [unity],     [Unity],          [disable])
ADAPTA_OPTION([XFCE],      [xfce],      [XFce],           [disable])
ADAPTA_OPTION([MATE],      [mate],      [Mate],           [disable])
ADAPTA_OPTION([OPENBOX],   [openbox],   [Openbox],        [disable])
ADAPTA_OPTION([CHROME],    [chrome],    [Chrome(ium)],    [disable])
ADAPTA_OPTION([PLANK],     [plank],     [Plank],          [disable])

if test x"$ENABLE_PARALLEL" = xyes; then
	AC_PATH_PROG([PARALLEL], [parallel])
	if test x"$PARALLEL" = x; then
		AC_MSG_ERROR(['parallel' not found.])
	fi
fi

AC_PATH_PROG([BUNDLE], [bundle])
if test x"$BUNDLE" = x; then
	AC_MSG_ERROR(['bundle' not found.])
fi

AC_PATH_PROG([SASS], [sass])
if test x"$SASS" = x; then
	AC_MSG_ERROR(['sass' not found.])
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
        Adapta Gtk+ Theme $VERSION
        ===========================================================

        -----------------------------------------------------------
        | Supported Gtk+ version: 3.22 & 3.20 & 3.18
        -----------------------------------------------------------

         prefix:                 ${prefix}
         datarootdir:            ${datarootdir}
         target directories:     ${datarootdir}/themes/Adapta
                                 ${datarootdir}/themes/Adapta-Nokto
                                 ${datarootdir}/themes/Adapta-Eta
                                 ${datarootdir}/themes/Adapta-Nokto-Eta

         parallel-build:         $ENABLE_PARALLEL
         parallel:               $PARALLEL

         bundle:                 $BUNDLE
         sass:                   $SASS
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
         Budgie-Desktop:       >= 10.2.5

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

         Chrome(ium):          $ENABLE_CHROME
         Plank:                $ENABLE_PLANK

        ===========================================================
                             =>> run 'make' and 'sudo make install'
])
