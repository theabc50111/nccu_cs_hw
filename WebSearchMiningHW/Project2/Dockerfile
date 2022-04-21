FROM ubuntu:latest

COPY indri-5.20.tar.gz /root

RUN echo "deb http://dk.archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list && \ 
    apt update && apt upgrade -y && apt install -y build-essential make gcc-4.4 g++-4.4 zlib1g-dev && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 1 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 1 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 2 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.4 2 && \
    tar -xzvf /root/indri-5.20.tar.gz -C /root && \
    cd /root/indri-5.20 && ./configure && make && make install


