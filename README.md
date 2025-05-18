# aes67-linux-driver
Embedded installer and launcher for Merging ALSA RAVENNA/AES67 audio driver on Raspberry Pi #DanteOnRPi

# Elements
1. ./install-deps.sh 
  install dependencies and clone repos
2. ./build.sh
  build ravenna-alsa-lkm
3. ./launcher.sh
  dialog terminal interface for launching the driver, activate/desactivate PTP clock master, monitor status of installation and alsaloop active/desactive (this is the work to do)

# Installation procedure
- Use [Raspberry Pi Imager](https://www.raspberrypi.com/software/) to install SD Card. Please choose Raspberry Pi OS Lite (64 bits)
- `sudo apt install -y git && git clone https://github.com/etiennedemoulin/aes67-linux-driver && cd aes67-linux-driver && ./autorun.sh`
- done.

# Logic state for launcher
0. Status window
 0a. ipv4 address
 0b. presence of ravenna-alsa-lkm
 0c. presence of modded-linuxptp
 0d. presence of systemctl scripts
1. Welcome to AES67 linux launcher - driver is currently ${driverStatus}, would you
like to activate the driver ? Yes/No
2. PTP clock master is currently ${clockStatus}, would you like to activate PTP 
clock master ? Yes/No
3. Would you like to activate alsaloop ? Yes/No
  3a. Please choose input device (list of input soundboards)
  3b. Please choose output device (list of output soundboards)
4. Done ! Ok
