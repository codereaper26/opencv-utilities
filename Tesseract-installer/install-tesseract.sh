#!/bin/bash
#: Author      : Sandhan Sarma <sandhansmailbox@gmail.com>
#: Description : this script installs Tesseract OCR on Ubuntu 16.04
sudo apt install autoconf automake libtool libpng-dev libjpeg-dev libtiff-dev zlib1g-dev libicu-dev libpango1.0-dev libcairo2-dev libleptonica-dev

git clone https://github.com/tesseract-ocr/tesseract.git
cd tesseract
./autogen.sh
./configure
make
sudo make install
sudo ldconfig
