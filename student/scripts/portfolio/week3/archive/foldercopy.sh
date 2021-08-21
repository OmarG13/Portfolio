#!/bin/bash


read -p "Folder to be copied:" source
read -p "Location for folder to be copied into:" destination
cp $source $destination

exit 0

