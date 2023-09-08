#!/bin/sh
set -e

nsenter -t 1 -n /lib/systemd/systemd-udevd --daemon

udevadm trigger --action=add --subsystem-match=block

udevadm monitor