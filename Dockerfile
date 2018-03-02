FROM python:3.6-alpine3.7

ARG LOCUST_VERSION

RUN if [[ -z "$LOCUST_VERSION" ]]; then echo "LOCUST_VERSION argument MUST be set" && exit 1; fi

RUN set -xe \
    && apk add --no-cache ca-certificates build-base \
    && pip install locustio==${LOCUST_VERSION} \
    && apk del build-base

RUN mkdir -p /locust

WORKDIR /locust

EXPOSE 8089 5557 5558
ENTRYPOINT ["/usr/local/bin/locust"]
