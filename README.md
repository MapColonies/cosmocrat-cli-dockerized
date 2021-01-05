# cosmocrat-cli-dockerized
a dockerized version of the [cosmocrat-cli](https://github.com/MapColonies/cosmocrat-cli) tool

### Building the container

```
    docker build -f ./Dockerfile -t cosmocrat-cli .
```

### Running the container

```
    docker run -t cosmocrat-cli \
    cosmocrat -h
```
