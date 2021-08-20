#!/bin/bash

# UV Index Recommendation Calculator
# 0-2 Low (Minimal protection required)
# 3-7 Moderate to High (Standard protection required)
# 8+ Very High to Extreme  (Full protective measures required)

read -p "Enter a UV index value from 0 - 11: " uvvalue

if [ "$uvvalue" -le 2 ]; then
    echo "UV level is Low. Minimal protection required."
elif [[ "$uvvalue" -ge 3 ]] && [[ "uvvalue" -le 7 ]]; then
    echo "UV level is Moderate. Standard protection required"
elif [[ "$uvvalue" -ge 8 ]] && [[ "uvvalue" -le 11 ]]; then
    echo "UV Value is Very High to Extreme. Full protective measures required"
else
    echo "Invalid Input - try again"

fi

exit 0