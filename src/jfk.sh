#!bin/bash

echo "    | |  ___| |/ /"
echo " _  | | |_  | ' / "
echo "| |_| |  _| | . \\ "
echo " \\___/|_|   |_|\\_\\"
echo -e "\n \n"


# Takes a list of item names in directory
print_all_items () {
    # TODO: Implement this function
    for item in "$@"; do
        echo "$item"
    done
}

process_user_input() {
  if [[ $1 == "q" ]]; then
    is_running=0
  if [[ $string =~ ^[0-9]+$ ]]; then
    echo ${items[(($string))]}
  fi
}

# Uncomment the following line to display the contents of welcomemessage.txt
cat welcomemessage.txt

current_directory=$HOME
is_running=1
# Main loop
while [ $is_running -eq 1 ]; do
    items=$(ls "$current_directory")
    print_all_items $items

    read -p ">>> " input 
    process_user_input $input
done  
    