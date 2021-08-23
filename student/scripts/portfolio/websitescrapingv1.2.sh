#!/bin/bash

# Set the color variables
blue='\033[34m'
green='\033[32m'
red='\033[31m'
purple='\033[35m'
cyan='\033[36m'

# Set variables

curl=$(which curl)
output="tempoutput.txt"
cleanedup="temp.txt"
temp1="temp1.txt"
temp2="temp2.txt"
temp3="temp3.txt"
temp4="temp4.txt"
temp5="temp5.txt"
temp6="temp6.txt"

# Security question
function password(){
./.hiddenfolder/passwordcheck.sh
}


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
    [ $? -eq 0 ] && echo -e "$green\nResults of query successfully received. \nPlease choose how to access your results by selecting options 2, 3, or 4. \nAlternatively, please select option 1 to run a new query: "

}

# Clean up webpage dump
function cleanup() {
    cat $output | sed 's/<[^>]*>//g' > $cleanedup
}


# Search for vulnerabilities
function search() {
    read -p "Please type keyword or CVE number (usage: CVE-....-.....) to search: " input1   
}

# Tidy up the space after script is complete
function tidyup() {
    rm $output $cleanedup $temp1 $temp2 $temp3 $temp4 $temp5 $temp6 2> /dev/null
}

# Display Summary of results
function summary(){
    # Vuln summary
    grep -m10 "vuln-summary-" $output | sed 's/<[^>]*>//g; s/:/\n/g' > $temp1
    sed -i 's/Published/ /g' $temp1
    # Vuln ID
    grep -Pom10 ">CVE-\d{4}-\d{4,}" $output > $temp2
    sed -i 's/[0-9][0-9][0-9][0-9][0-9]/&\n/g' $temp2
    #Combine summary
    awk 'NR==FNR{a[NR]=$0; next}{print a[FNR], $0}' $temp2 $temp1 > $temp3
    sed -i ':a;N;$!ba;s/\n/\n_________________________________________________________________________________________\n /g' 3.txt
    #Display summary
    echo -e "_________________________________________________________________________________________________________";
    echo -e " \033[34mCVE Number                                 Description         \033[0m "
    echo -e "_________________________________________________________________________________________________________";
    perl -lpe ' s/(.{60,}?)\s/$1\n\t   /g ' $temp3
}
    


# Display CVSS Severity
function severity(){
    # Vuln severity
    grep -m10 "vuln-cvss3-" $output | sed 's/<[^>]*>//g; s/:/\n/g' > $temp4
    grep -woP '.[0-9].{7}' $temp4 > $temp5
    # Vuln ID
    grep -Pom10 ">CVE-\d{4}-\d{4,}" $output > $temp2
    sed -i 's/[0-9][0-9][0-9][0-9][0-9]/&\n/g' $temp2
    #Combine summary
    awk 'NR==FNR{a[NR]=$0; next}{print a[FNR], $0}' $temp2 $temp5 > $temp6
    sed -i ':a;N;$!ba;s/\n/\n_________________________________________________________________________________________\n /g' 3.txt
    #Display summary
    echo -e "_________________________________________________________________________________________________________";
    echo -e " \033[34mCVE Number                                 Description         \033[0m "
    echo -e "_________________________________________________________________________________________________________";
    perl -lpe ' s/(.{60,}?)\s/$1\n\t   /g ' $temp6
}




#########
#  run  #
#########

password

while [ $? -eq 0 ]
do 
    echo
    echo -e "$blue Select an option or type 'exit' to quit \n$red Please note that exiting the menu removes history of the search: "
    echo -e "$cyan 1. Search for most recent vulnerabilities by name or CVE number "
    echo " 2. Display Top 10 summary of search results "
    echo " 3. Display CVSS severity of search results "
    echo " 4. Save findings to file "
    echo -e "$red 5. Exit "
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
        severity
        echo -e "$red Please note that only CVE numbers with recorded CVSS ratings are displayed\n"
        ;;
        4)
        cat temp3.txt > "${input1}_searchsummary.txt"
        cat temp6.txt > "${input1}_severity.txt"
        ;;
        5)
        echo -e "$green Thank you for using webscraper_v1.2.sh"
        tidyup
        exit 0
        ;;
        exit)
        echo -e "$green Thank you for using webscraper_v1.2.sh"
        tidyup
        exit 0
        ;;
        *)
        echo invalid selection
        ;;
    esac

done
tidyup
echo "Thank you for using webscraper_v1.2.sh"

#######
# END #
#######

