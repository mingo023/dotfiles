#!/usr/bin/env bash

SPACE_ICONS=("chat" "web" "ide" "docs" "music" "terminal")
LIST_SPACES_INDEX=(C W I D M T)

ACTIVATE_COLORS=(
  "#8AD9ED"  # Chat
  "#4ECDC4"  # Web
  "#6DE85F"  # IDE
  "#C7F464"  # Docs
  "#FF6B6B"  # Music
  "#C72EFF"  # Terminal
)

DEACTIVATE=$GRAY

sketchybar --add event aerospace_workspace_change

for i in "${!LIST_SPACES_INDEX[@]}"; do
  sid=${LIST_SPACES_INDEX[i]}

  ACTIVATE=${ACTIVATE_COLORS[$i]}

  sketchybar --add item space.$sid left \
             --subscribe space.$sid aerospace_workspace_change \
             --set space.$sid \
                        icon=${SPACE_ICONS[i]}                    \
                        icon.padding_left=5                      \
                        icon.padding_right=5                     \
                        label.drawing=off                         \
                        icon.highlight_color=0xff${ACTIVATE:1} \
                        icon.font.style="Bold"  \
                        icon.font="JetBrainsMono Nerd Font:Bold:12.5" \
                        script="$PLUGIN_DIR/space.sh $sid"             \
                        click_script="aerospace workspace $sid"
done
