up-nest-api:
	docker-compose up -d --force-recreate nest-api

logs:
	docker-compose logs -f

install-nest-api:
	docker-compose run --rm nest-api "npm install"

into-nest-api:
	docker-compose exec nest-api bash

unrootify:
	sudo chown -R $$(id -u):$$(id -g) .

