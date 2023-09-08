#!/bin/sh
set -e

export SYSTEMD_IGNORE_CHROOT=1

mount -o remount,rw /sys

nsenter -t 1 -n /lib/systemd/systemd-udevd --debug --daemon

udevadm trigger --action=add --subsystem-match=block
udevadm trigger --action=change --subsystem-match=block

udevadm monitor