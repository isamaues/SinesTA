#!/bin/bash

echo "Checking RFCOMM."
#check if rfcomm0 file exists
FILE=/dev/rfcomm0
if [ ! -S "$FILE" ]; then
    echo "$FILE does not exist. Creating socket"
    #if it does not exists: rfcomm manual bind
    echo "Binding Devices."
    sudo rfcomm bind rfcomm0 ESP32_SinesTA
fi
echo "RFCOMM OK"

while :
do
  echo "Press CTRL+Z to EXIT."
  arecord -D hw:1,0 -f S16_LE -c1 -r44100 -s 43000 temp.wav
  python3 inference_bt.py temp.wav
done

