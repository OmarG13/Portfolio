#!/bin/bash

blue='\033[34m'
green='\033[32m'
red='\033[31m'
purple='\033[35m'

read -sp "Enter Password: " password
echo
echo "$password" | sha256sum -c --status ./password_folder/secrethash.txt

if test $? -eq 0
then
    echo -e "$green Access Granted"
    tput sgr0
    exit 0
    
else
    echo -e "$red Access Denied"
    tput sgr0
    exit 1
    
fi

