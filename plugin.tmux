#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/battery_info.sh"

tmux set -g status-right " |    ⎇  ${branch} |    ${battery}"
