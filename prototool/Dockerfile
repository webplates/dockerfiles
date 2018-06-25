FROM alpine:3.7 AS downloader

RUN apk add --no-cache ca-certificates openssl

ARG PROTOTOOL_VERSION

RUN if [[ -z "$PROTOTOOL_VERSION" ]]; then echo "PROTOTOOL_VERSION argument MUST be set" && exit 1; fi

ENV DOWNLOAD_URL https://github.com/uber/prototool/releases/download/v${PROTOTOOL_VERSION}/prototool-Linux-x86_64

RUN set -xe \
    && wget -O /tmp/prototool $DOWNLOAD_URL \
    && chmod +x /tmp/prototool


FROM frolvlad/alpine-glibc:alpine-3.7

RUN apk add --no-cache ca-certificates openssl

WORKDIR /proto

COPY --from=downloader /tmp/prototool /usr/bin

ENTRYPOINT ["prototool"]

CMD ["-h"]
