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

# Uncomment the following line to display the contents of welcomemessage.txt
cat welcomemessage.txt

# Main loop
while true; do
    # TODO: Add your logic here
    
    # Example usage of the functions:
    current_directory="/home/schreifuchs"
    items=$(ls "$current_directory")
    print_all_items $items
    
done






