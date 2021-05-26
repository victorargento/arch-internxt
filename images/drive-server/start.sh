#!/bin/bash
sleep 10
cd /drive-server
yarn run migrate

exec $@