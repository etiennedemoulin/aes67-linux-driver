#!/bin/sh

MAIN=$(DIALOG --clear --backtitle "aes67-linux-driver" \
        --title "Merging ALSA RAVENNA/AES67 audio driver" \
        --menu "Choose one of the following options:" 15 45 4 \
        1 "Driver activation" \
        2 "PTP clock master" \
        3 "alsaloop" \
        4 "Monitor status " \
        2>&1 >/dev/tty)


case $MAIN in
        1)
                . ./driver_activation.sh;;
        2)
                echo "You chose PTP clock master";;
        3)
                echo "You chose alsaloop";;
        4)
                echo "Monitor status";;

esac
