#!/usr/bin/env sh

CPU_USAGE=$(top -l  2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5 }')

CPUICON=􀫥

MAGENTA=#ff80ff

sketchybar -m --set $NAME icon=$CPUICON label="$CPU_USAGE%" label.color=0xff${MAGENTA:1} icon.color=0xff${MAGENTA:1}
