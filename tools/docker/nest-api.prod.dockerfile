FROM node:14.16.0-alpine3.13

RUN addgroup app && adduser -S -G app app
USER app

WORKDIR /app

COPY ./dist/apps/nest-api .

ENV PORT=3333
EXPOSE ${PORT}

RUN npm install --production

# dependencies that nestjs needs
RUN npm install reflect-metadata tslib rxjs @nestjs/platform-express
CMD node ./main.js