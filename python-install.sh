#!/bin/bash

PATH_TO_HELEONS="$1"
PYTHON_DIST="dist/python-2.7"

HELENOS_USPACE_OVERLAY="$PATH_TO_HELEONS/uspace/overlay"

mkdir -p "$HELENOS_USPACE_OVERLAY/app"
mkdir -p "$HELENOS_USPACE_OVERLAY/lib"

cp "$PYTHON_DIST/app/python2.7" "$HELENOS_USPACE_OVERLAY/app"
cp -r "$PYTHON_DIST/lib/python2.7" "$HELENOS_USPACE_OVERLAY/lib"
