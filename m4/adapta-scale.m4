# ADAPTA_WEIGHTED_SCALE ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_WEIGHTED_SCALE], [

  scaling_weight_default="1.0"

    AC_ARG_WITH(
        [weighted_scaling],
        [AS_HELP_STRING(
            [--with-weighted_scaling],
            [Add coefficient to reduce spacing factors]
        )],
        [WEIGHTED_SCALE="0.7"],
        [WEIGHTED_SCALE=$scaling_weight_default]
    )
    AC_SUBST([WEIGHTED_SCALE])

# Store defined scaling coefficient into SCSS file
echo \
"// Weighted scaling coefficient
\$ref_weight: `echo $WEIGHTED_SCALE`;" \
> ./gtk/sass/common/_key_scale.scss

AC_MSG_RESULT([creating sass/common/_key_scale.scss])
])
