#!/usr/bin/env sh

sketchybar --add item taskwarrior left                               \
           --set      taskwarrior script="$PLUGIN_DIR/noti_task.sh"  \
                                  update_freq=120                    \
                                  padding_left=2                     \
                                  padding_right=2                    \
                                  background.border_width=0          \
                                  background.height=24               \
                                  icon=󱃔                    \
                                  icon.color=0xff${GREEN:1}            \
                                  label.color=0xff${GREEN:1}            \
