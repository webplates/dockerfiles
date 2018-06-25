FROM alpine:3.7 AS downloader

RUN apk add --no-cache ca-certificates openssl

ARG PROTOLOCK_VERSION
ARG PROTOLOCK_BUILD

RUN if [[ -z "$PROTOLOCK_VERSION" || -z "$PROTOLOCK_BUILD" ]]; then echo "PROTOLOCK_VERSION and PROTOLOCK_BUILD arguments MUST be set" && exit 1; fi

ENV DOWNLOAD_URL https://github.com/nilslice/protolock/releases/download/${PROTOLOCK_VERSION}/protolock.${PROTOLOCK_BUILD}.linux-amd64.tgz

RUN set -xe \
    && wget -O /tmp/protolock.tgz $DOWNLOAD_URL \
    && tar xzf /tmp/protolock.tgz -C /tmp


FROM alpine:3.7

WORKDIR /proto

COPY --from=downloader /tmp/protolock /usr/bin

ENTRYPOINT ["protolock"]

CMD ["-h"]
