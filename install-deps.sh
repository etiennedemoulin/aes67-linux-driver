#!/bin/bash
#
# Tested on Raspbian OS Lite 64bits
#

sudo apt update
sudo apt upgrade -y
sudo apt-get install -y psmisc
sudo apt-get install -y build-essential
sudo apt-get install -y clang
sudo apt-get install -y git
sudo apt-get install -y cmake
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y valgrind
sudo apt-get install -y alsa-base
sudo apt-get install -y alsa-utils
sudo apt-get install -y libasound2-dev
sudo apt-get install -y linuxptp
sudo apt-get install -y libavahi-client-dev
sudo apt-get install -y libasound2-plugins
sudo apt-get install -y raspberrypi-kernel-headers
sudo apt-get install -y libsystemd-dev
sudo apt-get install -y dialog
sudo apt-get remove pulseaudio

git clone https://github.com/bondagit/aes67-linux-daemon
git clone https://github.com/etiennedemoulin/linuxptp

./build.sh

./systemd/install.sh

