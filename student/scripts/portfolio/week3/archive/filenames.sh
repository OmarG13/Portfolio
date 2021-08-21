#!/bin/bash

file=$1
lines=$(awk '{print $1}' $file)
for i in $lines
do
    if [ -f "$i" ]; then 
        echo "$i: That file exists"

    elif [ -d "$i" ]; then
        echo "$i: That's a directory"

    else 
        echo "$i: I don't know what that is!"
    fi

done


