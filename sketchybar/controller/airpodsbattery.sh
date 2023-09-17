#!/usr/bin/env sh

battery_info=$(system_profiler SPBluetoothDataType | grep 'Left Battery\|Right Battery')
LEFT_BATTERY=$(echo "$battery_info" | grep 'Left Battery' | awk '{print $4}' | tr -d '%')
RIGHT_BATTERY=$(echo "$battery_info" | grep 'Right Battery' | awk '{print $4}' | tr -d '%')

AIRPODICON=􁄡

PADDING=4

if [[ $LEFT_BATTERY = "" ]]; then
  sketchybar --set $NAME icon="" label="" \
    icon.padding_left=0 label.padding_left=0 \
    icon.padding_right=0 label.padding_right=0
else
  sketchybar --set $NAME icon=$AIRPODICON label="$LEFT_BATTERY%-$RIGHT_BATTERY% |" \
    icon.padding_left=$PADDING label.padding_left=$PADDING \
    icon.padding_right=$PADDING label.padding_right=$PADDING
fi
