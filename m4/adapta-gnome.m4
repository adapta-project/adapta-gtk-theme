# ADAPTA_GNOME ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_GNOME], [

    # check glib-2.0 version for determining GNOME env version
    GIO_VERSION=`$PKG_CONFIG --modversion glib-2.0`
    GIO_MAJOR_VERSION=`echo $GIO_VERSION | cut -d'.' -f1`
    GIO_MINOR_VERSION=`echo $GIO_VERSION | cut -d'.' -f2`

    AS_IF(
        [test `echo $GIO_MAJOR_VERSION` -eq "2"], [
            GNOME_SCSS_VERSION="3.24"
            AS_IF(
                # switch to gnome-shell 3.26 theming if GIO >= 2.53
                [test `echo $GIO_MINOR_VERSION` -ge "53"],
                [GNOME_SCSS_VERSION="3.26"]
            )
            AC_SUBST([GNOME_SCSS_VERSION])
            AC_MSG_RESULT([checking for Gnome-Shell SCSS version... $GNOME_SCSS_VERSION])
        ])
])
