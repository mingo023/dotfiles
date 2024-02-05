#!/usr/bin/env sh

sketchybar --add item telegram right                        \
           --set telegram script="$PLUGIN_DIR/telegram.sh"  \
           update_freq=24                                   \
           --subscribe telegram mouse.clicked
