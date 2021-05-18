#!/bin/bash

mkdir -p ./images/landlord/complex ./images/renter/complex ./images/xcore/core-daemon ./images/bridge/bridge ./images/drive-server/drive-server ./images/drive-web/drive-web ./images/website/website

git clone https://github.com/internxt/complex.git ./images/landlord/complex
git clone https://github.com/internxt/complex.git ./images/renter/complex
git clone https://github.com/internxt/core-daemon ./images/xcore/core-daemon
git clone https://github.com/internxt/bridge.git ./images/bridge/bridge
git clone https://github.com/internxt/drive-server.git ./images/drive-server/drive-server
git clone https://github.com/internxt/drive-web.git ./images/drive-web/drive-web
git clone https://github.com/internxt/website.git ./images/website/website

docker build -t landlord-image ./images/landlord
docker build -t renter-image ./images/renter
docker build -t xcore-image ./images/xcore
docker build -t bridge-image ./images/bridge
docker build -t drive-server-image ./images/drive-server
docker build -t drive-web-image ./images/drive-web
docker build -t website-image ./images/website