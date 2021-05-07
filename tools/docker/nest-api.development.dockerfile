ARG ARG_BASE_IMAGE
# FROM node:14.16.0-alpine3.13
FROM ${ARG_BASE_IMAGE} AS development
RUN echo ${ARG_BASE_IMAGE}

RUN addgroup app && adduser -S -G app app
USER app

ARG ARG_MESSAGE
RUN echo "Building $ARG_MESSAGE image..."

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
# COPY package.json ./
# COPY package-lock.json ./
COPY ["package.json", "package-lock.json", "nx.json", "./"]
# RUN npm install --silent
RUN npm install --only=development --silent

# ARG ARG_PORT
# ENV ENV_PORT=$ARG_PORT
# EXPOSE ${ENV_PORT}
# RUN echo "Port $ENV_PORT has been exposed."

# add app
# COPY ./apps/nest-api .
COPY . .

RUN npm run build

# CMD ["concurrently","npm:serve:nest-api"]

# RUN nx build nest-api

# CMD nx serve nest-api

ARG ARG_NODE_ENV=development
ENV NODE_ENV=${ARG_NODE_ENV}
