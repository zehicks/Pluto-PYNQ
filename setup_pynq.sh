#!/bin/bash

cd ./PYNQ
./sdbuild/scripts/setup_host.sh
wget -O ./sdbuild/prebuilt/pynq_rootfs.arm.tar.gz https://bit.ly/pynq_arm_v3_1
wget -O ./sdbuild/prebuilt/pynq_sdist.tar.gz https://bit.ly/pynq_sdist_v3_0_1