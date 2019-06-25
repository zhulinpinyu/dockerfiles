FROM alpine:3.8 as deps
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories && \
    sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

RUN apk add --no-cache libgomp zlib libpng libjpeg-turbo libwebp tiff lcms2 \
  freetype fontconfig ghostscript ghostscript-fonts \
  openexr x265

FROM deps as builder
RUN apk add --no-cache alpine-sdk automake autoconf libtool bash
RUN apk add --no-cache zlib-dev libpng-dev libjpeg-turbo-dev \
  freetype-dev fontconfig-dev ghostscript-dev libwebp-dev tiff-dev lcms2-dev \
  openexr-dev x265-dev

WORKDIR /work
RUN git clone -b frame-parallel https://github.com/strukturag/libde265.git
WORKDIR libde265
RUN ./autogen.sh && ./configure && make -j8 install

WORKDIR /work
RUN git clone https://github.com/strukturag/libheif.git
WORKDIR libheif
RUN ./autogen.sh && ./configure && make -j8 install