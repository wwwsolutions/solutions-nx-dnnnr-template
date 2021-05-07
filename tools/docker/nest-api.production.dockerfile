ARG ARG_BASE_IMAGE

# FROM node:14.16.0-alpine3.13
FROM ${ARG_BASE_IMAGE} AS production
RUN echo "${ARG_BASE_IMAGE}"

RUN addgroup app && adduser -S -G app app
USER app

ARG ARG_MESSAGE
RUN echo "Building $ARG_MESSAGE image..."

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

COPY ./dist/apps/nest-api .

# RUN npm install --production
RUN npm install --only=production --silent

# dependencies that nestjs needs
RUN npm install reflect-metadata tslib rxjs @nestjs/platform-express
CMD node ./main.js

# ARG ARG_NODE_ENV=production
# ENV NODE_ENV=${ARG_NODE_ENV}
