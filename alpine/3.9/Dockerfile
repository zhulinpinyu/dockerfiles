FROM alpine:3.9

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
    && sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd \
    && apk --update --no-cache add bash \
     git \
     yarn \
     tzdata \
     exiftool \
     ffmpeg \
    # libheif-tools \ #alpine 3.9 not support
    && rm -rf /var/cache/apk/*

#BEGIN install libheif
RUN apk add --update --no-cache automake \
        autoconf \
        libtool \
        alpine-sdk \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        && rm -rf /var/cache/apk/*

RUN git clone -b frame-parallel https://github.com/strukturag/libde265.git --depth 1 \
    && git clone -b v1.4.0 https://github.com/strukturag/libheif.git --depth 1 \
    && cd libde265 \
    && ./autogen.sh \
    && ./configure \
    && make -j8 install \
    && cd ../libheif \
    && ./autogen.sh \
    && ./configure \
    && make -j8 install \
    && cd .. \
    && rm -fr libde265 libheif
#END install libheif

CMD ["/bin/sh"]
