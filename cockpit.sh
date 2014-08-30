#!/usr/bin/env bash

CONFIG=~/.cockpit

echo -e "\nCOCKPIT** \npimping developer terminal workspace, by Team Vicious"
echo -e "-------"

checkConfigFile() {
  found=1
  if [[ ! -f $CONFIG ]];
  then
    found=0
  fi

  return $found
}


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
    tabName="${setting%%:*}"
    tabCmd="${setting##*:}"

    execute+=($fullscreen $tab --title="${tabName}" -e "bash -c '$tabCmd';bash")
  done
 echo ${#execute[@]} 
  if [ ${#execute[@]} -eq 1 ]
  then
    fault=1;
  else
    gnome-terminal "${execute[@]}"
  fi
}

loadCockpit() {
  if checkConfigFile
  then
    echo -e "\nFile Not Found!.\nCreated a new file at ~/.cockpit add your cockpit configuration and enjoy."
    echo -e  '\n\t eg: work( "vim:cd ~/project;vim") \n'
    echo "" >> ${CONFIG} 
    exit 0
  fi

 . $CONFIG
 config=${args[1]}
  
  parseConfig
}

fault=0;

for cmd in "${COMMANDS[@]}"
do
  key="${cmd%%:*}"
  value="${cmd##*:}"
  
  if [ ${args[0]} == $key ]
  then
    eval ${value}
  fi
done

if [ $fault == 1 ] 
then
  echo "Cockpit not found. Please confirm the at ~/.cockpit"
fi

exit 0
