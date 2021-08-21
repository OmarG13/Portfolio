#!/bin/bash

# prompt the user to type a website URL to download or type “exit” to quit.”
# prompt the user to type a download location
# use wget to download the webpage requested by the user
# repeat the process until the user types “exit”.

while true
do
    read -p "Type the website URL to download or type exit to quit: 
    " input1
    
    if [ "$input1" = "exit" ]; then 
        echo -e "\033[31m Good Bye"
        tput sgr0
        break 
    fi

    read -p "Type download location: 
    " input2
    filename=$(eval echo $input2)
    wget -P $filename $input1
        if (test $? -ne 0); then
            echo -e "\033[31m Invalid input, please try again"
            tput sgr0
        else
            echo -e "\033[32m File successfully downloaded"
            tput sgr0
        fi

done