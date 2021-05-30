#!/bin/bash

service caddy start
yes "4" | bash status.sh s

yes "4" | bash status.sh c


touch /root/.aria2/aria2.session
chmod 0777 /root/.aria2/ -R


nohup ./FolderMagic -aria "http://127.0.0.1:6800/jsonrpc" -auth root:$Aria2_secret -bind :9184 -root / -wd /webdav >> /dev/null 2>&1 & 

mkdir /.config/
mkdir /.config/rclone
touch /.config/rclone/rclone.conf
echo "$Rclone" >>/.config/rclone/rclone.conf
wget git.io/tracker.sh
chmod 0777 /tracker.sh
/bin/bash tracker.sh "/root/.aria2/aria2.conf"



git clone https://github.com/wwpry/bot-h
mkdir /bot/
mv /bot-h/bot/* /bot/
#cp /bot-h/nginx.conf /etc/nginx/
#cp /new/index.html /root/
#chmod 0777 /root/index.html
chmod 0777 /bot/ -R
rm -rf /bot-h
#python3 /bot/nginx.py
#nginx -c /etc/nginx/nginx.conf
#nginx -s reload

nohup aria2c --conf-path=/root/.aria2/aria2.conf --rpc-listen-port=8080 --rpc-secret=$Aria2_secret &
#nohup python3 /bot/web.py &

python3 /bot/main.py
