# solutions-nx-dnnnr-template

- nx monorepo
- docker (multi-stage builds)
- node
- nginx
- nestjs
- react

## Running Node Programs on Linux via Docker container

### Utilize `docker build` command

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
```

### Manage the project in (Ubuntu) Linux

There is no need for Node installation in Ubuntu therefore the way to
run Node applications in this scenario is to create a light 'utility'
Docker image with a Node installation.
That way we can run npm custom script via `npm` utility container.

#### Build `npm` utility image and install dependencies

```yaml
docker-compose run --rm npm install
```

#### Execute scripts

```yaml
docker-compose run --rm npm run build:apps
docker-compose run --rm npm run build:nest-api
docker-compose run --rm npm run build:react-client
```

---

### Docker useful commands

#### Execute a command in a running container

```yaml
docker exec <service> <bash_command>
```

#### Remove all unused data

```yaml
docker system prune
```

#### Kill all run containers

```yaml
docker kill $(docker ps -q)
```

#### Stop all run containers

```yaml
docker stop $(docker ps -q)
```

#### Remove all images

```yaml
docker rmi $(docker images -q)
```

#### Remove all containers

```yaml
docker rm $(docker container ps -q)
```

#### SOURCES

https://blog.nrwl.io/nx-and-node-microservices-b6df3cd1bad6

#### FIXES

- docker-compose hangs

  https://jensneuhaus.medium.com/how-to-fix-a-docker-compose-build-running-forever-afda4338168e
