FROM node:latest
COPY . /opt/typescript
WORKDIR /opt/typescript
RUN npm i -g npm
RUN npm i -g @nestjs/cli
RUN npm i
RUN npx prisma generate
EXPOSE 8080
CMD [ "npm", "run", "start:dev" ]
