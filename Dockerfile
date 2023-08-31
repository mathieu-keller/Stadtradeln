FROM node:20.5.1-alpine AS base
ENV NODE_ENV production

RUN mkdir -p /app
WORKDIR /app
COPY app.js /app/app.js
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

RUN npm install --omit=dev

FROM gcr.io/distroless/nodejs20:nonroot
USER nonroot
COPY --from=base /app /app

EXPOSE 8080

CMD ["/app/app.js"]