#!/bin/bash
#Created to run a list of IP addresses through enum4linux
# Ask for the location of the file
read -p "Enter the path to the file containing IP addresses: " file_path

# Check if the file exists
if [[ -f "$file_path" ]]; then
    # Loop through each IP address in the file
    while IFS= read -r ip; do
        echo "Enumerating $ip"
        enum4linux $ip
        # Optional: add a sleep command to avoid overwhelming the network or the target
        # sleep 1
    done < "$file_path"
else
    echo "File does not exist. Please check the path and try again."
fi
