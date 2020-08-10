# Manual Installation Guide
This is a tutorial for installing and running this application on a Raspberry Pi 3 B using Raspberry Pi OS (32-bit) with desktop (gcc 8.3.0).

## Audio Recognition
### Some Tips Before We Start
- Some of the following packages only work with python 3.6 or greater.
- Make sure you have your pip, pip3 and stuptools up to date, specially while using python 3.6.
To upgrade your setuptools you can simply use:

  ```pip install --upgrade setuptools```
  
  and/or:
  
  ```pip3 install --upgrade setuptools```

- You do not need much more then apt, pip or conda installers, keep it simple to avoid version issues and package conflicts.
- Be patient, some packages take forever to build, but as long as it does not outputs an error, it is ok. :)

### Step 1: Clone This Repository

```git clone https://github.com/isamaues/tflite_model_audioset_yamnet_modified```

### Step 2: Installing Smaller Required Packages
Since tensorflow takes some time to download, let's begin with smaller packages that are also easier to debug.
- Numpy

  ```pip3 install numpy```
  
- SoundFile

  ```pip3 install soundfile```
  
### Step 3: Preparing Tensorflow

#### Option 1 (Recommended) 
You can simply follow the Python Quickstart tutorial made by Tensorflow (link below) that will install just the Tensorflow Lite Interpreter that is what we need to run the yamnet.tflite file that represents the converted lite model of YAMNet, which is now optimized for embeded systems as the one being used.

Make sure you download the corresponding python version to your system.

https://www.tensorflow.org/lite/guide/python#install_just_the_tensorflow_lite_interpreter

```pip3 install https://dl.google.com/coral/python/tflite_runtime-2.1.0.post1-cp37-cp37m-linux_armv7l.whl```

No need to follow the following instructions about running an inference using tflite_runtime, those changes were already made and it is all set. 

#### Option 2 (Advanced)
Tensorflow 2.0 implementation was not released on this version of the application but there are some tips that i can share about doing it all manually, since i have tried it myself before.

If you want it to run on Tensorflow 2.0, keep in mind that it is slower and requires more computational resources. There is also a Tensorflow version limitation when installing it via pip (only up to 1.14 which will throw some minor errors because of package dependencies). To solve that issue you can try to find an unofficial wheel for the 2.0 built by the community, it did work for tests. It is worth to mention that it took arround 1h20min for it to run, but it can vary, so be patient.

You will also need keras and change a few code lines to use Tensorflow 2.0 Interpreter. To use the correct interpreter, you need undo the changes done to the original code, as explained on the previous link. 

If requested, a Tensorflow 2.0 compatible version can be released later.

### Step 4: Getting Resampy to work
That is a confusing task that was supposed to be simple. If you go to the Resampy repository, they will tell you to simply install it via pip and you can try it for yourself now.

```pip3 install resampy```

If it does work for you, jump to the next step, if it does not you will need to follow the instructions below.

The problem is probably because pip can not build wheels for the most recent version of scipy, can't find the path for a llvm file so it won't build llvmlite as well and needs to update numba's colorama package. If it's asked, you may need to do all of those manually in order for it to work.

- Install scipy and llvmlite separatedly and then proceed to install resampy

#### Installing Scipy:
Since pip is not work we can use apt instead. The problem with using apt is that they don't usually are up to date and usually contains older versions but that's the only oficial option for now, but you can always try those wheels built by the community as well. When i ran the following command i only got the scipy 1.1, but it still worked fine with resampy.

```sudo apt update```

```sudo apt install -y python3-scipy```

#### Installing llvmlite:

You can also try to download it via pip

```pip3 install llvmlite```

The problem is that llvmlite does not find the path to llvm-config and you need to point that.

There are 2 scenarios.

- 1. You already have correct version of llvm installed and you just need to point the path for llvm-config file

To know which version you need of llvm, just check their PyPI page on:

https://pypi.org/project/llvmlite/

if that is your case, jump to step 3 of Installing llvmlite.

- 2. You have an older version or do not even have any instance of llvm on your device.

To know your version  or if you have llvm installed try:

```llvm --version```

if nothing is shown, you do not have it installed.

If that is you case, follow all the instructions above.

This process is the most complicated, and i'll also link the oficiall website so you can try both options.

http://llvmlite.pydata.org/en/latest/admin-guide/install.html

