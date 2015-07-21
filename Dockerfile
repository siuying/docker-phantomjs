FROM resin/rpi-raspbian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV PHANTOM_JS_VERSION 1.9.0-linux-armv6l

RUN apt-get update && \
  apt-get install -y bzip2 curl libfreetype6 libfontconfig && \
  rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://github.com/aeberhardo/phantomjs-linux-armv6l/blob/master/phantomjs-1.9.0-linux-armv6l.tar.bz2?raw=true | tar xjC /
RUN ln -s phantomjs-$PHANTOM_JS_VERSION /phantomjs

VOLUME ["/phantomjs"]
ENTRYPOINT ["/phantomjs/bin/phantomjs"]
