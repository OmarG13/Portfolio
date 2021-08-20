#!/bin/bash

blue='\033[34m'
green='\033[32m'
red='\033[31m'
purple='\033[35m'
cyan='\033[36m'

./passwordcheck.sh

while [ $? -eq 0 ]
do 
    echo
    echo -e "$blue Select an option or type 'exit' to quit: "
    echo -e "$cyan 1. Create a folder "
    echo " 2. Copy a folder "
    echo " 3. Set a password "
    echo " 4. Calculator "
    echo " 5. Create Numbered Weekly Folders "
    echo " 6. Check Filenames "
    echo " 7. Download a file "
    echo -e "$red 8. Exit "
    tput sgr0
    echo -n ">> "

    read choice
    case $choice in

        1)
        ./foldermaker.sh
        ;;
        2)
        ./foldercopier.sh
        ;;
        3)
        ./setpassword.sh
        ;;
        4)
        ./calculator.sh
        ;;
        5)
        ./megafoldermaker.sh
        ;;
        6)
        ./filenames.sh
        ;;
        7)
        ./webdownloader.sh
        ;;
        8)
        echo -e "$green Thank you for using menu.sh"
        exit 0
        ;;
        exit)
        echo -e "$green Thank you for using menu.sh"
        exit 0
        ;;
        *)
        echo invalid selection
        ;;
    esac

done
echo "Thank you for using menu.sh"

