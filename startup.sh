#!/bin/bash

echo "installing" > /var/log/container_status

echo "Running init script"
bash /tmp/init/init.sh

mkdir -p /srv/nodejs
cp -r /srv/code /srv/nodejs/app
chown -R www-data:www-data /srv/nodejs/app

echo "Running npm..."
cd /srv/nodejs/app
/usr/local/bin/npm install | tee /var/log/npm_install.log

PORT=${APP_PORT:-8080}
export PORT
sed -i s/REPLACE_TO_APP_PORT/${PORT}/g /etc/nginx/conf.d/app.conf

echo "complete" > /var/log/container_status

/usr/bin/supervisord
