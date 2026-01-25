#!/bin/bash
git submodule init
git submodule update
cd busybox
patch -N -p1 < ../0010-tc-build-fails-on-kernel-6.8.patch
make  defconfig
make -j $(( $(nproc) + 1 ))
# make install
cd ..
