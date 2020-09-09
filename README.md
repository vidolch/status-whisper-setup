# Ethereum messaging Status Docker wrap

This docker image is using the [status-go](https://github.com/status-im/status-go) implementation

## Building

```
docker build --pull --rm -f "Dockerfile" -t simple-status:latest "."
```

## Running 

```
docker run -p 30303:30303 -p 8545:8545 -p 9090:9090 simple-status:latest
```