#!/bin/bash

pkg install termux-keyring -y
pkg update -y && pkg upgrade -y
pkg install git clang make openssl curl zlib libjansson -y
pkg install libtool automake autoconf pkg-config -y
./autogen.sh
./configure CFLAGS="-O3 -march=armv8-a -D__aarch64__ -U__arm__" --with-crypto --with-curl  --disable-algo-cryptonight 
make -j$(nproc)
