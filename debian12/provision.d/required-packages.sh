#!/bin/sh

REQUIRE_PACKAGES=$(grep -vE '^\s*#' requirements.txt)

# Install packages
MISSING=""
for PACKAGE in $REQUIRE_PACKAGES; do
    dpkg -s $PACKAGE >/dev/null 2>&1 || MISSING="$MISSING $PACKAGE"
done
[[ -n "$MISSING" ]] && apt-get update && apt-get install -y $MISSING