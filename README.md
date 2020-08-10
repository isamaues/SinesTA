# SinesTA
  Slightly modified version of the yamnet and tensorflow implementations used on a audio recognition research project with academic purpose. The project is still on development and tests stages so none of it has been published or presented yet.

Original version's repository:

https://github.com/tensorflow/models/tree/master/research/audioset/yamnet

## Files removed:

Those files are not used on the application.
- README.md
- inference.py
- yamnet_vizualization.ipynb
- yamnet_test.py
- features.py

All those files can still be found on the original repository as mentioned above.

## Files added:
- inference9.py:

  Changes were made to the original inference.py example file to be used with TFLite instead of the regular version of Tensorflow. Now it also sends a bluetooth message with the corresponding audio classsification to be translated to vibration codes by the ESP32 system.

- features_tflite.py:

  A modified version of features.py (original code). As exlplained on:
  
  https://medium.com/@antonyharfield/converting-the-yamnet-audio-detection-model-for-tensorflow-lite-inference-43d049bd357c

- yamnet.tflite:

  For compiling the a Lite version of the YAMNet model on raspberry pi.

# Installation
- 1. Clone this repo and use the new installer:

```git clone https://github.com/isamaues/SinesTA/source```
 
- 2. Go to the project directory:

```cd SinesTA/source```

- 3. Run the installer by using the following command:

```sudo bash installertest.sh```

Check the INSTALLATION_GUIDE file for examples on running the application and a step by step guide to installing and running the application manually if the installation or the application examples does not run as expected.

# Examples (Ongoing)

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
  
  # Run the Application (NEXT!)
  Endless running the aplication.
