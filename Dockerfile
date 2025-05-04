FROM ubuntu:22.04

WORKDIR /base
COPY ./base/main.sh .

ENV CHECKER_DATA_DIRECTORY=/data/checker

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update -yqq \
        && apt-get install -yqq build-essential python3 \
        && chmod +x /base/main.sh \
        && ln /base/main.sh /usr/local/bin/bash
