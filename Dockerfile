FROM debian/eol:wheezy

ENV DEBIAN_FRONTEND=noninteractive

# debian 7 reached EOL a long time ago
RUN echo 'deb http://archive.debian.org/debian wheezy main' > /etc/apt/sources.list

RUN apt-get -o Acquire::Check-Valid-Until=false update

RUN apt-get install -y --no-install-recommends \
    python2.7 \
    sg3-utils

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

CMD ["python2.7", "OpenLFConnect.py"]