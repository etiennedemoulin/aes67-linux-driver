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

