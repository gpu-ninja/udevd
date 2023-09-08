#!/bin/sh
set -e

export SYSTEMD_IGNORE_CHROOT=1

nsenter -t 1 -n /bin/sh -c '
  /lib/systemd/systemd-udevd --daemon
  udevadm trigger --action=add --subsystem-match=block
  udevadm monitor
'