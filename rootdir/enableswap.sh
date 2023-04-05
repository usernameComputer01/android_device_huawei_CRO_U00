#!/bin/sh


# first {
echo 4 > /sys/block/zram0/max_comp_streams
echo lz4k > /sys/block/zram0/comp_algorithm
echo 512M > /sys/block/zram0/disksize

#mkswap /dev/block/zram0
#swapon /dev/block/zram0

/system/bin/tiny_mkswap /dev/block/zram0
/system/bin/tiny_swapon /dev/block/zram0
# }

# second {
#chattr -i /data/2ndswap
#
#tiny_fallocate 134217728 /data/2ndswap
#
#mkswap /data/2ndswap
#swapon /data/2ndswap
#
#chattr +i /data/2ndswap
# }

echo 0 > /proc/sys/vm/page-cluster
echo 100 > /proc/sys/vm/swappiness
