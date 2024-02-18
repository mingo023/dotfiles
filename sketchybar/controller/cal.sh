#!/usr/bin/env sh

CAL=$(date '+%a %d/%m %H:%M')

CALICON=􀉉

sketchybar --set $NAME icon=$CALICON label="$CAL"
