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
- mkdir -p /docker/yapi/conf /docker/yapi/data
- copy config/config.json to /docker/yapi/conf
```
version: '2'
services:
  yapi:
    image: zhfish/yapi:1.8.5
    privileged: false
    restart: always
    links:
    - mongo
    ports:
    - 8080:8080
    volumes:
    - /docker/yapi/conf:/root/conf
  mongo:
    image: mongo:3.6
    privileged: false
    restart: always
    expose:
    - 27017
    volumes:
    - /etc/localtime:/etc/localtime:ro
    - /etc/timezone:/etc/timezone:ro
    - /docker/yapi/data:/data/db
```
