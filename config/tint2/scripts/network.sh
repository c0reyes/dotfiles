#!/bin/sh
case "$1" in
    --popup)
        notify-send "Network IPs:" "$(printf "Local ip: %s\n" $(ifconfig | grep 'inet ' | awk '{print $2}')) $(printf "\n\nPublic ip: %s" $(curl --connect-timeout 10 -s ifconfig.co))"
        ;;
    *)
        echo "$(bwm-ng -o csv -c 1 | awk -F ';' '/total/ { if ($5 == 0) { printf("%4d Kb/s\n", 0) } else if ($5*8/1.0e3 < 1000) { printf "%4d Kb/s\n", ($5*8/1.0e3) } else { printf "%4d Mb/s\n", ($5*8/1.0e6)}}')"
        ;;
esac
