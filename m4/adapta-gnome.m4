# ADAPTA_GNOME ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_GNOME], [

    GNOME_VERSION=`$GNOME_SHELL --version | cut -d' ' -f3 | cut -d'.' -f1-2`
    GNOME_MAJOR_VERSION=`echo $GNOME_VERSION | cut -d'.' -f1`
    GNOME_MINOR_VERSION=`echo $GNOME_VERSION | cut -d'.' -f2`

    AS_IF(
        [test `echo $GNOME_MAJOR_VERSION` -eq "3"], [

            # Check minimum required MINOR version
            AS_IF(
                [test `echo $GNOME_MINOR_VERSION` -lt "18"],
                [AC_MSG_ERROR(['gnome-shell >= 3.18' not met.])]
            )

            # Enable gnome_next if version was 3.25 or higher
            GNOME_SCSS_VERSION="3.24"
            AS_IF(
                [test `echo $GNOME_MINOR_VERSION` -gt "24"],
                [GNOME_SCSS_VERSION="3.26"]
            )
            AC_SUBST([GNOME_SCSS_VERSION])
            AC_MSG_RESULT([checking for Gnome-Shell SCSS version... $GNOME_SCSS_VERSION])
        ])
])
