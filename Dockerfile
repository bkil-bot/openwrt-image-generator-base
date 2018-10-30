FROM ubuntu:xenial
MAINTAINER github.com/bkil

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

RUN \
 apt-get update && \
 apt-get -y upgrade

RUN \
 apt-get install -fy --no-install-recommends  \
 ca-cacert subversion build-essential libncurses5-dev zlib1g-dev \
 gawk git ccache gettext libssl-dev xsltproc wget \
 unzip time python file \
 && \
 rm -rf /var/lib/apt/lists/*

ENV TARBALL "openwrt-imagebuilder-18.06.1-ar71xx-tiny.Linux-x86_64.tar.xz"

RUN \
 wget \
  -nv \
  https://downloads.openwrt.org/releases/18.06.1/targets/ar71xx/tiny/$TARBALL && \
 tar \
  --touch --no-same-owner --no-same-permissions \
  --delay-directory-restore --no-overwrite-dir --ignore-command-error \
  -xJf $TARBALL && \
 rm $TARBALL && \
 mv *openwrt-imagebuilder-* image-builder
