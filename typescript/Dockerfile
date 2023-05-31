FROM node:18-alpine3.16

WORKDIR /opt/typescript

RUN npm i -g npm
COPY package*.json ./
RUN npm install

COPY . .