#!/bin/bash

#Check if there are nodes on /root/.xcore/configs
LIST_FARMER=$(ls /root/.xcore/configs/ | wc -l)

if [ $LIST_FARMER -eq 0 ]; then

    #Create a node
    xcore create --inxt ${TOKEN} --storage /xcore-storage --size ${SIZE} --rpcport ${PORT} --rpcaddress ${EXTERNAL_IP} --noedit
    PATH_NODE=$(LAST_NODE=$(ls /root/.xcore/configs/ | head -1) && echo "/root/.xcore/configs/$LAST_NODE")

    #Check context
    if [ "$CONTEXT" = "DEV" ]; then

       sed -i "s|xpub69vZdaeqerAfCThNZu6Zifz5K8XvFiPxG6UHZck5NC9ezmo48D8WmwhKYWjyxuwQVA3otsBZ8NFqfKvSGfLdY1qvTC75ZYUeYhJQdgdCgWJ|${EXTENDED_KEY}|g" $PATH_NODE
       sed -i "s|https://api.internxt.com|${BRIDGE_URL}|g" $PATH_NODE

    fi

fi

exec $@