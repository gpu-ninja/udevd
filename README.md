# udevd

Containerized [udevd](https://www.freedesktop.org/software/systemd/man/systemd-udevd.service.html) for dynamic block/disk devices on Docker.

## Usage

The container must be run with `--pid=host` to allow the container to access host udev events.

```shell
docker run --privileged=true --pid=host ghcr.io/gpu-ninja/udevd:latest
```

You can bind mount `/dev` to anywhere where you need to access the devices.