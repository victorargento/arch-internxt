#
# Each instruction in this file generates a new layer that gets pushed to your local image cache
#
FROM node:10.24.1-alpine AS BUILD_PREIMAGE

RUN apk update && \
apk add --no-cache bash g++ make openssl-dev python git vim

FROM BUILD_PREIMAGE AS BUILD_IMAGE

WORKDIR /core-daemon

COPY /core-daemon .

RUN yarn install --production=true --ignore-engines

FROM node:10.24.1-alpine

RUN mkdir -p /root/.xcore/configs/

COPY start.sh /

ENV STORJ_NETWORK=INXT
ENV CONTEXT=PRODUCTION

WORKDIR /core-daemon

COPY --from=BUILD_IMAGE /core-daemon .

RUN yarn link

CMD ["sh", "/start.sh", "node /core-daemon/script/farmer.js --config /root/.xcore/configs/*"]