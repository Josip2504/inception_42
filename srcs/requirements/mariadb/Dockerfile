FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    rm -rf /var/lib/apt/lists/*

COPY tools/configure.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/configure.sh

VOLUME /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/configure.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0", "--user=mysql", "--socket=/var/run/mysqld/mysqld.sock"]