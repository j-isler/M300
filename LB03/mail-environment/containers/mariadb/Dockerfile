FROM mariadb:10.1

# Copy Entrypoint script in the container
COPY ./docker-entrypoint.sh /

COPY ./postfixadmin-script.sql /

CMD bash /docker-entrypoint.sh
