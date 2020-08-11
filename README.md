# SinesTA
  Slightly modified version of the yamnet and tensorflow implementations used on a audio recognition research project with academic purpose. The project is still on development and tests stages so none of it has been published or presented yet.

## You will need:
- Raspberry Pi 3 B
- ESP 32
- Vibration Motor (A jumper cable may also be needed)
- USB Microphone or a USB P&P Soundcard + Microphone

Original version's repository:

https://github.com/tensorflow/models/tree/master/research/audioset/yamnet

## Changes made to the original projects:
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

  Changes were made to the original inference.py example file to be used with TFLite instead of the regular version of Tensorflow. It also sends a bluetooth message with the corresponding audio classsification to be translated to vibration codes by the ESP32 system.

- features_tflite.py:

  A modified version of features.py (original code). As exlplained on:
  
  https://medium.com/@antonyharfield/converting-the-yamnet-audio-detection-model-for-tensorflow-lite-inference-43d049bd357c

- yamnet.tflite:

  For compiling the a Lite version of the YAMNet model on raspberry pi.

## Installation

### 1. Raspberry Pi 3 B
- 1. Clone this repo and use the new installer:

```git clone https://github.com/isamaues/SinesTA/source```
 
- 2. Go to the project directory:

```cd SinesTA/source```

- 3. Run the installer by using the following command:

```sudo bash installer.sh```

Check the manual_installation_guide.md file for examples on running the application and a step by step guide to installing and running the application manually if the installation or the application examples does not run as expected.

### 2. ESP 32

#### Setting Vibration Motor
Check out the pin sheet of your ESP 32 and plug the corresponding pins of your vibration module that may vary from model to model. Some vibration models, as the one being used, already have build in voltage treatment, otherwhise you will need to build the entire system to control the voltage with resistors and stuff.

#### Uploading the arduino code to ESP32

Download the file VibrationDecoderESP32.ino and upload the same file to your ESP 32 board using Arduino IDE. If it's running, a built in led will turn on and you will be able to pair and bind the devices.

#### Encoded Classes and corresponding Vibration Patterns

This is the behavior you should expect from your ESP 32 while running this application.

```
'A' (Bark):                      1 Short Vibration.
'B' (Beep, bleep):               2 Short Vibrations.
'C' (Buzzer):                    1 Long Vibration.
'D' (Speech):                    2 Long Vibrations.
'E' (Baby cry, infant cry):      1 Short Vibration and 1 Long Vibration.
```

### 3. Setting Bluetooth

- 1. Pairing:

Warning: You just need to do this once for each new device connected. It works with only one device at a time.

We will perform an Outbound Pairing, as described on:

```https://core.docs.ubuntu.com/en/stacks/bluetooth/bluez/docs/reference/pairing/outbound```

You can just follow those steps and you it will be paired, but notice it's still not connected.

- 2. Binding:

- Automatic Binding:

- Manual Binding:

We need to creat the rfcomm socket that was not created automatically. simply run the commands above:

Make sure you're at root:
```cd```

Use your device MAC adress on "<device>":
  
```sudo rfcomm bind rfcomm0 <device> add```


Check out the manual_setting_bluetooth_guide.md for more details and a step by step guide on setting the bluetooth manually if it does not go as expected.

## Examples

- 1. Go to the project directory:

  ```cd SinesTA/source```

- 2. Run one of the following examples:

  - Uses a test file:
  
  ```python3 example.py```
  
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
  
  ## Run the Application (NEXT!)
  Endless running the aplication.
