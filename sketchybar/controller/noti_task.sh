#!/bin/sh

PENDING_TASK=$(task +PENDING count)
OVERDUE_TASK=$(task +OVERDUE count)

if [[ $PENDING_TASK == 0 ]]; then
  sketchybar --set $NAME label="" icon="" label.drawing=off icon.drawing=off
else
  if [[ $OVERDUE_TASK == 0 ]]; then
          LABEL=$PENDING_TASK
  else
          LABEL="!$OVERDUE_TASK/$PENDING_TASK"
  fi

  sketchybar --set $NAME label="${LABEL} |" \
          label.drawing=on icon.drawing=on
fi
