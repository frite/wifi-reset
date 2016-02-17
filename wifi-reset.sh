#!/bin/bash
# Bring all wifi interfaces down.
# Identify wifi interfaces as rows from standard output of iwconfig (NOT standard
# error, those are non-wifi interfaces) which start without whitespace.
sleep 30
#A bit nasty but it works in case your kernel locks it.
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do rfkill unblock $x; ifdown $x; done
# Bring all wifi interfaces up.
sleep 30
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do ifup $x; done
