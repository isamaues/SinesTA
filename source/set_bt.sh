#Check if the devices are paired
#if not paired, pair the devices
#check if rfcomm0 file exists
#https://linuxize.com/post/bash-check-if-file-exists/#:~:text=Check%20if%20File%20Exists,-When%20checking%20if&text=You%20can%20also%20use%20the,echo%20%22%24FILE%20exists.%22
FILE=/dev/rfcomm0
if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist. Creating socket"
    #if it does not exists: rfcomm manual bind
    sudo rfcomm bind rfcomm0 ESP32_SinesTA
fi
#after binding connect devices
