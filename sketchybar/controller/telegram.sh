#!/bin/sh

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Telegram")
LABEL=""

if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"
fi

if [[ $LABEL == "" ]]; then
  sketchybar --set $NAME label="" icon="" label.drawing=off icon.drawing=off
else
  sketchybar --set $NAME label="${LABEL} |" icon="💬" label.drawing=on icon.drawing=on
fi

case "$SENDER" in
"mouse.clicked")
    open -a "Telegram"
    ;;
*)
esac
