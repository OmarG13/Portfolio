
#!/bin/bash 
      
read -p "Please provide the first week number to create: " x
read -p "Please provide the last week number to create: " y

#If there aren't two arguments to the script 
      
# if (( $#!=2 )); then 
      
#Print an error and exit 
      
# echo "Error, provide two numbers" && exit 1 
      
# fi 
      
#For every number between the first argument and the last 
      

for ((i = $x; i <= $y; i++)) 
      
do 
      
#Create a new folder for that number 
      
echo -e "\033[33m Creating directory number $i" 
      
mkdir "week$i" 
      
done 
     