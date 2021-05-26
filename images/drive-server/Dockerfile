FROM node:10.23.3

RUN apt update && apt install -y curl g++ make python git

WORKDIR /drive-server

COPY ./drive-server .

RUN yarn --ignore-engines

COPY start.sh /

CMD ["sh", "/start.sh", "yarn run docker"]