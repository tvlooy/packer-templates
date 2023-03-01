#!/bin/ksh

set -e
set -x

for dir in $(mount | awk '{ print $3 }'); do
  doas dd if=/dev/zero of="$dir/EMPTY" bs=1M || :
  doas rm "$dir/EMPTY"
done

swap_device=$(swapctl -l | awk '!/^Device/ { print $1 }')
doas swapctl -d "$swap_device"
doas dd if=/dev/zero of="$swap_device" bs=1M || :
