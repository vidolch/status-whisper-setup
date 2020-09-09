FROM golang:buster

RUN apt install git
RUN git clone https://github.com/status-im/status-go \
    && cd ./status-go \
    && git reset --hard b7a7f2187fbcccd00a278b9bb0b5e639db1bd645 \
    && make setup-dev \
    && make statusgo \
    && cd ../ \
    && mv ./status-go/build ./build \
    && rm -rf ./status-go/*

COPY config.json ./config.json

# DevP2P
EXPOSE 30303
# JSON RPC
EXPOSE 8545
# Prometheus
EXPOSE 9090

ENTRYPOINT [ "build/bin/statusd", "-c", "./config.json" ]
