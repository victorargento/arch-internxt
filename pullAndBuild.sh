#!/bin/bash

CHECK_BRIDGE=$(cd ./images/bridge/bridge && git rev-list --count master...origin/master)
CHECK_COMPLEX=$(cd ./images/landlord/complex && git rev-list --count master...origin/master)
CHECK_XCORE=$(cd ./images/xcore/core-daemon && git rev-list --count master...origin/master)

if [ $CHECK_BRIDGE != 0 ]; then
	git pull
	docker build -t bridge-image ../.
else
	echo "No new commits on bridge repo"
fi

cd ../..

if [ $CHECK_COMPLEX != 0 ]; then
	git pull
	docker build -t landlord-image ../.

	cd ../../renter/complex

	git pull
	docker build -t renter-image ../.
else
	echo "No new commits on complex repo"  
fi

cd ../..

if [ $CHECK_XCORE != 0 ]; then
	git pull
	docker build -t xcore-image ../.
else
	echo "No new commits on xcore repo"  
fi
