#!/bin/bash

# Script to create a directory and store a password in it.
# The password will be hidden while being typed

read -p "Choose a folder to store the password:" folder
mkdir -p $folder
echo "Type your password"
read -sp "" password
echo $password > ./$folder/secret.txt
