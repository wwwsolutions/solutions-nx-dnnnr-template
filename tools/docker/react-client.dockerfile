# pull official base image
FROM node:14.16.0-alpine3.13 AS development

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
RUN npm install -g concurrently

# add app
COPY . ./

# start app
# CMD ["npm", "start"]
# CMD ["/bin/sh", "entrypoint.sh"]

CMD ["concurrently","npm:serve:react-client"]

FROM node:14.16.0-alpine3.13 AS production

RUN addgroup app && adduser -S -G app app
USER app

WORKDIR /app
COPY ./dist/apps/react-client .

ENV PORT=3334
EXPOSE ${PORT}

RUN npm install --production
RUN npm install reflect-metadata tslib rxjs hbs

CMD node ./main.js