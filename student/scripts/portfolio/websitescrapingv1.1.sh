#!/bin/bash

# Set the color variables
blue='\033[34m'
green='\033[32m'
red='\033[31m'
purple='\033[35m'
cyan='\033[36m'

# Set variables

curl=$(which curl)
regex=":"
output="output.txt"
cleanedup="temp.txt"

# Webpage dump with curl
function curlwebpage() {
    $curl -so $output "https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query="$input1"&search_type=all&isCpeNameSearch=false"
    check_errors
    
}

# Error checking for curl
function check_errors() {
    [ $? -ne 0 ] && echo -e "$red Error downloading page!" && exit -1
}

# Confirmation message with successful dump
function check_success() {
    [ $? -eq 0 ] && echo -e "$green \nResults of query successfully received. 
    \nPlease choose how to view your results by selecting options 2, 3, or 4. 
    \nAlternatively, please select option 1 to run a new query: "

}

# Clean up webpage dump
function cleanup() {
    cat $output | sed 's/<[^>]*>//g' > $cleanedup
}

# Display top risks
function top() {
    grep -w "^A.*:" $cleanedup | awk '{print $1}' | head -3

}

# Search for vulnerabilities
function search() {
    read -p "Please type keyword or CVE number (usage: CVE-....-.....) to search: " input1   
}



# Display Summary of results
function summary(){
    # Vuln summary
    grep -m10 "vuln-summary-" output.txt | sed 's/<[^>]*>//g; s/:/\n/g' > 1.txt
    sed -i 's/Published/ /g' 1.txt
    # Vuln ID
    grep -Pom10 ">CVE-\d{4}-\d{4,}" output.txt > 2.txt
    sed -i 's/[0-9][0-9][0-9][0-9][0-9]/&\n/g' 2.txt
    #Combine summary
    awk 'NR==FNR{a[NR]=$0; next}{print a[FNR], $0}' 2.txt 1.txt > 3.txt
    #Display summary
    awk 'BEGIN {
    FS="\t\t\t\t\t\t\t\t\t\t";
    print "_________________________________________________________________________________________________________";
    print " \033[34mCVE Number                                 Description         \033[0m ";
    }
    {
    print "_________________________________________________________________________________________________________";
    }
    {
    perl -lpe ' s/(.{60,}?)\s/$1\n\t   /g '
    }

    END {
    print "_________________________________________________________________________________________________________";
    }' ./3.txt


}
    


# Sort by prevalence




# Sort by detectability





#########
#  run  #
#########


while [ $? -eq 0 ]
do 
    echo
    echo -e "$blue Select an option or type 'exit' to quit: "
    echo -e "$cyan 1. Search for most recent vulnerabilities by name or CVE number "
    echo " 2. Display Top 10 summary of search results "
    echo " 3. Display CVSS severity of search results "
    echo " 4. Save findings to file "
    echo -e "$red 4. Exit "
    tput sgr0
    echo -n ">> "



read choice
    case $choice in

        1)
        search
        curlwebpage
        cleanup
        check_success
        ;;
        2)
        summary
        ;;
        3)
        ./megamenufiles/setpassword.sh
        ;;
        4)
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




