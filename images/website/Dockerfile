FROM node:10.24.1-alpine AS BUILD_PREIMAGE

RUN apk update && apk add curl g++ make python

FROM BUILD_PREIMAGE AS BUILD_IMAGE

WORKDIR /website

COPY ./website .

RUN yarn --ignore-engines

COPY .env.local .

RUN yarn run preinstall

RUN yarn run prebuild

RUN yarn run build

FROM node:10.24.1-alpine

WORKDIR /website

COPY --from=BUILD_IMAGE /website .

CMD [ "yarn run start" ]