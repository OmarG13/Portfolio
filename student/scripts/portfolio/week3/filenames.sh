#!/bin/bash

green='\033[32m'
red='\033[31m'

read -p "Please input file to check: 
" file
IFS=$'\n'
# file=$1
lines=$(cat $file)

for i in $lines

do
    if [ -f "$i" ]; then 
        echo -e "$green $i: That file exists"

    elif [ -d "$i" ]; then
        echo -e "$green $i: That's a directory"

    else 
        echo -e "$red $i: I don't know what that is!"
    fi

done


