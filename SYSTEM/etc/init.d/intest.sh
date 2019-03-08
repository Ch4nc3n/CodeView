#!/bin/sh

echo 1018 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio1018/direction
echo 1 > /sys/class/gpio/gpio1018/value

ln -s /dev/ttyHS1 /dev/ttyHSL1

echo 1 > /sys/devices/7864900.sdhci/polling

echo 1 > /proc/sys/net/ipv4/ip_forward

echo "ecm" > /sbin/usb/compositions/usb_net_type

echo 1 > /sys/module/msm_show_resume_irq/parameters/debug_mask
#echo 0x2 > /sys/module/ipc_router_core/parameters/debug_mask

#cat /dev/ttyHS0 &

#echo auto > /sys/devices/78b1000.uart/power/control
echo 0 > /sys/devices/78b1000.uart/clock

ulimit -c unlimited

echo /home/root/coredump/core.%e.%p > /proc/sys/kernel/core_pattern

# reboot system when kernel panic
echo 2 > /proc/sys/vm/panic_on_oom

ps -fe | grep tbox_app.bin | grep -v grep
if [ $? -eq 0 ]
then
echo "................................................................................................."
echo ".........................................restart app............................................."
echo "................................................................................................."
echo "kill current tbox_app.bin ......"
pkill appl.bin
pkill tbox_app.bin
sleep 1
appl.bin 2>/dev/null 1>/dev/null &
else
echo "................................................................................................."
echo ".........................................start app..............................................."
echo "................................................................................................."
appl.bin 2>/dev/null 1>/dev/null &
fi
exit 0
