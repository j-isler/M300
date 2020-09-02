FROM php:apache

# Expose SMTP service
EXPOSE 80

RUN apt-get update -y

# RUN apt-get install libapache2-mod-php php php-common php-mbstring php-imap php-mysql -y

RUN apt-get install git -y
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli pdo pdo_mysql
WORKDIR /var/www/html
RUN git clone https://github.com/postfixadmin/postfixadmin.git
COPY ./docker-entrypoint.sh /

RUN [ "bash", "/docker-entrypoint.sh" ]
