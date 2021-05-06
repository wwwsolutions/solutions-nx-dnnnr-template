ARG ARG_BASE_IMAGE
# FROM node:14.16.0-alpine3.13
FROM ${ARG_BASE_IMAGE}

RUN echo "${ARG_BASE_IMAGE}"


RUN addgroup app && adduser -S -G app app
USER app

ARG ARG_MESSAGE
RUN echo "Building $ARG_MESSAGE image..."

WORKDIR /app

COPY ./dist/apps/nest-api .

ARG ARG_PORT
ENV ENV_PORT=$ARG_PORT
EXPOSE ${ENV_PORT}
RUN echo "Port $ENV_PORT has been exposed."


RUN npm install --production

# dependencies that nestjs needs
RUN npm install reflect-metadata tslib rxjs @nestjs/platform-express
CMD node ./main.js