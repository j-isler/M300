FROM ubuntu:18.04

# Expose SMTP service
EXPOSE 25


# update container packets
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install apt-utils -y


# configure postfix installation settings
RUN echo "postfix postfix/mailname string mail.jenia-isler.ch" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

# install postfix
RUN apt-get install --assume-yes postfix

RUN apt-get install -y rsyslog


ENTRYPOINT [ "/bin/sh", "-c" ]


# start postfix service
CMD ["postfix", "start"]  


# reload settings
CMD ["postfix", "reload"]  

