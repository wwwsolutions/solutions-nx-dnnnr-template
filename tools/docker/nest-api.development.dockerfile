FROM node:14.16.0-alpine3.13

RUN addgroup app && adduser -S -G app app
USER app

ARG ARG_MESSAGE
RUN echo "Building $ARG_MESSAGE image..."

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
# RUN npm install -g concurrently

# ENV PORT=3333
# EXPOSE ${PORT}

# add app
COPY . ./

CMD ["concurrently","npm:serve:nest-api"]
