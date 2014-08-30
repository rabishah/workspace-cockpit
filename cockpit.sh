#!/usr/bin/env bash

. ~/.cockpit

args=("$@")

COMMANDS=(
  '-h:helper'
  'help:helper'
  'load:loadCockpit'
)

helper() {
  echo "cockpit load"
}

parseConfig() {
  tab="--tab"
  fullscreen="--full-screen"
  
  execute=""
  settingsName=${args[1]}
  settings="$settingsName[@]"
  
  for setting in "${!settings}"
  do
    echo $setting
    tabName="${setting%%:*}"
    tabCmd="${setting##*:}"

    execute+=($fullscreen $tab --title="${tabName}" -e "bash -c '$tabCmd';bash")
  done
  
  gnome-terminal "${execute[@]}"
}

loadCockpit() {
  config=${args[1]}
  
  parseConfig
}

for cmd in "${COMMANDS[@]}"
do
  key="${cmd%%:*}"
  value="${cmd##*:}"
  
  if [ ${args[0]} == $key ]
  then
    eval ${value}
  fi
done

exit 0
