#!/bin/bash

tmux new -d -s "hodfords" -n "fb"

tmux send-keys -t "hodfords:fb" "cd ~/dev/work/diginex/framework-builder-api" C-m

tmux new-window -n 'esg'

tmux send-keys -t "hodfords:esg" "cd ~/dev/work/diginex/trustesg-backend" C-m

tmux new -d -s "server" -n "esg-frontend"
