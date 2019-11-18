FROM node:10-alpine
LABEL MAINTAINER=zhfish<"wangchen@zhfish.net">

ENV VERSION=1.8.5
ENV ADMIN_ACCOUNT=admin@yapi.com

WORKDIR /root

COPY ./run.sh /home/run.sh

RUN set -x && \
  apk update && \
  apk upgrade && \
  apk add openssl unzip python git make && \
  npm i -g yapi-cli && \
  rm -rf /tmp/* /var/cache/apk/*

EXPOSE 3000

CMD [ "sh", "/home/run.sh" ]




