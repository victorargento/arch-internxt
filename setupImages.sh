#!/bin/bash

mkdir -p ./images/landlord/complex ./images/renter/complex ./images/xcore/core-daemon ./images/bridge/bridge

git clone https://github.com/internxt/complex.git ./images/landlord/complex
git clone https://github.com/internxt/complex.git ./images/renter/complex
git clone https://github.com/internxt/core-daemon ./images/xcore/core-daemon
git clone https://github.com/internxt/bridge.git ./images/bridge/bridge

docker build -t landlord-image ./images/landlord
docker build -t renter-image ./images/renter
docker build -t xcore-image ./images/xcore
docker build -t bridge-image ./images/bridge
