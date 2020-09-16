FROM ubuntu:18.04

# Expose services
 EXPOSE 143
 EXPOSE 110
 EXPOSE 24
 EXPOSE 12345


# update container packets
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install apt-utils -y

# install dovecot
RUN apt-get install dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd dovecot-mysql -y > /dev/null

# Copy Entrypoint script in the container
COPY ./docker-entrypoint.sh /

# run entrypoint script
CMD bash ./docker-entrypoint.sh

ENTRYPOINT ["dovecot", "-F"]
