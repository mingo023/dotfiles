#!/usr/bin/env sh

CAL=$(date '+%a %d %b - %H:%M %p')

CALICON=􀉉

sketchybar --set $NAME icon=$CALICON label="$CAL"
