# cosmocrat-cli-dockerized
a dockerized version of the [cosmocrat-cli](https://github.com/MapColonies/cosmocrat-cli) tool

The osm tools versions that are being used are static or set as build time variables
- `osmupdate` version 0.4.5
- `osmconvert` version 0.8.11
### Build argument variables
- `COSMOCRATOR_VERSION` - the version of cosmocrator-cli to be fetched from [pypi](https://pypi.org/project/cosmocrat-cli/)
- `OSMOSIS_VERSION` - the version of osmosis to be fetched from [github](https://github.com/openstreetmap/osmosis)

### Building the container

```
    docker build \
    --build-arg COSMOCRATOR_VERSION=0.0.2 \
    --build-arg OSMOSIS_VERSION=0.48.2 \
    -f ./Dockerfile -t cosmocrat-cli .
```

### Running the container

```
    docker run -t cosmocrat-cli
```
