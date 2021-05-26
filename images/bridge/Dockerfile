FROM node:10.24.1-alpine

RUN apk update && apk add --no-cache g++ make git python

WORKDIR /bridge

COPY /bridge .

RUN yarn --ignore-engines

ENV NODE_ENV=production

RUN rm -r ./dockerfiles/*

COPY ./scripts ./dockerfiles/scripts
COPY ./templates ./dockerfiles/templates

RUN yarn link

RUN mkdir -p /root/.inxt-bridge/config && mkdir /root/.inxt-bridge/items

CMD ["sh", "./dockerfiles/scripts/setup-bridge.sh", "storj-bridge /root/.inxt-bridge/config/production"]