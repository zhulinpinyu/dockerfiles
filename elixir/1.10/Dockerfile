FROM alpine:3.11

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd

ENV OTP_VERSION="23.0.3" \
    ELIXIR_VERSION="v1.10.4" \
    LANG=C.UTF-8

RUN set -xe \
    && OTP_DOWNLOAD_URL="https://github.com/erlang/otp/archive/OTP-${OTP_VERSION}.tar.gz" \
    && OTP_DOWNLOAD_SHA256="ed3c25742a2b76407dbb83d40cb95211caad5ab0969681f585a674e2e54840ac" \
    && apk add --no-cache --virtual .fetch-deps curl ca-certificates \
    && curl -fSL -o otp-src.tar.gz "$OTP_DOWNLOAD_URL" \
    && echo "$OTP_DOWNLOAD_SHA256  otp-src.tar.gz" | sha256sum -c - \
    && apk add --no-cache --virtual .build-deps \
        dpkg-dev dpkg \
        gcc \
        g++ \
        libc-dev \
        linux-headers \
        make \
        autoconf \
        ncurses-dev \
        openssl-dev \
        unixodbc-dev \
        lksctp-tools-dev \
        tar \
    && export ERL_TOP="/usr/src/otp_src_${OTP_VERSION%%@*}" \
    && mkdir -vp $ERL_TOP \
    && tar -xzf otp-src.tar.gz -C $ERL_TOP --strip-components=1 \
    && rm otp-src.tar.gz \
    && ( cd $ERL_TOP \
        && ./otp_build autoconf \
        && gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
        && ./configure --build="$gnuArch" \
        && make -j$(getconf _NPROCESSORS_ONLN) \
        && make install ) \
    && rm -rf $ERL_TOP \
    && find /usr/local -regex '/usr/local/lib/erlang/\(lib/\|erts-\).*/\(man\|doc\|obj\|c_src\|emacs\|info\|examples\)' | xargs rm -rf \
    && find /usr/local -name src | xargs -r find | grep -v '\.hrl$' | xargs rm -v || true \
    && find /usr/local -name src | xargs -r find | xargs rmdir -vp || true \
    && scanelf --nobanner -E ET_EXEC -BF '%F' --recursive /usr/local | xargs -r strip --strip-all \
    && scanelf --nobanner -E ET_DYN -BF '%F' --recursive /usr/local | xargs -r strip --strip-unneeded \
    && runDeps="$( \
      scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
        | tr ',' '\n' \
        | sort -u \
        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )" \
    && apk add --virtual .erlang-rundeps \
      $runDeps \
      lksctp-tools \
      ca-certificates \
    && apk del .fetch-deps .build-deps

RUN set -xe \
    && ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/${ELIXIR_VERSION}.tar.gz" \
    && ELIXIR_DOWNLOAD_SHA256="8518c78f43fe36315dbe0d623823c2c1b7a025c114f3f4adbb48e04ef63f1d9f" \
    && buildDeps=' \
      ca-certificates \
      curl \
      make \
    ' \
    && apk add --no-cache --virtual .build-deps $buildDeps \
    && curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
    && echo "$ELIXIR_DOWNLOAD_SHA256  elixir-src.tar.gz" | sha256sum -c - \
    && mkdir -p /usr/local/src/elixir \
    && tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
    && rm elixir-src.tar.gz \
    && cd /usr/local/src/elixir \
    && make install clean \
    && apk del .build-deps

RUN mix local.hex --force \
    && mix local.rebar --force

CMD ["iex"]
