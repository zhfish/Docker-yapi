# Yapi dockerfile with mongo

## docker hub mirror
https://www.daocloud.io/mirror

## build
```
docker build -t yapi:1.3.12 .
```
## push
```
docker tag yapi:1.3.12 xxx/yapi:1.3.12  
docker push xxx/yapi:1.3.12
```

## compose with mongo
- timezone's settting base Centos7  
- mkdir -p /docker/yapi/conf /docker/yapi/data
- copy config/config.json to /docker/yapi/conf
```
yapi:
  image: zhfish/yapi:1.3.12
  privileged: false
  restart: always
  links:
  - mongo
  ports:
  - 8080:8080
  volumes:
  - /docker/yapi/conf:/root/conf
mongo:
  image: mongo:3.4
  privileged: false
  restart: always
  expose:
  - 27017
  volumes:
  - /etc/localtime:/etc/localtime:ro
  - /etc/timezone:/etc/timezone:ro
  - /docker/yapi/data:/data/db
```
