#!bin/bash

echo "    | |  ___| |/ /"
echo " _  | | |_  | ' / "
echo "| |_| |  _| | . \\ "
echo " \\___/|_|   |_|\\_\\"
echo -e "\n \n"


# Takes a list of item names in directory
print_all_items() {
  local count=1
  folders=()
  for item in "$@"; do
    size=$(du -sh "$current_directory/$item" | cut -f 1)
    output="${count}) ${item}"
    padding=$((50 - ${#output}))
    printf "%s %.${padding}s %s\n" "$output" ". . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . " "$size"
    folders+=("$item")
    ((count++))
    if [ "$count" -gt $# ]; then
      break
    fi
  done
}


process_user_input() {
  if [[ $1 == "q" ]]; then
    is_running=0
  elif [[ $input =~ ^[0-9]+$ ]]; then
    local file_nr=$(($input-1))
    
    if [[ $file_nr -lt ${#folders[@]} && $file_nr -ge 0 ]]; then
      local dir=${folders[file_nr]} 
      current_directory+="/$dir"
    else
      echo "Invalid input!!"
    fi
  elif [[ $input == ".." ]]; then
    current_directory="${current_directory%/*}"
  elif [[ $input == "dd" ]]; then
    rm -r $current_directory
    current_directory="${current_directory%/*}"
  else
    echo "Invalid input!!"
  fi
}

cat welcomemessage.txt

current_directory=$HOME
is_running=1
# Main loop
while [ $is_running -eq 1 ]; do
    items=$(ls "$current_directory")
    print_all_items $items

    read -p "$current_directory >>>" input
    process_user_input $input
done
