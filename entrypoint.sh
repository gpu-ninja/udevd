#!/bin/sh
set -e

# Don't take ownwership of the host devices.
mount -o remount,ro /sys

nsenter -t 1 -n /lib/systemd/systemd-udevd --daemon

export SYSTEMD_IGNORE_CHROOT=1

unshare -m sh -c '
  mount -o remount,rw /sys
  udevadm trigger --action=add --subsystem-match=block
'

udevadm monitor