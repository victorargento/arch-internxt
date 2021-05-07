FROM node:10.24.1-alpine AS BUILD_PREIMAGE

RUN apk update && apk add --no-cache g++ make git python

FROM BUILD_PREIMAGE AS BUILD_IMAGE

WORKDIR /bridge

COPY /bridge .

RUN yarn --ignore-engines

FROM node:10.24.1-alpine

ENV NODE_ENV=production

WORKDIR /bridge

COPY --from=BUILD_IMAGE /bridge .

RUN rm -r ./dockerfiles/*

COPY ./scripts ./dockerfiles/scripts
COPY ./templates ./dockerfiles/templates

RUN yarn link

RUN mkdir -p /root/.inxt-bridge/config && mkdir /root/.inxt-bridge/items

CMD ["sh", "./dockerfiles/scripts/setup-bridge.sh", "storj-bridge /root/.inxt-bridge/config/production"]