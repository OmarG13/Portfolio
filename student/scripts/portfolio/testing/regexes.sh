#!/bin/bash

while true 
do

    echo "Please select from the below options:"
    echo "1. Find all sed statements"
    echo "2. Find all lines that start with the letter m"
    echo "3. Find all lines that contain 3 digit numbers"
    echo "4. Find all echo statements with at least 3 words"
    echo "5. Find all lines that would make a good password"
    echo "0. EXIT"


    read choice
    case $choice in
        1) 
        grep --color -Ernwi "sed"
        ;;
        2)
        grep --color -Erni "^m"
        ;;
        3)
        grep --color -Ernw '[0-9]{3}'
        ;;
        4)
        grep --color -Ewnrio '(echo ")(\w+\W+){3,}'
        ;;
        5)
        grep --color -Eri '[a-z]{6,}[0-9]{1,}[!@#$%^&*]{1,}|[!@#$%^&*]{1,}[0-9]{1,}[a-z]{6,}|[0-9]{1,}[a-z]{6,}[!@#$%^&*]{1,}|[!@#$%^&*]{1,}[a-z]{6,}[0-9]{1,}'
        ;;
        0) exit 0
    esac
done

