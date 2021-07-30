#!/bin/sh
TMP=/tmp/checkupdates

if [ ! -f ${TMP} ]; then
    echo "0" > ${TMP}
fi

MODSECS=$(date --utc --reference=${TMP} +%s)
NOWSECS=$(date +%s)
DELTA=$((${NOWSECS}-${MODSECS}))

if [ ${DELTA} -gt 3600 ]; then
    checkupdates | wc -l > ${TMP}
fi

case "$1" in
    --update)
        termite -e 'sh -c "sudo pacman -Syu ; echo Finished, press enter to close; read; killall -SIGUSR1 tint2"'
        ;;
    *)
        echo "⛁ $(cat ${TMP})"
        ;;
esac
