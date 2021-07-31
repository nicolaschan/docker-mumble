FROM debian:latest

LABEL description "Murmur server" \
      tags="latest" \
      maintainer="Nicolas Chan <github@nicolaschan.com>"

ENV GID=991 UID=991
COPY rootfs /

RUN apt-get update \
  && apt-get install -y mumble-server sudo \
  && chmod +x /usr/local/bin/*

VOLUME /opt/mumble/conf /opt/mumble/data
EXPOSE 64738 64738/udp
CMD ["/usr/local/bin/startup"]
