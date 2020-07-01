# Installation Guide
This is a tutorial for installing and running this application on a Raspberry Pi 3 B using Raspberry Pi OS (32-bit) with desktop (gcc 8.3.0).

## Audio Recognition
### Some Tips Before We Start
- Some of the following packages only work with python 3.6 or greater.
- Make sure you have your pip, pip3 and stuptools up to date, specially while using python 3.6.
To upgrade your setuptools you can simply use:

  ```pip install --upgrade setuptools```

- You do not need much more then apt, pip or conda installers, keep it simple to avoid version issues and package conflicts.
- Be patient, some packages take forever to build, but as long as it does not outputs an error, it is ok. :)

### Step 1: Clone This Repository

```git clone https://github.com/isamaues/tflite_model_audioset_yamnet_modified```

### Step 2: Installing Smaller Required Packages
Since tensorflow takes some time to download, let's begin with smaller packages that are also easier to debug.
- Numpy

  ```pip3 install numpy```
  
- SoundFile

  ```pip install soundfile```
  
### Step 3: Preparing Tensorflow

#### Option 1 (Recommended) 
You can simply follow the Python Quickstart tutorial made by Tensorflow (link below) that will install just the Tensorflow Lite Interpreter that is what we need to run the yamnet.tflite file that represents the converted lite model of YAMNet, which is now optimized for embeded systems as the one being used.

Make sure you download the corresponding python version to your system.

https://www.tensorflow.org/lite/guide/python#install_just_the_tensorflow_lite_interpreter

No need to follow the following instructions about running an inference using tflite_runtime, those changes were already made and it is all set. 

#### Option 2 (Advanced)
Tensorflow 2.0 implementation was not released on this version of the application but there are some tips that i can share about doing it all manually, since i have tried it myself before.

If you want it to run on Tensorflow 2.0, keep in mind that it is slower and requires more computational resources. There is also a Tensorflow version limitation when installing it via pip (only up to 1.14 which will throw some minor errors because of package dependencies). To solve that issue you can try to find an unofficial wheel for the 2.0 built by the community, it did work for tests. It is worth to mention that it took arround 1h20min for it to run, but it can vary, so be patient.

You will also need keras and change a few code lines to use Tensorflow 2.0 Interpreter. To use the correct interpreter, you need undo the changes done to the original code, as explained on the previous link. 

If requested, a Tensorflow 2.0 compatible version can be released later.

### Step 4: Running a Test Audio File
The file used is from a barking dog and was named DogWavMono0975secs1600hz15600samples.wav. The name, for now, seems unecessarily long but it is a reminder of the strict values of params that it needs to follow. The original source code was more dynamic but the used package (Resampy) could not be installed. To change those params, you have to keep in mind the mathematic nature of fourier transformations and make sure that the values correspond to eachother. 

You can play it out of curiosity by using:

```aplay DogWavMono0975secs1600hz15600samples.wav```

#### 1. Change to the the cloned repository directory:
  
  ```cd tflite_model_audioset_yamnet_modified```
  
#### 2. Run the modified inference script (inference6.py) on the given audio example:
 - Option 1

  ```python inference6.py DogWavMono0975secs1600hz15600samples.wav```
  
 - Option 2 (Recommended)
  
  Since Raspberry Pi OS usually has Python 2.7 as default for the python alias, you can try using the following command instead that has Python 3.7 as default.

  ```python3 inference6.py DogWavMono0975secs1600hz15600samples.wav```

The expected output should be something like:
  ```
  DogWavMono0975secs1600hz15600samples.wav :
  Animal      : 0.987
  Domestic animals, pets: 0.933
  Dog         : 0.912
  Canidae, dogs, wolves: 0.407
  Bark        : 0.271
  Enviando pattern A para o ESP32

  ```
## Audio Recording (Ongoing)
Not ready for usage.

### Step 1: Install PyAudio

#### 1. Before installing you need to know that PyAudio requires:

- portaudio19-dev

http://www.portaudio.com/download.html

- python-all-dev

  ???

#### 2. After Downloading the packages above you can proceed with pyaudio installation using:

```pip3 install pyaudio```
### Step 2: Recording

#### 1. Change to the the cloned repository directory:
  
  ```cd tflite_model_audioset_yamnet_modified```
  
#### 2. Run the record0975secs.py file using:

```python3 record0975secs.py```

Warning: If you run this command again it will write over the same file instead of making a new one.

### Step 3: Run the modified inference script (inference6.py) on the captured audio:

```python3 inference6.py test.wav```

