FROM node:16.6.2-alpine3.14

WORKDIR /app
VOLUME /app/repository

ENTRYPOINT [ "/bin/sh", "/app/repository/keepAlive.sh" ]

