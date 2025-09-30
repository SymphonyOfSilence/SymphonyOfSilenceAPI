FROM ubuntu:latest
LABEL authors="darkness"

ENTRYPOINT ["top", "-b"]