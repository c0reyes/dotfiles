#!/bin/sh
URL=https://wttr.in/salamanca
case "$1" in
    --popup)
        xdg-open ${URL} &
        ;;
    *)
        echo "$(wget ${URL}?format=4 2>/dev/null -O - | cut -d : -f 2) "
        ;;
esac
