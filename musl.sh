#!/bin/bash

MUSL_DIR="musl-${MUSL_VERSION:=1.2.6}"

cd musl-cross-make || exit 1
make "$MUSL_DIR"

cd "$MUSL_DIR" || exit 1
PREFIX="$HOME/.local/share/musl-opteron"
CFLAGS="-Os -march=opteron -mtune=opteron" ./configure \
    --prefix="$PREFIX" \
    --disable-shared

make -j"$(nproc)"
make install
