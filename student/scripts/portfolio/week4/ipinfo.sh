#!/bin/bash

# ifconfig | sed 's/inet/IP Address:/' # This also works fine

# Set the variable net_info
net_info="$(ifconfig)"

# Set addresses to echo net_info which runs the ifconfig command
# the output is then piped into sed. We use -n and the p flag at the
# end to output only the line of "inet " and we replace some words with
# clearer more desriptive words.

addresses=$(echo "$net_info" | sed -n '/inet / {
    s/inet/\n\IP Address:/
    s/netmask/\n\t\Subnet Mask:/
    s/broadcast/\n\t\Broadcast Address:/
    p
    }')

#We then echo the addresses output with a description before it
echo -e " The IP addreses on this computer are:\n\n$addresses"