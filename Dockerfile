FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV PHANTOM_JS_VERSION 1.9.8-linux-x86_64

RUN apt-get update && \
  apt-get install -y bzip2 curl libfreetype6 libfontconfig && \
  rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOM_JS_VERSION.tar.bz2 | tar xjC /
RUN ln -s phantomjs-$PHANTOM_JS_VERSION /phantomjs

VOLUME ["/phantomjs"]
ENTRYPOINT ["/phantomjs/bin/phantomjs"]
