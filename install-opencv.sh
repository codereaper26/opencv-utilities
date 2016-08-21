#!/bin/bash
#: Author      : Sandhan Sarma <sandhansmailbox@gmail.com>
#: Description : A simple bash script to install OpenCV with python3 with 
#:               examples on Ubuntu 16.04

# upgrade the system
sudo apt update
sudo apt upgrade -y

# install developer tools to compile OpenCV
sudo apt install build-essential cmake git pkg-config -y

# install libraries and packages to read various image formats from disk
sudo apt install libjpeg-dev libpng-dev libtiff-dev libjasper-dev -y

# install libraries to read video formats from disk
sudo apt install libavcodec-dev libavformat-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libavresample-dev -y
# install GTK to use OpenCV's GUI features
sudo apt install libgtk2.0-dev libgtk3.0-cil-dev -y

# install packages to optimize mathematics operations in OpenCV
sudo apt install libatlas-base-dev gfortran -y

# install libraries for creating documentation
sudo apt install doxygen -y

#install tesseract
sudo ~/projects/scripts/install-tesseract.sh

#miscellaneous
sudo apt install libeigen3-dev libtbb2 libtbb-dev libdc1394-22-dev

# install python3 headers and development files
sudo apt install python3-dev

# install python3 modules
sudo apt install python3-numpy python3-pip
sudo pip3 install -U pip

# get the latest source files for OpenCV from github

git clone https://github.com/Itseez/opencv
git clone https://github.com/Itseez/opencv_contrib

# configure build options for OpenCV
mkdir opencv/build
cd opencv/build

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_C_EXAMPLES=ON -D BUILD_DOCS=ON -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D BUILD_EXAMPLES=ON ..

# compile OpenCV
make -j4

# install OpenCV
sudo make install
sudo ldconfig
