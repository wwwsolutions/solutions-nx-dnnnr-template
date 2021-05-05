FROM node:14.16.0-alpine3.13

RUN addgroup app && adduser -S -G app app
USER app

WORKDIR /app
COPY ./dist/apps/react-client .

ENV PORT=3334
EXPOSE ${PORT}

RUN npm install --production
RUN npm install reflect-metadata tslib rxjs hbs

CMD node ./main.js