FROM ubuntu:18.04

# Expose SMTP service
EXPOSE 25
EXPOSE 12345


# update container packets
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install apt-utils -y


# configure postfix installation settings
RUN echo "postfix postfix/mailname string mail.jenia-isler.ch" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

# install postfix
RUN apt-get install --assume-yes postfix postfix-mysql

# Copy Entrypoint script in the container
COPY docker-entrypoint.sh /
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
CMD ["bash","/docker-entrypoint.sh"]


# run entrypoint script
RUN bash ./docker-entrypoint.sh

ENTRYPOINT ["postfix", "start-fg"]