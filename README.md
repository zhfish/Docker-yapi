# Yapi dockerfile with mongo

## build
```
docker build -t yapi:1.8.5 .
```
## push
```
docker tag yapi:1.8.5 xxx/yapi:1.8.5
docker push xxx/yapi:1.8.5
```

## compose with mongo
- timezone's settting base Centos7  
- mkdir -p /docker/yapi/data /docker/yapi/db
- edit /docker/yapi/data/config.json
```
version: '2'
services:
  yapi:
    container_name: super_yapi
    image: zhfish/yapi:1.8.5
    privileged: false
    restart: always
    environment:
      VERSION: 1.8.5
      ADMIN_ACCOUNT: admin@yapi.com
    ports:
    - 8080:8080
    volumes:
    - /etc/localtime:/etc/localtime:ro
    - /etc/timezone:/etc/timezone:ro
    - /volume/yapi/data:/root/
  mongo:
    image: mongo:3.6
    privileged: false
    restart: always
    expose:
    - 27017
    volumes:
    - /etc/localtime:/etc/localtime:ro
    - /etc/timezone:/etc/timezone:ro
    - /volume/yapi/db:/data/db
```
## update and plugins
docker exec super_yapi yapi 
docker exec super_yapi yapi update
docker exec super_yapi yapi plugin

