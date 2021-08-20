#!/bin/bash

read -sp "Type your password: " password
echo
echo "$password" | sha256sum -c --status ./password_folder/secrethash.txt
if test $? -eq 0
then
    echo "Access Granted"
    exit 0
    
else
    echo "Access Denied"
    exit 1
    
fi

