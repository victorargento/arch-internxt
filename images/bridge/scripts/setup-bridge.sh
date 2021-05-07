#!/bin/bash
./dockerfiles/scripts/template_parse.sh ./dockerfiles/templates/bridge.conf.tmpl /root/.inxt-bridge/config/production storjbridge
exec $@