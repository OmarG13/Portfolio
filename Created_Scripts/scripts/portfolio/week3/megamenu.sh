#!/bin/bash

# Set the color variable
blue='\033[34m'
green='\033[32m'
red='\033[31m'
purple='\033[35m'
cyan='\033[36m'

# Start the script by running the password checker
./megamenufiles/passwordcheck.sh

# While the output from the password check is ok or "0" a loop
# starts running displaying options for the user to select
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

# Set the choices from which the user can select to run various scripts
# including choosing to exit, otherwise once a script finishes the selected 
# script runs and exists, the user will return to the menu
    read choice
    case $choice in

        1)
        ./megamenufiles/foldermaker.sh
        ;;
        2)
        ./megamenufiles/foldercopier.sh
        ;;
        3)
        ./megamenufiles/setpassword.sh
        ;;
        4)
        ./megamenufiles//calculator.sh
        ;;
        5)
        ./megamenufiles/megafoldermaker.sh
        ;;
        6)
        ./megamenufiles/filenames.sh
        ;;
        7)
        ./megamenufiles/downloader.sh
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

