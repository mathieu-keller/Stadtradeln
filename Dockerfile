FROM node:20.5.1-alpine AS base
ENV NODE_ENV production
RUN apk add --no-cache  chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main
RUN mkdir -p /app
WORKDIR /app
COPY app.js /app/app.js
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

RUN npm install --omit=dev

CMD ["/app/app.js"]