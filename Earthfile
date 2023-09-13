VERSION 0.7
FROM debian:bookworm-slim

docker-all:
  BUILD --platform=linux/amd64 --platform=linux/arm64 +docker

docker:
  RUN apt update \
    && apt install -y lvm2 udev \
    && rm -rf /usr/lib/udev/rules.d/*
  COPY entrypoint.sh /entrypoint.sh
  RUN chmod +x /entrypoint.sh
  COPY rules.d /etc/udev/rules.d
  ENTRYPOINT ["/entrypoint.sh"]
  ARG VERSION
  SAVE IMAGE --push ghcr.io/gpu-ninja/udevd:${VERSION}
  SAVE IMAGE --push ghcr.io/gpu-ninja/udevd:latest