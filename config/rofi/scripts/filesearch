#!/usr/bin/env bash

SEARCH=$@

if [ $ROFI_RETV -eq 1 ]
then
    coproc(xdg-open "$SEARCH" >/dev/null 2>&1)
    exit 0
fi

fd "$SEARCH" $COMMANDS
