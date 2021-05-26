# Use the latest Node v6 (LTS) release
FROM node:10.24.1-alpine

# Install troubleshooting utils
RUN apk update && apk add --no-cache g++ make git python

WORKDIR /complex

COPY /complex .

RUN yarn --ignore-engines

COPY ./setup-renter.sh ./dockerfiles/scripts/setup-renter.sh
COPY ./renter.conf.tmpl ./dockerfiles/templates/renter.conf.tmpl

RUN yarn link

CMD ["./dockerfiles/scripts/setup-renter.sh", "./bin/storj-complex.js -c /etc/storj/renter.conf"]
