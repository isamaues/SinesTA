# Installation Guide
This is a tutorial for installing and running this application on a Raspberry Pi 3 B using Raspberry Pi OS (32-bit) with desktop (gcc 8.3.0).
## Some Tips Before we start
- Some of the following packages only work with python 3.6 or greater.
- Make sure you have your pip, pip3 and stuptools up to date, specially while using python 3.6.
To upgrade your setuptools you can simply use:

  ```pip install --upgrade setuptools```
- You do not need much more then apt, pip or conda installers, keep it simple to avoid version issues and package conflicts.
- Be patient, some packages take forever to build, but as long as it does not outputs an error, it is ok. :)

## Step 1: Clone this Repository
```git clone https://github.com/isamaues/tflite_model_audioset_yamnet_modified```
## Step 2: Preparing Tensorflow
This step is a bit tricky since it does not run out of the box because both Tensorflow lite and Tensorflow 2.0 are used in this application. There is also a tensorflow version limitation when installing it via pip (only up to 1.14 which will throw some minor errors because of package dependencies).

### 1 
First you can simply follow the Python Quickstart tutorial made by Tensorflow (link below) that will install just the Tensorflow Lite Interpreter that is what we need to run the yamnet.tflite file that represents the converted lite model of YAMNet, which is now optimized for embeded systems as the one being used.

Make sure you download the corresponding python version to your system.

https://www.tensorflow.org/lite/guide/python

### 2
On inference5.py source code the yamnet.py is still used to get the class names (apparently just reads the csv)
