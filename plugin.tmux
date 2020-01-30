#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/info.sh"

battery="#[fg=colour196, bg=colour240, bold]|    $($CURRENT_DIR/scripts/battery.sh)   "


tmux set -g status-right "$battery"
