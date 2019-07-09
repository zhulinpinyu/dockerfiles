FROM alpine:3.9

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN apk --update --no-cache add bash tzdata

CMD ["/bin/sh"]
