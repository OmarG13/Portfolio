#!/bin/bash

# Script to check whether the user provided password is correct
# The user input for the password is checked against a saved hash
# of the correct password

# Request the input from the user

read -sp "Type your password: " password
echo

# Pipe the user input into sha256sum to check if the input matches the saved hash
echo "$password" | sha256sum -c --status ./password_folder/secrethash.txt

# If the response or exit is ok or "0", then the output is "Access Granted" otherwise 
# the response is "Access Denied"

if test $? -eq 0
then
    echo "Access Granted"
    exit 0
    
else
    echo "Access Denied"
    exit 1
    
fi

