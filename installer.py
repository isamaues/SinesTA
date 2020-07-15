#!/bin/sh
echo starting installation --------------------
cd
apt-get update
pip3 install --upgrade setuptools
echo cloning repository
git clone https://github.com/isamaues/tflite_model_audioset_yamnet_modified
echo installing prerequisite packages
pip3 install numpy
pip3 install soundfile
sudo apt update sudo apt install -y python3-scipy
#pip3 install llvmlite #depois fazer um teste pra tentar instalar com o pip antes de fazer tudo isso a seguir
sudo apt-get install cmake -y
sudo apt-get install libedit-dev -y
apt-get install clang-9 lldb-9 lld-9 -y
#which llvm-config
#sudo find / -iname llvm_config
#LLVM_CONFIG=<path>
#LLVM_CONFIG=/opt/llvm/bin/llvm-config sudo pip3 install llvmlite
LLVM_CONFIG=/usr/lib/llvm-9/bin/llvm-config pip3 install llvmlite
#get into llvmlite directory
#cd llvmlite
cd /home/pi/.local/lib/python3.7/site-packages/llvmlite
python3 setup.py build
#python3 setup.py install
cd
pi3 install --upgrade colorama
pip3 install resampy
echo DONE :) ---------------------------------
