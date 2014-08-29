#bin/bash

# titles of each tab 
titles=("Mice Server" "Gulp Running" "Code client" "Code server" "Cmd" "Mysql")

# list of commands
commands=(
	'cd ~/Documents/goservice/documentation/services/bin;./mice'
	'cd ~/Documents/documentation/microsite; gulp load --client hrsummit'
	'vim ~/Documents/documentation/microsite/themes/red_cheese/templates/about.jade'
	'vim ~/Documents/goservice/documentation/services/src/mice/resources/events/events.go'
	'clear'
	'mysql -uroot -p'
)

# options of gnome-terminal
tab="--tab"
fullscreen="--full-screen"

execute=""

count=0;
for command in "${commands[@]}"; do
  execute+=($fullscreen $tab --title="${titles[$count]}" -e "bash -c '$command';bash")
  count=$(( $count + 1 )) 
done

gnome-terminal "${execute[@]}"

exit 0
