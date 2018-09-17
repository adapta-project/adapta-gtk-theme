# ADAPTA_COLOR_SCHEME ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_COLOR_SCHEME], [

    selection_default="`grep 'Indigo500' ./gtk/sass/common/_colors.scss | \
                        cut -d' ' -f3`"
    accent_default="`grep 'Indigo300' ./gtk/sass/common/_colors.scss | \
                     cut -d' ' -f3`"
    suggestion_default="`grep 'DPurple500' ./gtk/sass/common/_colors.scss | \
                         cut -d' ' -f3`"
    destruction_default="`grep 'Red500' ./gtk/sass/common/_colors.scss | \
                          cut -d' ' -f3`"

    AC_ARG_WITH(
        [selection_color],
        [AS_HELP_STRING(
            [--with-selection_color],
            [Primary color for selected-items \
             (Default: #3f51b5 (Indigo500))]
        )],
        [SELECTION="$withval"],
        [SELECTION=$selection_default]
    )
    AC_SUBST([SELECTION])

    AC_ARG_WITH(
        [accent_color],
        [AS_HELP_STRING(
            [--with-accent_color],
            [Secondary color for notifications and OSDs \
             (Default: #7986cb (Indigo300))]
        )],
        [ACCENT="$withval"],
        [ACCENT=$accent_default]
    )
    AC_SUBST([ACCENT])

    AC_ARG_WITH(
        [suggestion_color],
        [AS_HELP_STRING(
            [--with-suggestion_color],
            [Secondary color for 'suggested' buttons \
             (Default: #673ab7 (DPurple500))]
        )],
        [SUGGESTION="$withval"],
        [SUGGESTION=$suggestion_default]
    )
    AC_SUBST([SUGGESTION])

    AC_ARG_WITH(
        [destruction_color],
        [AS_HELP_STRING(
            [--with-destruction_color],
            [Tertiary color for 'destructive' buttons \
             (Default: #f44336 (Red500))]
        )],
        [DESTRUCTION="$withval"],
        [DESTRUCTION=$destruction_default]
    )
    AC_SUBST([DESTRUCTION])

# Store defined key color-scheme into SCSS file
echo \
"// Selection (Primary) color
\$key_selection_color: `echo $SELECTION`;

// Accent (Secondary) color
\$key_accent_color: `echo $ACCENT`;

// Suggestion (Secondary) color
\$key_suggestion_color: `echo $SUGGESTION`;

// Destruction (Tertiary) color
\$key_destruction_color: `echo $DESTRUCTION`;" \
> ./gtk/sass/common/resources/_key_colors.scss

AC_MSG_RESULT([creating ./gtk/sass/common/resources/_key_colors.scss])
])
