# solutions-nx-dnnnr-template

- nx monorepo
- docker (multi-stage builds)
- node
- nginx
- nestjs
- react

## Running Node Programs on Linux via Docker container

<!-- ### Utilize `docker build` command

Create 'npm' image from custom Dockerfile file.
This command also mirrors package.json from host to container.

```yaml
# command 1
docker build -f ./tools/docker/npm.util.dockerfile -t npm .
```

Install project dependencies.
Run `npm` utility container and execute commands

```yaml
# command 2
docker run -it -v ${pwd}:/app npm install
``` -->

### Manage the project in (Ubuntu) Linux

There is no need for Node installation in Ubuntu therefore the way to
run Node applications in this scenario is to create a light 'utility'
Docker image with a Node installation.
That way we can run npm custom script via `npm` utility container.

<!-- #### Build `npm` utility image

```yaml
docker build -f ./tools/docker/npm.util.dockerfile -t npm .
``` -->

#### Build `npm` utility image and install dependencies

```yaml
docker-compose run --rm npm install
```

#### Utilize build scripts

```yaml
# nest-api
nx build nest-api
docker-compose run --rm npm run build:nest-api # WSL/Ubuntu

# react-client
nx build react-client
docker-compose run --rm npm run build:react-client # WSL/Ubuntu

# apps
nx run-many --target=build --projects=nest-api,react-client --parallel
docker-compose run --rm npm run build:apps # WSL/Ubuntu
```

#### Utilize serve scripts

```yaml
# nest-api
nx serve nest-api
docker-compose run --rm npm run serve:nest-api # WSL/Ubuntu

# react-client
nx serve react-client
docker-compose run --rm npm run serve:react-client # WSL/Ubuntu

# apps
nx run-many --target=serve --projects=nest-api,react-client --parallel
docker-compose run --rm npm run serve:apps # WSL/Ubuntu
```

#### Utilize deploy scripts

```yaml
# nest-api
nx deploy nest-api
docker build -f ./tools/docker/nest-api.prod.dockerfile . -t nest-api
docker-compose run --rm npm run deploy:nest-api # WSL/Ubuntu

# react-client
nx deploy react-client
docker build -f ./tools/docker/react-client.prod.dockerfile . -t react-client
docker-compose run --rm npm run deploy:react-client # WSL/Ubuntu

# apps
nx run-many --target=deploy --projects=nest-api,react-client --parallel
docker-compose run --rm npm run deploy:apps # WSL/Ubuntu
```

---

#### SOURCES

https://blog.nrwl.io/nx-and-node-microservices-b6df3cd1bad6

#### FIXES

- docker-compose hangs

  https://jensneuhaus.medium.com/how-to-fix-a-docker-compose-build-running-forever-afda4338168e
