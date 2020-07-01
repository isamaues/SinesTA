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
## Step 2: Installing small packages
Since tensorflow takes some time to download, let's begin with smaller packages that are also easier to debug.
- Numpy

  ```pip3 install numpy```
- SoundFile

  ```pip install soundfile```
## Step 3: Preparing Tensorflow

### Option 1 (Recommended) 
You can simply follow the Python Quickstart tutorial made by Tensorflow (link below) that will install just the Tensorflow Lite Interpreter that is what we need to run the yamnet.tflite file that represents the converted lite model of YAMNet, which is now optimized for embeded systems as the one being used.

Make sure you download the corresponding python version to your system.

https://www.tensorflow.org/lite/guide/python

### Option 2 (Advanced)
Tensorflow 2.0 implementation was not released on this version of the application but there are some tips that i can share about doing it all manually, since i have tried it myself before.

If you want it to run on Tensorflow 2.0, keep in mind that it is slower and requires more computational resources. There is also a Tensorflow version limitation when installing it via pip (only up to 1.14 which will throw some minor errors because of package dependencies). To solve that issue you can try to find an unofficial wheel for the 2.0 built by the community, it did work for tests. It is worth to mention that it took arround 1h20min for it to run, but it can vary, so be patient.

You will also need keras and change a few code lines to use Tensorflow 2.0 interpreter. If requested, a Tensorflow 2.0 compatible version can be released later.

