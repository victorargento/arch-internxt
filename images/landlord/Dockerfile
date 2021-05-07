# Use the latest Node v6 (LTS) release
FROM node:10.24.1-alpine AS BUILD_PREIMAGE

# Install troubleshooting utils
RUN apk update && apk add --no-cache g++ make git python && rm -rf /var/cache/apk/*

FROM BUILD_PREIMAGE AS BUILD_IMAGE

WORKDIR /complex

COPY /complex .

RUN yarn --ignore-engines

# Start a new image
FROM node:10.24.1-alpine

RUN apk update && apk add --no-cache bash && rm -rf /var/cache/*

WORKDIR /complex

COPY --from=BUILD_IMAGE /complex .

RUN yarn link

CMD ["./dockerfiles/scripts/setup-landlord.sh", "./bin/storj-complex.js -c /etc/storj/landlord.conf"]
