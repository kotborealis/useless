#!/bin/bash
#
client_ovp=$(<./client.ovpn)

# set server name
client_ovp=${client_ovp/my-server-1/$1}

# append ca.crt
ca=$(<$2)
client_ovp="$client_ovp\n\n<ca>\n$ca\n</ca>\n"

# append client.crt
cert=$(<$3)
client_ovp="$client_ovp\n<cert>\n$cert\n</cert>\n"

# append client.key
key=$(<$4)
client_ovp="$client_ovp\n<key>\n$key\n</key>\n"

echo -e "$client_ovp"