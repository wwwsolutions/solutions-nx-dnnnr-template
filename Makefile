#!make
include .env
export $(shell sed 's/=.*//' .env)

# test:
# 	@echo NODE_ENV=$$NODE_ENV

test:
	@echo docker build --build-arg ARG_MESSAGE=$$NODE_ENV -f ./tools/docker/nest-api.$$NODE_ENV.dockerfile -t nest-api:$$NODE_ENV .	


build-util-npm:
	docker build -f ./tools/docker/npm.util.dockerfile --force-rm . -t npm:util

# build-util-npm:
# 	docker-compose build --force-rm npm

install:
	docker-compose run --rm npm install

build-api:
	docker build \
	--force-rm \
	--build-arg ARG_MESSAGE=$$NODE_ENV \
	--build-arg ARG_BASE_IMAGE=$$BASE_IMAGE	\
	--build-arg ARG_PORT=$$PORT \
	-f ./tools/docker/nest-api.$$NODE_ENV.dockerfile \
	-t nest-api:$$NODE_ENV \
	.


#############################################################

build-dev-nest-api:
	docker build -f ./tools/docker/nest-api.dockerfile -t nest-api:dev --target development .

# build-dev-nest-api:
# 	docker build -f ./tools/docker/nest-api.dev.dockerfile . -t nest-api:dev


build-prod-nest-api:
	docker build -f ./tools/docker/nest-api.dockerfile -t nest-api:prod --target production .

# build-prod-nest-api:
# 	docker build -f ./tools/docker/nest-api.prod.dockerfile . -t nest-api:prod

up-prod-nest-api:
	docker-compose up --remove-orphans -d nest-api

#############################################################

# build-nest-api:
# 	docker-compose run --rm npm run build:nest-api

serve-nest-api:
	docker-compose run --rm npm run serve:nest-api

###########################

build-dev-react-client:
	docker build -f ./tools/docker/react-client.dockerfile -t react-client:dev --target development .

# build-react-client:
# 	docker-compose run --rm npm run build:react-client

serve-react-client:
	docker-compose run --rm npm run serve:react-client

deploy-react-client:
	docker build -f ./tools/docker/react-client.prod.dockerfile . -t react-client

# up-nest-api:
# 	docker-compose up -d --force-recreate nest-api

# logs:
# 	docker-compose logs -f

# install-nest-api:
# 	docker-compose run --rm nest-api "npm install"

# into-nest-api:
# 	docker-compose exec nest-api bash

# unrootify:
# 	sudo chown -R $$(id -u):$$(id -g) .

