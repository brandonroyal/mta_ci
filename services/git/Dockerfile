FROM gogs/gogs:latest 

COPY bootstrap.sh ./bootstrap.sh

COPY app.ini ./app.ini

ENTRYPOINT sh bootstrap.sh
CMD ["echo", "gogs"]