FROM node:10.24.1-alpine AS BUILD_PREIMAGE

RUN apk update && apk add curl g++ make python

FROM BUILD_PREIMAGE AS BUILD_IMAGE

WORKDIR /drive-web

COPY ./drive-web .

RUN yarn --ignore-engines

FROM node:10.24.1-alpine

WORKDIR /drive-web

COPY --from=BUILD_IMAGE /drive-web .

CMD [ "yarn run start" ]