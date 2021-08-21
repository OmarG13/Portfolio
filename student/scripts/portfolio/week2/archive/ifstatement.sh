#!/bin/bash

read -p "Try to guess the number from 1 - 10: " MYNUM

if [ "$MYNUM" -eq "7" ]
then
	echo "You got it!"
else
	echo "Try again"

fi

 exit 0