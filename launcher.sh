#!/bin/sh
# $Id: menubox7,v 1.10 2019/12/10 23:14:49 tom Exp $
# example with --extra-button

. ./setup-vars

DRIVER_STATE=0
CLOCK_STATE=0


$DIALOG --title "AES67 Linux Launcher" "$@" \
        --clear \
        --yes-label "Yes" \
        --no-label "No" \
        --yesno "Welcome to AES67 linux launcher. Driver is currently ${DRIVER_STATE}, would you like to activate the driver ?" 0 0
retval=$?
case ${retval:-0} in
  $DIALOG_OK)
    sudo systemctl enable aes67-daemon
    DIALOG --title "MESSAGE BOX" --clear "$@" \
            --msgbox "Successfully started the driver." 7 40
    ;;
  $DIALOG_CANCEL)
    sudo systemctl disable aes67-daemon
    DIALOG --title "MESSAGE BOX" --clear "$@" \
            --msgbox "Successfully stopped the driver." 7 40
    ;;
esac

$DIALOG --title "PTP clock" "$@" \
        --clear \
        --yes-label "Yes" \
        --no-label "No" \
        --yesno "PTP clock is currently ${CLOCK_STATE}, would you like to activate PTP clock master ?" 0 0
retval=$?
case ${retval:-0} in
  $DIALOG_OK)
    sudo systemctl enable aes67-clock-master
    DIALOG --title "MESSAGE BOX" --clear "$@" \
            --msgbox "Successfully started PTP clock master." 7 40
    ;;
  $DIALOG_CANCEL)
    sudo systemctl disable aes67-clock-master
    DIALOG --title "MESSAGE BOX" --clear "$@" \
            --msgbox "Successfully stopped PTP clock master." 7 40
   ;;
esac

$DIALOG --title "alsaloop" "$@" \
        --clear \
        --yes-label "Yes" \
        --no-label "No" \
        --yesno "Would you like to configure alsaloop ?" 0 0
retval=$?
case ${retval:-0} in
  $DIALOG_OK)
    # echo "inputDevice=${inputDevice}\noutputDevice=${outputDevice}" > /etc/.aes67-alsaloop
    # sudo systemctl enable aes67-alsaloop
    # DIALOG --title "MESSAGE BOX" --clear "$@" \
    #         --msgbox "Successfully started alsaloop." 7 40
    ;;
  $DIALOG_CANCEL)
    DIALOG --title "Done!" --clear "$@" \
            --msgbox "AES67 linux daemon is ready" 7 40
   ;;
esac

case "x$DIALOGOPTS" in
*--no-items*|*--noitem*)
  CUT="cut -d: -f1,3"
  ;;
*)
  CUT="cat"
  ;;
esac

$CUT >$input <<-EOF
  Linux:The Great Unix Clone for 386/486
  NetBSD:Another free Unix Clone for 386/486
  OS/2:IBM OS/2
  WIN NT:Microsoft Windows NT
  PC-DOS:IBM PC DOS
  MS-DOS:Microsoft DOS
EOF
sed -e 's/^/"/' -e 's/:/" "/g' -e 's/$/"/' <$input >$output
cat $output >$input

$DIALOG --clear --title "MENU BOX" "$@" \
        --menu "Hi, this is a menu box. You can use this to \n\
present a list of choices for the user to \n\
choose. If there are more items than can fit \n\
on the screen, the menu will be scrolled. \n\
You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Try it now!\n\n\
  Choose the OS you like:" 20 51 4 \
  --file $input 2> $output

retval=$?

echo $output
