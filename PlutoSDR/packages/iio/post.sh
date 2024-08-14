#!/bin/bash

set -x
set -e

target=$1

sudo rm -rf $target/root/libini $target/root/*.deb $target/root/master.zip $target/root/v0.3.zip