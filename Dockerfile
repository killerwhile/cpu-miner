FROM ubuntu:20.04 as builder

WORKDIR /src

RUN apt update && apt install -y build-essential && apt install -y git libuv1-dev

COPY . /src
RUN make all

FROM ubuntu:20.04

RUN apt update && apt install -y libuv1

COPY --from=builder /src/bin/cpu-miner /cpu-miner

ENTRYPOINT ["/cpu-miner"]
