# ADAPTA_COLOR_SCHEME ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_COLOR_SCHEME], [

    selection_default="#FAA41A"
    second_selection_default="#FFB13D"
    accent_default="#48B9C7"
    suggestion_default="#73C48F"
    destruction_default="#F15D22"

    AC_ARG_WITH(
        [selection_color],
        [AS_HELP_STRING(
            [--with-selection_color],
            [Primary color for selected-items \
             (Default: #574F4A (Cyan500))]
        )],
        [SELECTION="$withval"],
        [SELECTION=$selection_default]
    )
    AC_SUBST([SELECTION])

    AC_ARG_WITH(
        [second_selection_color],
        [AS_HELP_STRING(
            [--with-second_selection_color],
            [Primary color for 'select' effects \
             (Default: #4DD0E1 (Cyan300))]
        )],
        [SECOND_SELECTION="$withval"],
        [SECOND_SELECTION=$second_selection_default]
    )
    AC_SUBST([SECOND_SELECTION])

    AC_ARG_WITH(
        [accent_color],
        [AS_HELP_STRING(
            [--with-accent_color],
            [Secondary color for notifications and OSDs \
             (Default: #48B9C7 (Teal300))]
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
             (Default: #009688 (Teal500))]
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
             (Default: #FF5252 (RedA200))]
        )],
        [DESTRUCTION="$withval"],
        [DESTRUCTION=$destruction_default]
    )
    AC_SUBST([DESTRUCTION])

# Store defined key color-scheme into SCSS file
echo \
"// Selection (Primary) color
\$key_selection_color: `echo $SELECTION`;

// Sub-selection-color
\$key_secondary_selection_color: `echo $SECOND_SELECTION`;

// Accent (Seondary) color
\$key_accent_color: `echo $ACCENT`;

// Suggestion color
\$key_suggestion_color: `echo $SUGGESTION`;

// Destruction (Tertiary) color
\$key_destruction_color: `echo $DESTRUCTION`;" \
> ./gtk/sass/common/_key_colors.scss

# Copy SCSS to shell SASS directory
cp -R ./gtk/sass/common/_key_colors.scss \
       ./shell/sass/common/_key_colors.scss

AC_MSG_RESULT([creating sass/common/_key_colors.scss])
])
