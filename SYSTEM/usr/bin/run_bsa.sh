#!/bin/sh
echo 1019 > /sys/class/gpio/unexport
echo 1019 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio1019/direction
echo 0 > /sys/class/gpio/gpio1019/value
echo 1019 > /sys/class/bluetooth/wake_gpios/dev_wake
echo 25 > /sys/class/gpio/unexport
echo 25 > /sys/class/gpio/export
echo 25 > /sys/class/bluetooth/wake_gpios/host_wake
echo 37 > /sys/class/gpio/unexport
echo 37 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio37/direction
echo 0 > /sys/class/gpio/gpio37/value
sleep 3
echo 1 > /sys/class/gpio/gpio37/value
/usr/bin/bsa_server -d /dev/ttyHS0 -p /etc/firmware/cm256/BCM434545.hcd -lpm -b /tmp/btsnoop_lpm.cfa -all=6 > /tmp/bsa_server_lpm.log & 
sleep 2
/home/root/app_ble_test &

