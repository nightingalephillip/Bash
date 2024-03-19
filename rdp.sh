#!/bin/bash

# Ask for username
read -p "Enter username: " username
# Ask for password
read -p "Enter password: " password
echo
read -p "Enter IP address: " ip

# Ask if there is a domain
read -p "Is there a domain? (yes/no): " domain_response
if [[ $domain_response == "yes" ]]; then
    read -p "Enter domain: " domain
    domain_arg="/d:$domain"
else
    domain_arg=""
fi

# Ask if the user wants to change the shared drive, default is /root
echo "The default shared drive is /root."
read -p "Do you want to change the shared drive? /root (yes/no): " drive_response
if [[ $drive_response == "yes" ]]; then
    read -p "Enter the shared drive path: " drive
else
    drive="/root"
fi

# Construct the command
command="xfreerdp /u:$username /p:$password /v:$ip $domain_arg /dynamic-resolution /drive:$drive"
# Echo the command to verify (optional)
echo "Command to execute: $command"

expect -c "
    spawn bash -c \"$command\"
    expect \"Do you trust the above certificate? (Y/N)\"
    send \"y\r\"
    interact
"
