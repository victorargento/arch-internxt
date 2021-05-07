# Use the latest Node v6 (LTS) release
FROM node:10.24.1-alpine AS BUILD_PREIMAGE

# Install troubleshooting utils
RUN apk update && apk add --no-cache g++ make git python

FROM BUILD_PREIMAGE AS BUILD_IMAGE

WORKDIR /complex

COPY /complex .

RUN yarn --ignore-engines

# Start a new image
FROM node:10.24.1-alpine

RUN apk update && apk add --no-cache bash && rm -rf /var/cache/*

WORKDIR /complex

COPY --from=BUILD_IMAGE /complex .
COPY ./setup-renter.sh ./dockerfiles/scripts/setup-renter.sh
COPY ./renter.conf.tmpl ./dockerfiles/templates/renter.conf.tmpl

RUN yarn link

CMD ["./dockerfiles/scripts/setup-renter.sh", "./bin/storj-complex.js -c /etc/storj/renter.conf"]
