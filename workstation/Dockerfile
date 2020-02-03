FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y linux-headers-generic
# linux-image-generic linux-tools-generic

RUN apt-get install -y \
    build-essential \
    autoconf \
    automake \
    autogen \
    libjson-c-dev \
    pkg-config \
    libzmq3-dev \
    libcurl4-openssl-dev \
    libbpfcc-dev

RUN apt-get install -y \
    lsb-release \
    # kmod \
    git

RUN echo "deb [trusted=yes] http://repo.iovisor.org/apt/bionic bionic main" | \
  tee /etc/apt/sources.list.d/iovisor.list && \
  apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y bcc-tools libbcc-examples

WORKDIR /usr/libbpfflow.git
