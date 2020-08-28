#!/bin/sh
echo "starting installation --------------------"
cd
apt-get update
pip install --upgrade pip
sudo apt-get install python3-pip
pip3 install --upgrade setuptools
echo "installing prerequisite packages"
pip3 install numpy
pip3 install soundfile
pip3 install https://dl.google.com/coral/python/tflite_runtime-2.1.0.post1-cp37-cp37m-linux_armv7l.whl
sudo apt install -y python3-scipy
sudo apt-get install libatlas-base-dev -y
echo "preparing to install llvmlite"
#pip3 install llvmlite #did not work so it required the manual installation as following
sudo apt-get install cmake -y
sudo apt-get install libedit-dev -y
sudo apt-get install libllvm-9-ocaml-dev libllvm9 llvm-9 llvm-9-dev llvm-9-doc llvm-9-examples llvm-9-runtime -y
LLVM_CONFIG=/usr/lib/llvm-9/bin/llvm-config pip3 install llvmlite
pip3 install --upgrade colorama
pip3 install resampy
echo "DONE (if no errors) :) ---------------------------------"
