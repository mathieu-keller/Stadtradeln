FROM ghcr.io/puppeteer/puppeteer:21.1.1
USER pptruser
ENV NODE_ENV production
WORKDIR /home/pptruser
COPY --chown=pptruser app.js /home/pptruser/app.js
COPY --chown=pptruser package.json /home/pptruser/package.json
COPY --chown=pptruser package-lock.json /home/pptruser/package-lock.json

RUN npm install

EXPOSE 8080

CMD ["/home/pptruser/app.js"]