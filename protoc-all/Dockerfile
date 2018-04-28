FROM alpine:3.7 AS downloader

RUN apk add --no-cache ca-certificates openssl


FROM golang:1.10 AS gobuilder

RUN INSTALL_DIRECTORY=/usr/bin wget -qO- https://raw.githubusercontent.com/golang/dep/master/install.sh | sh


FROM downloader AS protoc

ARG PROTOC_VERSION

RUN if [[ -z "$PROTOC_VERSION" ]]; then echo "PROTOC_VERSION argument MUST be set" && exit 1; fi

ENV DOWNLOAD_URL https://github.com/google/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip

RUN wget -O /tmp/protoc.zip $DOWNLOAD_URL


FROM gobuilder AS protoc-go

RUN go get github.com/golang/protobuf/protoc-gen-go


FROM gobuilder AS protoc-twirp

RUN go get github.com/twitchtv/twirp/protoc-gen-twirp


FROM gobuilder AS protoc-twirpphp

RUN set -xe \
    && go get github.com/twirphp/twirp/protoc-gen-twirp_php \
    && cd /go/src/github.com/twirphp/twirp/protoc-gen-twirp_php \
    && dep ensure -vendor-only \
    && go install


FROM frolvlad/alpine-glibc:alpine-3.7

WORKDIR /proto

COPY --from=protoc /tmp/protoc.zip /tmp

RUN set -xe \
    && unzip /tmp/protoc.zip -x readme.txt -d /usr

COPY --from=protoc-go /go/bin/protoc-gen-go /usr/bin
COPY --from=protoc-twirp /go/bin/protoc-gen-twirp /usr/bin
COPY --from=protoc-twirpphp /go/bin/protoc-gen-twirp_php /usr/bin
