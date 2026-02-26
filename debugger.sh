#!/opt/homebrew/bin/bash

debug() {
  local activate_debug=$1
  local custom_message=$2

  local yellow_color_190='\x1b[38;5;190m'
  local blue_color_12='\x1b[38;5;12m'
  local end_color='\x1b[0m'

  if ! $activate_debug; then
    return 0
  else
    echo -e "$blue_color_12[DEBUG] $end_color$yellow_color_190$custom_message$end_color"
    return 0
  fi
}
