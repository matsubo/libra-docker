FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt install -y git sudo curl unzip expect
RUN git clone https://github.com/libra/libra.git

WORKDIR /tmp/
RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip && \
unzip protoc-3.6.1-linux-x86_64.zip -d protoc3 && sudo mv protoc3/bin/* /usr/local/bin/ && sudo mv protoc3/include/* /usr/local/include/

WORKDIR /libra
COPY setup.sh /libra/setup.sh
RUN chmod 755 setup.sh
RUN bash setup.sh

RUN source /root/.cargo/env
RUN cargo build

CMD ["./scripts/cli/start_cli_testnet.sh"]

