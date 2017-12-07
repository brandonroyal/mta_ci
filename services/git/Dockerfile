FROM gogs/gogs:latest 

COPY mta /data/git/gogs-repositories/mta

COPY bootstrap.sh ./bootstrap.sh

COPY app.ini ./app.ini

ENTRYPOINT sh bootstrap.sh
CMD ["echo", "gogs"]