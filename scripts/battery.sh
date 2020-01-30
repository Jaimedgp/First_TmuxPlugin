#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/info.sh"

print_battery_status() {
	 get_battery 
  }

main() {
	 print_battery_status 
  }

main
