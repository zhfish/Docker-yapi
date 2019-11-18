if [ ! -f "/root/init.lock" ];then
  cat > config.json << EOF
{ 
  "port": 3000, 
  "adminAccount":"$ADMIN_ACCOUNT",
  "db":{ 
    "servername":"mongo",
    "port": 27017, 
    "DATABASE": "yapi" 
  } 
}
EOF
  yapi install -v=$VERSION
fi
cd vendors
node server/app.js