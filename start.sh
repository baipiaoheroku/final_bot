#!/bin/bash


touch /root/.aria2/aria2.session
chmod 0777 /root/.aria2/ -R


nohup filebrowser -r /  -p 9184 >> /dev/null 2>&1 & 

mkdir /.config/
mkdir /.config/rclone
touch /.config/rclone/rclone.conf
echo "$Rclone" >>/.config/rclone/rclone.conf
wget git.io/tracker.sh
chmod 0777 /tracker.sh
/bin/bash tracker.sh "/root/.aria2/aria2.conf"


rm -rf /bot
git clone "https://${git_admin}:${git_pass}@github.com/666wcy/new_bot"  >> /dev/null 2>&1
mkdir /bot/
mv /new_bot/bot/* /bot/
cp /new_bot/nginx.conf /etc/nginx/
cp /new_bot/config/upload.sh /
chmod 0777 /upload.sh
mkdir /index/
cp /new_bot/index.html /index/
chmod 0777 /index/index.html
chmod 0777 /bot/ -R
rm -rf /new_bot
python3 /bot/nginx.py
nginx -c /etc/nginx/nginx.conf
nginx -s reload

nohup aria2c --conf-path=/root/.aria2/aria2.conf --rpc-listen-port=8080 --rpc-secret=$Aria2_secret &
#nohup python3 /bot/web.py &

python3 /bot/main.py
