FROM alpine:3.10

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
    && sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd \
    && apk --update --no-cache add bash \
     tzdata \
     exiftool \
     libheif-tools \
    && rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
