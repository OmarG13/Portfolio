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

    while (( $REPLY < $2 || $REPLY> $3 )); do

        printError "Input must be between $2 and $3"

        read -p "$1: "

    done

    if [ $REPLY = 42 ]; then
        echo -e "\033[32mCORRECT!\033[0m"
        exit 0
    
    elif [ $REPLY < 42 ]; 
    then
        printWrong "Too Low! Try Again..."
        read -p "$1: "
    
    elif [ $REPLY > 42 ]; 
    then
        printWrong "Too High! Try Again..."
        read -p "$1: "
    fi

}



echo "Welcome to the Guessing Game!"

getNumber "Please guess a number between 1 and 100" 1 100

