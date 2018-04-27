cp /root/conf/config.json /root/config.json
cd vendors
if [ ! -f "/root/conf/init.lock" ];then
  npm run install-server
  touch /root/conf/init.lock
fi
node server/app.js