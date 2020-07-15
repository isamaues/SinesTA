#!/bin/sh
echo starting installation --------------------
apt-get update
pip3 install --upgrade setuptools
echo cloning repository
git clone https://github.com/isamaues/tflite_model_audioset_yamnet_modified
echo installing prerequisite packages
pip3 install numpy
pip3 install soundfile
sudo apt update sudo apt install -y python3-scipy
pip3 install llvmlit
sudo apt-get install cmake -y
sudo apt-get install libedit-dev -y
apt-get install clang-9 lldb-9 lld-9 -y
#which llvm-config
LLVM_CONFIG=<path>
LLVM_CONFIG=/opt/llvm/bin/llvm-config sudo pip3 install llvmlite
#get into llvmlite directory
#cd llvmlite
python3 setup.py build
python3 setup.py install
cd
pi3 install --update colorama
pip3 install resampy
echo DONE :) ---------------------------------
