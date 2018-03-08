FROM alpine:3.7

RUN apk --no-cache add \
        bash \
        enchant \
        aspell-en \
        git \
        make \
        python \
        py-pip \
        inotify-tools

COPY requirements.txt .

RUN pip install -r requirements.txt --no-cache-dir

WORKDIR /doc

VOLUME ["/doc"]

COPY entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
