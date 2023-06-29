#!/bin/sh
if [[ -f "kitware-archive.sh"]]
then
    echo "file exists on your filesystem."
else
    wget https://apt.kitware.com/kitware-archive.sh
fi

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

#install west and make sure ~/.local/bin is on your PATH env variable
pip3 install --user -U west
echo 'export PATH=~/.local/bin:"$PATH"' >> ~/.bashrc
source ~/.bashrc

#Get Zephyr source code
mkdir ~/zephyrproject
echo "zephyrproject directory created in home directory"

#Get the zephyr source code
west init ~/zephyrproject
cd ~/zephyrproject
west update

#export a zephyr CMake package
west zephyr-export

#installing additional python dependencies
pip3 install --user -r ~/zephyrproject/zephyr/scripts/requirements.txt