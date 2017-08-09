FROM alpine

ENV OAUTH2_PROXY_SHORT_VERSION=2.2
ENV OAUTH2_PROXY_VERSION=2.2.0
ENV GOLANG_VERSION=1.8.1
ENV ARCHIVE=oauth2_proxy-$OAUTH2_PROXY_VERSION.linux-amd64.go$GOLANG_VERSION

RUN apk --no-cache add curl

RUN curl -sL -o oauth2_proxy.tar.gz \
    "https://github.com/bitly/oauth2_proxy/releases/download/v$OAUTH2_PROXY_SHORT_VERSION/$ARCHIVE.tar.gz" \
  && tar xzvf oauth2_proxy.tar.gz \
  && cp $ARCHIVE/oauth2_proxy /bin \
  && chmod +x /bin/oauth2_proxy

# For someday I can use multistage build on Docker Hub.
# FROM busybox
# COPY --from=0 /bin/oauth2_proxy /bin/

ENTRYPOINT ["oauth2_proxy"]
