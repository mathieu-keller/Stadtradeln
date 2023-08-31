# Stage 1
FROM node:18.17.1-alpine AS base
ENV NODE_ENV production

RUN mkdir -p /app
WORKDIR /app
COPY * /app

RUN npm install --omit=dev

FROM gcr.io/distroless/nodejs18:nonroot
USER nonroot
COPY --from=base /app /app

EXPOSE 8080

CMD ["/app/app.js"]