#!/bin/sh
echo "starting installation --------------------"
cd
apt-get update
pip3 install --upgrade setuptools
#echo "cloning repository"
#git clone https://github.com/isamaues/tflite_model_audioset_yamnet_modified
echo "installing prerequisite packages"
pip3 install numpy
echo "numpy ok"
pip3 install soundfile
echo "soundfile ok"
pip3 install https://dl.google.com/coral/python/tflite_runtime-2.1.0.post1-cp37-cp37m-linux_armv7l.whl
echo "Tensorflow Lite Interpreter ok"
sudo apt update sudo apt install -y python3-scipy
echo "scipy ok"
echo "preparing for installing llvmlite"
#pip3 install llvmlite #depois fazer um teste pra tentar instalar com o pip antes de fazer tudo isso a seguir
sudo apt-get install cmake -y
sudo apt-get install libedit-dev -y
#apt-get install clang-9 lldb-9 lld-9 -y
#sudo apt-get install libllvm-9-ocaml-dev libllvm9 llvm-9 llvm-9-dev llvm-9-doc llvm-9-examples llvm-9-runtime
sudo apt-get install libllvm-9-ocaml-dev libllvm9 llvm-9 llvm-9-dev llvm-9-runtime
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
echo "llvmlite ok"
cd
pi3 install --upgrade colorama
pip3 install resampy
echo "resampy ok"
echo "DONE :) ---------------------------------"