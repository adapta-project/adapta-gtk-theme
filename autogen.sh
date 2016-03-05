#!/bin/sh

set -e

test -z "$srcdir" && srcdir=$(dirname "$0")
test -z "$srcdir" && srcdir=.

cwd=$(pwd)
cd "$srcdir"

autoreconf --force --install --symlink --warnings=all

if test -z "${NOCONFIGURE}"; then
    set -x
    $srcdir/configure "$@"
fi
