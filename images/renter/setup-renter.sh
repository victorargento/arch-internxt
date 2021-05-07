#!/usr/bin/env bash

mkdir -p /etc/storj/keys

# Create the Network Private Extended Key file
echo ${network_private_extended_key_string} > /etc/storj/keys/complex.key

./dockerfiles/scripts/template_parse.sh ./dockerfiles/templates/renter.conf.tmpl /etc/storj/renter.conf storjrenter

exec $@
