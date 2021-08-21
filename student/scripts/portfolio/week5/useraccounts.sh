#!/bin/bash

# Using awk to read, extract and format data from the /etc/passwd file

# We start off by first defining the seperator that we want awk to look for.
# We then commence by drawing a top line for the table and then we 
# define the colors and spacing for each header. This is then followed by more
# lines with the same spacing as the headers to close off the header section. 
# We then call awk to extract specific columns using defined colors and the same
# spacing as in the headers. 
# Finally we round off the table with a line to be at the botoom of the table.

awk 'BEGIN {
    FS=":";
    print "________________________________________________________________________________________________________";
    printf ("| \033[34m%-20s\033[0m | \033[34m%-10s\033[0m | \033[34m%-10s\033[0m | \033[34m%-28s\033[0m | \033[34m%-20s\033[0m |\n", "Username", "UserID", "GroupID", "Home", "Shell");
       
    printf ("| %-20s | %-10s | %-10s | %-28s | %-20s |\n", "____________________", "__________", "__________", "____________________________", "____________________")
    }

    {
    printf ("| \033[33m%-20s\033[0m | \033[35m%-10s\033[0m | \033[35m%-10s\033[0m | \033[35m%-28s\033[0m | \033[35m%-20s\033[0m |\n", $1, $3, $4, $6, $7)
    }

    
    END {
    print "________________________________________________________________________________________________________";
        
        }' /etc/passwd

# We start with a descriptive phrase for what we are doing, and then use awk to
# search for /etc/passwd for the ":" seperator and search for "/bin/bash" then 
# print the first column of that line

echo "Users only having "/bin/bash" listed as their default shell:"
echo
awk -F":" '/\/bin\/bash/{print $1}' /etc/passwd


