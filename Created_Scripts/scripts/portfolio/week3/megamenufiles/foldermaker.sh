#!/bin/bash


read -p "Type the name of the folder you wish to create: 
" foldername
mkdir -p "$foldername"
echo
echo -e "\033[32m ($foldername) folder created"

exit 0

