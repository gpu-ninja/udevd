FROM debian:bookworm-slim

RUN apt update \
  && apt install -y lvm2 udev \
  && rm -rf /usr/lib/udev/rules.d/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY rules.d /etc/udev/rules.d

ENTRYPOINT ["/entrypoint.sh"]