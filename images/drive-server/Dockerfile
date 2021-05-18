FROM node:10.23.3 AS BUILD_PREIMAGE

RUN apt update && apt install -y curl g++ make python

FROM BUILD_PREIMAGE AS BUILD_IMAGE

WORKDIR /drive-server

COPY ./drive-server .

RUN yarn --ignore-engines

FROM node:10.23.3

WORKDIR /drive-server

COPY --from=BUILD_IMAGE /drive-server .