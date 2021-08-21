#!/bin/bash

# Script to create a directory and store a password in it.
# The password will be stored as a hash

read -p "Choose a folder to store the password:" folder
mkdir -p $folder
echo "Type your password"
read -s | sha256sum > ./$folder/secret.txt