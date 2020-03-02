FROM debian:buster-slim

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y wget \
  && apt-get clean

ENV VERSION=3.0.13
RUN wget https://github.com/exercism/cli/releases/download/v${VERSION}/exercism-${VERSION}-linux-x86_64.tar.gz \
  && tar xzvf exercism-${VERSION}-linux-x86_64.tar.gz \
  && mv exercism /usr/local/bin \
  && rm exercism-${VERSION}-linux-x86_64.tar.gz 

RUN mkdir /workspace
WORKDIR /workspace

RUN useradd --home-dir /workspace -u 1000 user1
RUN chown user1 /workspace

USER user1

ENTRYPOINT ["/usr/local/bin/exercism"]
