FROM alpine:latest

ADD https://raw.githubusercontent.com/mattddowney/gogs-bash/master/gogs gogs

RUN apk update \
    && apk upgrade \
    && apk add bash curl

ENTRYPOINT [ "bash", "gogs" ]