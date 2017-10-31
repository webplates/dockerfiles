FROM alpine:3.6 as downloader

ENV VERSION 3.0.1
ENV DOWNLOAD_URL https://github.com/mattes/migrate/releases/download/v$VERSION/migrate.linux-amd64.tar.gz

RUN apk add --no-cache ca-certificates openssl

RUN set -xe \
    && wget $DOWNLOAD_URL \
    && tar xvfz migrate.linux-amd64.tar.gz -C /tmp


FROM scratch

COPY --from=downloader /tmp/migrate.linux-amd64 /migrate

ENTRYPOINT ["/migrate"]
CMD ["--help"]
