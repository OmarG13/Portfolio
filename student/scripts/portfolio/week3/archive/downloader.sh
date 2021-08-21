#!/bin/bash

#prompt the user to type a website URL to download or type “exit” to quit.”
# prompt the user to type a download location
# use wget to download the webpage requested by the user
# repeat the process until the user types “exit”.
# Hint: Use the wget command to download a file!

exitcode=$input1

until [ "$exitcode" = "exit" ]
    do
        read -p "Type the website URL to download or type exit to quit: " input1
        read -p "Type download location: " input2
        wget -P $input2 $input1

    done

echo "Goodbye"

