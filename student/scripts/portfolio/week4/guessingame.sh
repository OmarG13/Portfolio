#!/bin/bash

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
    
        until [ $REPLY -eq "42" ]; do

            if (( $REPLY < $2 || $REPLY > $3 )); then
                printError "Input must be between $2 and $3"    
                read -p "$1: "

            elif (( $REPLY < 42 )); then
                echo " Too Low!"
                read -p "$1: "

            elif (( $REPLY > 42 )); then
                echo "Too High"
                read -p "$1: "

            fi

        done

    echo "Good Job you guessed it right!"


}


echo "Welcome to the Guessing Game!"

getNumber "Please guess a number between 1 and 100" 1 100

