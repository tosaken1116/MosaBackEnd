FROM node:18

WORKDIR /opt/typescript/

COPY ./package* ./
COPY ./yarn* ./

RUN yarn

COPY . .

EXPOSE 8000

CMD yarn dev