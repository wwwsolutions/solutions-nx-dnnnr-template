FROM node:14-alpine

WORKDIR /app
COPY ./dist/apps/react-client .

ENV PORT=3334
EXPOSE ${PORT}

RUN npm install --production
RUN npm install reflect-metadata tslib rxjs hbs

CMD node ./main.js