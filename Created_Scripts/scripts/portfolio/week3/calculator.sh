#!/bin/bash
#Simple Calculator with color coding

# Set color variables
blue='\033[34m'
green='\033[32m'
red='\033[31m'
purple='\033[35m'

# User Input
echo "Enter Two numbers"
read -p "First number: " a
read -p "Second number: " b
 
# Ask for operation choice
echo "Enter Choice :"
echo -e "$blue 1. Addition"
echo -e "$green 2. Subtraction"
echo -e "$red 3. Multiplication"
echo -e "$purple 4. Division"
tput sgr0

read choice
 
# calculator operations
case $choice in
  1)res=`echo $a + $b | bc`
  echo -e "$blue Result : $res"
  tput sgr0
  ;;
  2)res=`echo $a - $b | bc`
  echo -e "$green Result : $res"
  tput sgr0
  ;;
  3)res=`echo $a \* $b | bc`
  echo -e "$red Result : $res"
  tput sgr0
  ;;
  4)res=`echo "scale=2; $a / $b" | bc`
  echo -e "$purple Result : $res"
  tput sgr0
  ;;
  *) echo -e "$red INVALID CHOICE"
esac




