#!/bin/bash
echo "HOSTNAME=$HOSTNAME"

MYSQL_ROOT_PASSWORD=$(cat /run/secrets/mysql-root-pass)

mkdir -p /data/gogs/conf
sed "s/HOSTNAME/${HOSTNAME}/g" app.ini | \
    sed "s/MYSQL_ROOT_PASSWORD/${MYSQL_ROOT_PASSWORD}/g" \
    >> /data/gogs/conf/app.ini

#start gogs
/app/gogs/docker/start.sh /bin/s6-svscan /app/gogs/docker/s6/