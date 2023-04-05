#!/bin/sh

tiny_swapoff /dev/block/zram0
echo 1 > /sys/block/zram0/reset

#if [ -e /data/2ndswap ]; then
#  chattr -i /data/2ndswap
#  swapoff /data/2ndswap
#fi
