#!/bin/bash

echo "Checking RFCOMM."
#check if rfcomm0 file exists
FILE=/dev/rfcomm0
if [ ! -S "$FILE" ]; then
    echo "$FILE does not exist. Creating socket"
    #if it does not exists: rfcomm manual bind
    echo "Binding Devices."
    sudo rfcomm bind rfcomm0 XX:XX:XX:XX:XX:XX
fi
echo "RFCOMM OK"
