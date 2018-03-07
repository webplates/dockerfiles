FROM alpine:3.7

RUN apk add --no-cache openssl ca-certificates

ARG STUNNEL_VERSION

RUN if [[ -z "$STUNNEL_VERSION" ]]; then echo "STUNNEL_VERSION argument MUST be set" && exit 1; fi

RUN apk add --no-cache stunnel=${STUNNEL_VERSION}

RUN mkdir -p /etc/stunnel/conf.d

WORKDIR /etc/stunnel

COPY stunnel.conf .

CMD /usr/bin/stunnel /etc/stunnel/stunnel.conf
