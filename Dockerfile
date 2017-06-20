FROM alpine:3.5

ENV VERSION 2.2.0

RUN set -ex \
      && apk add --no-cache --virtual .fetch-deps openssl tar \
      && wget -qO proxy.tar.gz https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-${VERSION}.linux-amd64.go1.8.1.tar.gz \
      && tar -xzf proxy.tar.gz \
      && cp oauth2_proxy-${VERSION}.linux-amd64.go1.8.1/oauth2_proxy /usr/bin \
      && chown root:root /usr/bin/oauth2_proxy \
      && rm proxy.tar.gz \
      && rm -rf oauth2_proxy-${VERSION}.linux-amd64.go1.8.1 \
      && apk del .fetch-deps

ENTRYPOINT ["oauth2_proxy"]
CMD ["--help"]
