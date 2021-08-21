#!/bin/bash


read -p "Type the name of the folder you wish to create:" foldername
echo
mkdir -p "$foldername"

exit 0

