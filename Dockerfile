FROM ubuntu:22.04
LABEL org.opencontainers.image.source = "https://github.com/matti/egctl"

RUN apt-get update && apt-get install -y --no-install-recommends \
  egctl \
  && apt-get clean

ENTRYPOINT [ "/usr/bin/egctl" ]