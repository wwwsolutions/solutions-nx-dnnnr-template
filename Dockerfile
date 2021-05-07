# FROM node:12.13-alpine As development

# WORKDIR /usr/src/app

# COPY ["package.json", "package-lock.json", "nx.json", "./"]

# RUN npm i -D @nrwl/cypress@12.0.8
# RUN npm install --only=development

# COPY . .

# RUN npm run build

# FROM node:12.13-alpine as production

# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}

# WORKDIR /usr/src/app

# # ENV PATH /usr/src/app/node_modules/.bin:$PATH

# COPY package*.json ./

# RUN npm install --only=production

# COPY . .

# COPY --from=development /usr/src/app/dist ./dist

# CMD ["node", "dist/main"]

FROM node:12.18-alpine AS development

WORKDIR /usr/src/app

COPY ["package*.json", "nx.json", "./"]
RUN npm install

COPY . .

# RUN npm install -g @angular/cli 
RUN npm install -g @nrwl/cli@12.0.1

ENV PORT=3333
ENV PORT_SSR=4000
EXPOSE ${PORT}

RUN nx build --prod

CMD nx serve nest-api