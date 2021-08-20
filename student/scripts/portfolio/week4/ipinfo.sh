#!/bin/bash

# ifconfig | sed 's/inet/IP Adress:/' # This works fine

net_info="$(ifconfig)"

addresses=$(echo "$net_info" | sed -n '/inet / {
    s/inet/\n\IP Adress:/
    s/netmask/\n\t\Subnet Mask:/
    s/broadcast/\n\t\Broadcast Address:/
    p
    }')


echo -e " The IP addreses on this computer are:\n\n$addresses"