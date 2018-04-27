FROM node:8-alpine
LABEL maintainer="wangchen@zhfish.net"
ENV VERSION 1.3.12

COPY ./localtime /etc/localtime
COPY ./timezone /etc/timezone

WORKDIR /root

RUN \
  echo 'https://mirrors.aliyun.com/alpine/v3.6/main' > /etc/apk/repositories && \
  echo 'https://mirrors.aliyun.com/alpine/v3.6/community' >> /etc/apk/repositories && \
  apk update && \
  apk upgrade && \
  apk add openssl unzip python git make && \
  wget https://gitee.com/mirrors/YApi/repository/archive/v${VERSION}.zip && \
  unzip v${VERSION}.zip && \
  rm v${VERSION}.zip && \
  mv YApi vendors && \
  cd vendors && \
  npm install --production --registry https://registry.npm.taobao.org && \
  apk del openssl unzip python git make && \
  rm -rf /tmp/* /var/cache/apk/*

COPY ./run.sh /root/run.sh

EXPOSE 8080

CMD [ "sh", "run.sh" ]




