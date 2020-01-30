#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/info.sh"

print_branch_name() {
	 git_branch
  }

main() {
	 print_branch_name 
  }

main
