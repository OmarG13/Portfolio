#!/bin/bash

# Set the color variables
blue='\033[34m'
green='\033[32m'
red='\033[31m'
purple='\033[35m'
cyan='\033[36m'

# Set variables

curl=$(which curl)
output="output.txt"
cleanedup="temp.txt"
url="https://owasp.org/www-project-top-ten/"

# Webpage dump with curl
function curlwebpage() {
    $curl -o $output $url
    check_errors
}

# Error checking for curl
function check_errors() {
    [ $? -ne 0 ] && echo "Error downloading page!" && exit -1
}

# Clean up webpage dump
function cleanup() {
    cat $output | html2text > $cleanedup
}

# Display top risks
function top() {
    grep -w "^A.*:" $cleanedup | awk '{print $1}'

}



# Display attack vectors




# Display impacts





# Sort by prevalence




# Sort by detectability





#########
#  run  #
#########

curlwebpage
cleanup


while [ $? -eq 0 ]
do 
    echo
    echo -e "$blue Select an option or type 'exit' to quit: "
    echo -e "$cyan 1. Display OWASP Top 3 Web Application Risks "
    echo " 2. Display Threat Agents/Attack Vectors "
    echo " 3. Display Impacts "
    echo " 4. Sort by Prevalence "
    echo " 5. Sort by Detectability "
    echo -e "$red 6. Exit "
    tput sgr0
    echo -n ">> "



read choice
    case $choice in

        1)
        $green top 
        tput sgr0
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
