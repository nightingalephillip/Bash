#!/bin/bash

if [ "$1" == "" ]
then
echo "You forgot an IP address!"
echo "Syntax: ./ipsweep.sh 192.168.1"

else
for ip in `seq 1 254` ; do
# for this IP in sequence of 1 - 254 we will do > 
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &  
# ping count 1 ($1 user input) ($ip user input)| find 64 bytes | cut delimiter by " " field 4 | translate delimiter ":" & allows threading
done

#run with bash ipsweep.sh "ip" example bash ipsweep.sh 192.168.100.1
fi
