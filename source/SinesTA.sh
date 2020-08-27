#!/bin/bash

sudo bash set_rfcomm.sh

while :
do
  echo "Press CTRL+Z to EXIT."
  arecord -D hw:1,0 -f S16_LE -c1 -r44100 -s 43000 temp.wav
  python3 inference_bt.py temp.wav
done

