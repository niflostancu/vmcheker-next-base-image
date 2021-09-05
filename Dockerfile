FROM ubuntu:20.04

WORKDIR /base
COPY ./base/main.sh .

ENV CHECKER_DATA_DIRECTORY=/data/checker

RUN apt-get update -yqq \
    && apt-get install -yqq build-essential \
    && chmod +x /base/main.sh \
    && ln /base/main.sh /usr/local/bin/bash
