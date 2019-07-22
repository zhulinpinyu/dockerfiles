FROM alpine:3.9
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN apk add --no-cache automake \
        autoconf \
        libtool \
        alpine-sdk \
        libjpeg-turbo \
        libjpeg-turbo-dev

WORKDIR /work

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
