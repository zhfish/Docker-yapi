FROM node:8-alpine
LABEL maintainer="wangchen@zhfish.net"
ENV VERSION 1.3.17

COPY ./localtime /etc/localtime
COPY ./timezone /etc/timezone

WORKDIR /root

RUN \
  apk update && \
  apk upgrade && \
  apk add openssl unzip python git make && \
  git clone --branch v${VERSION} https://github.com/YMFE/yapi.git && \
  mv yapi vendors && \
  cd vendors && \
  npm install --production && \
  apk del openssl unzip python git make && \
  rm -rf /tmp/* /var/cache/apk/*

COPY ./run.sh /root/run.sh

EXPOSE 8080

CMD [ "sh", "run.sh" ]




