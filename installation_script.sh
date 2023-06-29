#!/bin/sh

wget https://apt.kitware.com/kitware-archive.sh
sudo bash kitware-archive.sh

#Install required dependencies
sudo apt install --no-install-recommends git cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget \
  python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
  make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1
  
#verify the versions of the main dependencies installed 
cmake --version
python3 --version
dtc --version
