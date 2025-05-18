#!/bin/bash
#
# Untested protoytpe
#


sudo sysctl -w net/ipv4/igmp_max_memberships=66
sudo sysctl -w kernel/perf_cpu_time_max_percent=0
sudo sysctl -w kernel/sched_rt_runtime_us=1000000

sudo insmod 3rdparty/ravenna-alsa-lkm/driver/MergingRavennaALSA.ko

sudo ifconfig eth0 169.254.1.10

./daemon/aes67-daemon -c ./daemon/daemon.conf
