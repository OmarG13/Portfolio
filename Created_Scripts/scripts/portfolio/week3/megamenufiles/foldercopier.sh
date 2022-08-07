#!/bin/bash

read -p "type the name of the folder you would like to copy: " folderName

#if the name is a valid directory

if [ -d "$folderName" ]; then

    #copy it to a new location

    read -p "type the name of the destination folder: " newFolderName

    cp -r "$folderName" "$newFolderName"

    echo -e "\033[32m ($folderName) copied"

else

    #otherwise, print an error

    echo -e "\033[31m I couldn't find that folder"

fi