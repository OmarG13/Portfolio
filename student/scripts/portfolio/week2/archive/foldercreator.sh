#!/bin/bash


read -p "Type the name of the folder you wish to create: 
" foldername

mkdir -p "$foldername"

echo "Folder:($foldername) has been created"

exit 0

