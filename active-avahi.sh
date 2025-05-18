#!/bin/bash
#
# Seems Link-Local IPV4 only is not active by default anymore on fresh Raspbian OS 64 bits
# from 11.16.2023
#
# Here is a manual activation script


nmcli con show
nmcli con edit [uuid]
set ipv4.method auto
set ipv4.link-local enabled
set ipv6.method disabled
save
quit
