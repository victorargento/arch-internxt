#
# Each instruction in this file generates a new layer that gets pushed to your local image cache
#
FROM node:10.24.1-alpine

RUN apk update && \
apk add --no-cache bash g++ make openssl-dev python git vim

WORKDIR /core-daemon

COPY /core-daemon .

RUN yarn --ignore-engines

RUN mkdir -p /root/.xcore/configs/

COPY start.sh /

ENV STORJ_NETWORK=INXT
ENV CONTEXT=PRODUCTION

RUN yarn link

CMD ["sh", "/start.sh", "node /core-daemon/script/farmer.js --config /root/.xcore/configs/*"]