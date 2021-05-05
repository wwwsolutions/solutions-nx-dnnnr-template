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
