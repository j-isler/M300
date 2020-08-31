FROM ubuntu:18.04



# update container packets
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install apt-utils -y


# configure postfix installation settings
RUN echo "postfix postfix/mailname string mail.jenia-isler.ch" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

# install postfix
RUN apt-get install --assume-yes postfix

# reload settings
RUN service postfix reload

# start postfix service
RUN service postfix start