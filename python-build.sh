#!/bin/bash

MUSL_GCC=$HOME/.local/share/musl-opteron/bin/musl-gcc
PYTHON_DIR="cpython-2.7"

if [[ ! -x "$MUSL_GCC" ]]
then
    echo "musl-gcc not found. Make sure to run ./musl.sh before running this script"
    exit 1
fi

cd $PYTHON_DIR || exit 1
CC=$MUSL_GCC \
CFLAGS="-std=c11 -static -no-pie" \
LDFLAGS="-static -no-pie" \
LINKFORSHARED=" " \
./configure \
    --without-threads \
    --without-ensurepip \
    --disable-shared \
    --prefix=/ \
    --libdir=/lib \
    --bindir=/app \
    ac_cv_file__dev_ptmx=no \
    ac_cv_file__dev_ptc=no \
    ac_cv_hav_long_long_format=yes \
    ac_cv_sizeof_pid_t=4

make -j"$(nproc)"
make install DESTDIR="$PWD/../dist/python-2.7"
