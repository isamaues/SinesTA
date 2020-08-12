#!/bin/sh
echo "starting installation --------------------"
cd
apt-get update
pip3 install --upgrade setuptools
echo "installing prerequisite packages"
pip3 install numpy
echo "numpy ok"
pip3 install soundfile
echo "soundfile ok"
pip3 install https://dl.google.com/coral/python/tflite_runtime-2.1.0.post1-cp37-cp37m-linux_armv7l.whl
echo "Tensorflow Lite Interpreter ok"
sudo apt update sudo apt install -y python3-scipy
sudo apt-get install libatlas-base-dev -y
echo "scipy ok"
echo "preparing for installing llvmlite"
#pip3 install llvmlite #depois fazer um teste pra tentar instalar com o pip antes de fazer tudo isso a seguir
sudo apt-get install cmake -y
sudo apt-get install libedit-dev -y
#apt-get install clang-9 lldb-9 lld-9 -y
sudo apt-get install libllvm-9-ocaml-dev libllvm9 llvm-9 llvm-9-dev llvm-9-doc llvm-9-examples llvm-9-runtime -y
LLVM_CONFIG=/usr/lib/llvm-9/bin/llvm-config pip3 install llvmlite
cd /usr/local/lib/python3.7/dist-packages/llvmlite
echo "llvmlite ok"
cd
pip3 install --upgrade colorama
pip3 install resampy
echo "resampy ok"
echo "DONE :) ---------------------------------"
