FROM mariadb:10.11

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    dumb-init && \
    rm -rf /var/lib/apt/lists/*

# copy conf files
COPY ./conf/ /etc/mysql/conf.d/

# copy init scripts
COPY ./tools/ /docker-entrypoint-initdb.d/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/usr/local/bin/docker-entrypoint.sh", "mysqld"]

# exposing port
EXPOSE 3306