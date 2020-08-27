#!/bin/bash

echo "Checking RFCOMM."
#Check if the devices are paired
#if not paired, pair the devices
#check if rfcomm0 file exists
#https://linuxize.com/post/bash-check-if-file-exists/#:~:text=Check%20if%20File%20Exists,-When%20checking%20if&text=You%20can%20also%20use%20the,echo%20%22%24FILE%20exists.%22
FILE=/dev/rfcomm0
if [ ! -S "$FILE" ]; then
    echo "$FILE does not exist. Creating socket"
    #if it does not exists: rfcomm manual bind
    sudo rfcomm bind rfcomm0 ESP32_SinesTA
fi
#https://linux.die.net/man/1/rfcomm
#This binds the RFCOMM device to a remote Bluetooth device. 
#The command did not establish a connection to the remote device, it only creates the binding. 
#The connection will be established right after an application tries to open the RFCOMM device. 
#If no channel number is specified, it uses the channel number 1. 
#If the Bluetooth address is also left out, it tries to read the data from the config file.es
sh ./set_rfcomm.sh
#except
echo "$RFCOMM OK"

while :
do
  echo "Press CTRL+Z to EXIT."
  arecord -D hw:1,0 -f S16_LE -c1 -r44100 -s 43000 temp.wav
  python3 inference_bt.py temp.wav
done

