#! /bin/bash

set -x
set -e

. /etc/environment
for f in /etc/profile.d/*.sh; do source $f; done

# Install libini
cd /root
wget https://github.com/pcercuei/libini/archive/refs/heads/master.zip
unzip -d libini master.zip
cd libini/libini-master
mkdir build
cd build
cmake ../
make
make install

# Install IIO and dependencies
cd /root
wget http://launchpadlibrarian.net/571174055/libiio-utils_0.23-2_armhf.deb
apt update
apt download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances libiio-dev | grep "^\w" | sort -u)
dpkg -i *.deb

# Install libiio Python bindings
pip3 install pylibiio pyadi-iio