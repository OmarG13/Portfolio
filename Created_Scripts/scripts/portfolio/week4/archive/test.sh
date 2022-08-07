#!/bin/bash
count=1
for ((i=0; i<100; i++))
do 
    echo "repeated $count times"
    (( count++ ))
   done
exit 0
