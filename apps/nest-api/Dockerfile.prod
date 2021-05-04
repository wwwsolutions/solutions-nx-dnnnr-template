FROM node:14-alpine

WORKDIR /app

COPY ./dist/apps/nest-api .

ENV PORT=3333
EXPOSE ${PORT}

RUN npm install --production

# dependencies that nestjs needs
RUN npm install reflect-metadata tslib rxjs @nestjs/platform-express
CMD node ./main.js