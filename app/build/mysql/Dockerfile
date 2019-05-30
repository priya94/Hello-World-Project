FROM mysql:5.7.21

ENV MYSQL_USER=developer
ENV MYSQL_PASSWORD=developer
ENV MYSQL_ROOT_PASSWORD=letmein
ENV MYSQL_DB=mydb
ENV TZ="Europe/Berlin"
ENV MYSQL_ALLOW_EMPTY_PASSWORD=true
ADD percona-release_0.1-9.stretch_all.deb .
RUN apt-get update && apt-get install -y lsb-release && dpkg -i percona-release_0.1-9.stretch_all.deb && apt-get update && apt-get install -y percona-xtrabackup-24 qpress && apt-get -q -y clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY mysql-add-user.sh /docker-entrypoint-initdb.d/
