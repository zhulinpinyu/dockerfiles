FROM alpine:latest
LABEL maintainer="lixiangmu@gmail.com"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN apk --update add exiftool \
    && rm -rf /var/cache/apk/*
