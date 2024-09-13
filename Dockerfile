FROM node:lts-alpine AS build
WORKDIR /app

COPY . .

RUN \
  --mount=type=cache,target=./node_modules \
  npm install && npm run build

CMD [ "cp", "-r", "./build/", "/var/www" ]