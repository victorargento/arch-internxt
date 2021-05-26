FROM node:10.24.1-alpine

RUN apk update && apk add curl g++ make python

WORKDIR /drive-web

COPY ./drive-web .

RUN yarn --ignore-engines

CMD [ "yarn run start" ]