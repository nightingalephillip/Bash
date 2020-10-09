#!/bin/bash

for ip in $(cat ip.txt);
do nmap -sS -A -T4 -v $ip &
done
