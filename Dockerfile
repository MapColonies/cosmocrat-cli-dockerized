FROM python:3.6-alpine3.12
ENV COSMOCRATOR_VERSION=0.0.2
ENV OSMOSIS_VERSION=0.48.2

RUN apk update -q --no-cache \
    && apk add -q --no-cache \
    python3 \
    py3-pip \
    wget \
    curl \
    unzip \
    build-base \
    git \
    openjdk11 \
    gradle \
    zlib-dev

# osmosis:
RUN set -x \
  && adduser -S osmosis \
  && mkdir -p /opt/osmosis \
  && cd /opt/osmosis \
  && curl -L -o osmosis-$OSMOSIS_VERSION.tgz "https://github.com/openstreetmap/osmosis/releases/download/$OSMOSIS_VERSION/osmosis-$OSMOSIS_VERSION.tgz" \
  && tar -xzvf osmosis-$OSMOSIS_VERSION.tgz \
  && rm -f osmosis-$OSMOSIS_VERSION.tgz \
  && ln -s /opt/osmosis/bin/osmosis /usr/bin/osmosis

# osmupdate
RUN mkdir -p /opt/osmupdate \
  && cd /opt/osmupdate \
  && wget -O - http://m.m.i24.cc/osmupdate.c | cc -x c - -o osmupdate \
  && ln -s /opt/osmupdate/osmupdate /usr/bin/osmupdate

# osmconvert
RUN mkdir -p /opt/osmconvert \
  && cd /opt/osmconvert \
  && wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert \
  && ln -s /opt/osmconvert/osmconvert /usr/bin/osmconvert

WORKDIR /app

# from pypi:
RUN pip3 install cosmocrat-cli==$COSMOCRATOR_VERSION
CMD ["cosmocrat", "-h"]