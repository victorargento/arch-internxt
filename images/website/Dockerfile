FROM node:10.24.1-alpine

RUN apk update && apk add curl g++ make python git

WORKDIR /website

COPY ./website .

RUN yarn --ignore-engines

COPY .env.local .

RUN yarn run preinstall

RUN yarn run prebuild

RUN yarn run build

CMD [ "yarn run start" ]