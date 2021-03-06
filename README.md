# SinesTA
  Slightly modified version of the yamnet and tensorflow implementations used on a audio recognition research project with academic purpose. The project is still on development and tests stages so none of it has been published or presented yet.
  
  This project was created based on hearing impaired people's necessities in a domestic environment. A relatively portable embedded system capable of encoding sound classfication to vibration patterns was created as a new concept of user feedback to improve the user's experience. The raspberry Pi will be constantly listenning to the enviromment and the portable ESP32 system will be tranlating the received classification codes to vibrations which will be recognizable by the user as they move around their home during dayly and domestic activities.

## You will need:
- Python 3.7 (other versions requires changes to the installer)
- Raspberry Pi 3 B
- ESP32
- Vibration Motor (A jumper cable may also be needed)
- USB Microphone or an USB P&P Soundcard + Microphone

## Changes made to the original projects:

Original version's repository:

https://github.com/tensorflow/models/tree/master/research/audioset/yamnet

### Files removed:

Those files are not used on the application.
- README.md
- inference.py
- yamnet_vizualization.ipynb
- yamnet_test.py
- features.py

All those files can still be found on the original repository mentioned above.

### Files added:
- inference_bt.py:

  Changes were made to the original inference.py example file for it to be used with TFLite instead of the regular version of Tensorflow. It also sends a bluetooth message with the corresponding audio classsification to be translated to vibration codes by the ESP32 system.

- features_tflite.py:

  A modified version of features.py (original code). As exlplained on:
  
  https://medium.com/@antonyharfield/converting-the-yamnet-audio-detection-model-for-tensorflow-lite-inference-43d049bd357c

- yamnet.tflite:

  For compiling the a Lite version of the YAMNet model on raspberry pi.

- Examples
- Audio Samples
- serial_Send.py
- set_rfcomm.sh
- SinesTA.sh

## Installation

### 1. Raspberry Pi 3 B
- 1. Clone this repo and use the new installer:

   ```git clone https://github.com/isamaues/SinesTA.git```
 
- 2. Go to the project directory:

   ```cd SinesTA/source```

- 3. Run the installer by using the following command:

   ```sudo bash installer.sh```

### 2. ESP32

#### Setting Vibration Motor
Check out the pin sheet of your ESP32 and plug the corresponding pins of your vibration module that may vary from model to model. Some vibration models, as the one being used, already have build in voltage treatment, otherwhise you will need to build the entire system to control the voltage with resistors and stuff.

#### Uploading the arduino code to ESP32

Download the file vibration_decoder_esp32.ino and upload the same file to your ESP32 board using Arduino IDE. If it's running, a built in led will turn on and you will be able to pair and bind the devices.

#### Encoded Classes and corresponding Vibration Patterns

This is the behavior you should expect from your ESP 32 while running this application.

```
'A' (Bark):                      1 Short Vibration.
'B' (Beep, bleep):               2 Short Vibrations.
'C' (Buzzer):                    1 Long Vibration.
'D' (Speech):                    2 Long Vibrations.
'E' (Baby cry, infant cry):      1 Short Vibration and 1 Long Vibration.
```

### 3. Adjusting the Microphone (Debug)

When recording, arecord may show some warnings like "busy device" or "file/directory not found" which means it did not find your microphone using the values on the script, which does work most of the time. In those cases, you will need to select your microphone based on the corresponding soundcard and device number. To check all the avaiable devices, just enter the following command for arecord to list all the available devices:

```arecord -l```

For me it shows the following message:

```
pi@raspberrypi:~/SinesTA/source $ arecord -l
**** List of CAPTURE Hardware Devices ****
card 2: Device [USB PnP Sound Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

It says "card 2" and "device 0", so for the files:

- SinesTa.sh
- example1.py
- example2.py

You will need to replace "hw:1,0", which are some default values that work most of the time, for "hw:2,0" or whatever value your pcm card and device are if:

- 1. Before starting, after trying those commands, you notice your hw values are different from 1,0.
- 2. The examples or the application does not run out of the box and errors like "no such file or directory found" are thrown after trying to do so.

Tip: You can also try to switch your device between ports and check if the values of pcm card and device has changed to the desired one by physically unpluging and plunging it back into a different USB port.

### 4. Setting Bluetooth

#### Pairing devices
Warning: You just need to do this once for each new device connected. It works with only one device at a time.

- If using a Raspberry Pi OS with GUI, simply click on the bluetooth icon on the top right corner and sellect Add device. A list of avaiable devices will appear and you select the device called "ESP32_SinesTA" or with any device name you have choosen previously to your ESP32 board or it's MAC adress. You can now click on pair with the desired device selected and they will be paired.

- You can alternatively connect via terminal or do it if it's the only avaiable option. For that, since it's easier to interact with the Pi, we will perform an Outbound Pairing, as described on:

   ```https://core.docs.ubuntu.com/en/stacks/bluetooth/bluez/docs/reference/pairing/outbound```

You can just follow those steps and the devices will be paired, but notice they are still not connected.

#### Connection:

## Enable SSP Profile on Raspberry Pi
It's actually enabling sdp profile and i'm using rfcomm(native) so it might be pointless.

- 1. Open Bluetooth service configuration file.

```sudo nano /etc/systemd/system/dbus-org.bluez.service```

- 2.Look for a line starts with “ExecStart” and add compatibility flag ‘-C’ at the end of the line.

```ExecStart=/usr/lib/bluetooth/bluetoothd -C```

- 3. Add a line below immediately after “ExecStart” line, then save and close the file.

```ExecStartPost=/usr/bin/sdptool add SP```

##### Set RFCOMM
The connection will only be open while Raspberry Pi is sending a message in bytes to ESP32 as a result of an iteration of the app.

- To find the MAC Address of your ESP32 you can get on the bluetooth terminal and list the paired devices using the following commands:

```bluetoothctl```

```paired-devices```

- To exit the terminal:

```exit```

- Go to the file called set_rfcomm.sh and replace the adress XX:XX:XX:XX:XX:XX for the MAC address you just found. Now the script will do it for you every time the Raspberry Pi is rebooted instead of doing it manually each time.

## Examples
You can use those examples to test if it's everything ready or run your own audio samples for personal tests. You can try the Kettle samples, which are not classified too get some random outputs as an expected behavior.

- 1. Go to the project's directory:

      ```cd SinesTA/source```

- 2. Run one of the following examples:

  - Uses a test file:
 
    ```python3 example1.py```
  
  The expected output should be something like:
  
  ```
  barkingDog.wav :
  Animal      : 0.987
  Domestic animals, pets: 0.933
  Dog         : 0.912
  Canidae, dogs, wolves: 0.407
  Bark        : 0.271
  Enviando pattern A para o ESP32
  ```
  
  - Records the enviroment and makes an inference 5 times:
  
    ```python3 example2.py```
  
## Run the Application
Endless running the aplication.

```cd SinesTA/source```

```sudo bash SinesTA.sh```
