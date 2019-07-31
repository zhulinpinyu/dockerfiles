FROM alpine:3.9

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
    && sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd \
    && apk --update --no-cache add bash \
     tzdata \
     exiftool \
    && rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
