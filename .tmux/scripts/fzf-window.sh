#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/.envs"

current_window_origin=$(tmux display-message -p '#S:#I: #{window_name}')
current_window=$(tmux display-message -p '#S:#I:')
if [[ -z "$TMUX_FZF_WINDOW_FORMAT" ]]; then
    windows=$(tmux list-windows -a)
else
    windows=$(tmux list-windows -a -F "#S:#{window_index}: $TMUX_FZF_WINDOW_FORMAT")
fi

FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --header='Select an action.'"

# if [[ -z "$1" ]]; then
#     action=$(printf "switch\nlink\nmove\nswap\nrename\nkill\n[cancel]" | eval "$TMUX_FZF_BIN $TMUX_FZF_OPTIONS")
# else
#     action="$1"
# fi
#
action="switch"

[[ "$action" == "[cancel]" || -z "$action" ]] && exit
if [[ "$action" == "link" ]]; then
  echo "hihi"
elif [[ "$action" == "move" ]]; then
  echo "hihi"
else
    FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --header='Select target window.'"
    windows=$(echo "$windows" | grep -v "^$current_window")
    target_origin=$(printf "%s\n[cancel]" "$windows" | eval "$TMUX_FZF_BIN $TMUX_FZF_OPTIONS")
    [[ "$target_origin" == "[cancel]" || -z "$target_origin" ]] && exit
    target=$(echo "$target_origin" | sed 's/: .*//')
    echo "$target" | sed 's/:.*//g' | xargs -I{} tmux switch-client -t {}
    echo "$target" | xargs -I{} tmux select-window -t {}
fi
