#!/usr/bin/env sh
#
WIFIACTIVEICON=􀙇
WIFIINACTIVEICON=􀙈

CURRENT_WIFI="$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')"
SSID="$(echo "$CURRENT_WIFI" | awk '{for(i=1; i<=NF; i++) printf "%s",substr($i,1,1)}')"

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected" icon=$WIFIINACTIVEICON
else
  CURR_TX=$(/usr/local/bin/wifi | grep "TransmitRate" | awk -F ':' '{print $2}' | awk '{$1=$1};1')
  SPEED=$(awk -v num="$CURR_TX" 'BEGIN{ printf "%.2f MBps", num/8 }')

  sketchybar --set $NAME label="$SSID $SPEED" icon=$WIFIACTIVEICON
fi
