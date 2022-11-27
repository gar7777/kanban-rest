FROM node:lts-alpine3.15

EXPOSE 4000

WORKDIR /home/app/

RUN mkdir -p ./dist
RUN mkdir -p ./uploads
RUN mkdir -p ./logs

COPY migrations ./migrations
COPY typings ./typings
COPY src ./src

COPY package*.json tsconfig.json tsconfig.build.json ./

RUN npm ci
RUN npm run build

