#!/bin/bash -x

#Guessing game that uses getNumber() function

printError()

{

    echo -e "\033[31mERROR:\033[0m $1"

}

printWrong()

{

    echo -e "\033[31mWrong!\033[0m $1"

}


getNumber()

{

read -p "$1: "

    while true; do
        if [[ $REPLY -eq 42 ]]; then
        echo "CORRECTXXXXXXXXXX!"
        exit 0
        elif [[ $REPLY -lt 42 ]]; then
        echo "Too Low!"     
        read -p "$1: "       
        elif [[ $REPLY -gt 42 ]]; then
        echo "Too High!"
        read -p "$1: "
        fi
    done
   

}


echo "Welcome to the Guessing Game!"

getNumber "Please guess a number between 1 and 100" 1 100

