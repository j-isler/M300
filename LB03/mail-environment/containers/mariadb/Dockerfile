FROM mariadb:10.1

EXPOSE 3306

# Copy Entrypoint script in the container
COPY ./docker-entrypoint.sh /

COPY ./postfixadmin-script.sql /docker-entrypoint-initdb.d

ENTRYPOINT ['bash,'/docker-entrypoint.sh']

CMD ['mysqld']