##### Step 1: Get Prerequisite packages:
When you try using pip, it will try to download the most recent version 0.33.0 or further which requires llvm 9 so we will need to install it first. But before we install llvm 9 we need to install some prerequisite packages: 
- On Linux:
  - g++ (>= 4.8) and CMake
  
  for that:
  
  ```sudo apt-get install cmake```
  
  - If building LLVM on Ubuntu, the linker may report an error if the development version of libedit is not installed. If you run into this problem, install libedit-dev.
  
  And for that:
  
  ```sudo apt-get install libedit-dev```
  
##### Step 2: Install LLVM:

Go to this website to get the desired version of llvm.

https://apt.llvm.org/

In our case, we wil need the llvm 9 for debian buster since that's what the Raspibian OS being used is based on.

Use this command:

```wget http://apt.llvm.org/buster/ llvm-toolchain-buster-9 main```

or this one:

```apt-get install clang-9 lldb-9 lld-9```

##### Step 3: Compile LLVM and Install llvmite:

- Point the path to llvm-config which is probably not in a standard location.
To know where it is, use:

```which llvm-config```

or:

```sudo find / -iname llvm-config```

Copy the path so we can set it as an argument for the following variable instantiation:

```LLVM_CONFIG=<path>```

Like in the following example: 

```LLVM_CONFIG=/opt/llvm/bin/llvm-config```

- Since we will be using the variable during the download, instantiate it right before the installing command, in the same line and run:

  ```LLVM_CONFIG=/opt/llvm/bin/llvm-config sudo pip3 install llvmlite```

- Now get into llvmlite directory and run:

  ```python3 setup.py build```
  
  And then:
  
  ```python3 setup.py install```
  
##### Step 4: Update Numba's Colorama Package:

```pi3 install --update colorama```

#### Installing Resampy:

Now it should run with no problems.

```pip3 install resampy```

### Step 5: Running a Test Audio File

The file used is from a barking dog and was named DogWavMono0975secs1600hz15600samples.wav. The name, for now, seems unecessarily long but it is a reminder of the strict values of params that it needs to follow. The original source code was more dynamic but the used library for generating the spectograms could not be used. To change those params, you have to keep in mind the mathematic nature of fourier transformations and make sure that the values correspond to eachother. 

#### 1. Change to the the cloned repository directory:

  ```cd```
  
  ```cd tflite_model_audioset_yamnet_modified```
  
Now that we moved to the application directory, you can also play the audio example by using:

```aplay DogWavMono0975secs1600hz15600samples.wav```
  
#### 2. Run the modified inference script (inference8.py) on the given audio example:
 - Option 1

  ```python3 inference8.py DogWavMono0975secs1600hz15600samples.wav```
  
 - Option 2 (Recommended)
  
  Since Raspberry Pi OS usually has Python 2.7 as default for the python alias, you can try using the following command instead that has Python 3.7 as default.

  ```python3 inference8.py DogWavMono0975secs1600hz15600samples.wav```

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

We will be using arecord and aplay, the command-line sound recorder and player for ALSA soundcard driver.

### Step 1: Record an Audio

#### 1. Get back to the the application directory

```cd tflite_model_audioset_yamnet_modified```

#### 2. Run the recording command

```arecord --device=hw:1,0 -f S16_LE -r 44100 -s 43000 test.wav```

Warning: If you run this command again it will write over the same file instead of making a new one. To create a different file from the previous one, give it a new name like test2.wav instead.

- If it does not run right out of the box, please consider reading the comments bellow.

Usually the avaiable format on sound cards is S16_LE, in my case it was the only one avaiable so that's the one being used, but arecord is compatible with other formats. What will make a difference is recording in a different sample rate, in that case we use it as -r 44100 because it's the only one avaiable on my microphone device. Some devices only record in 48000Hz or record in more than one sample rate. To make sure it's all set for the devices you have you can show the device information by using the following command.

```olhar os comandos para mostrar o sample rate do dispositivo e os formatos disponíveis ```

The -s command stands for the duration of the audio file. We are used to measure it in seconds but it's being measured in number of samples. The value also may change if you change  the -r value. Increase or decrease the -s value until it matches the required value for the inference script. Hopefully i'll come up with a way to deal with those variables values so you don't have to do so in the future.

After doing all that, it may not run out of the box because you need to specify the input device index. To list the devices you can simply use:
 
```arecord -l```
 
 if the card and device indexes are different of the hw values above, you can change the usb port of your device until it works (unplug and then plug the device on the corresponding port) or change those values from 1,0 to the desired ones.
 
### Step 2: Play the recorded audio:

```aplay test.wav ```

### Step 3: Run the modified inference script (inference8.py) on the captured audio:

```python3 inference8.py test.wav```
