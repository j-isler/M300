CREATE USER 'postfixadmin'@'%' IDENTIFIED BY 'password';
CREATE DATABASE postfixadmin;
GRANT ALL PRIVILEGES ON postfixadmin.* TO 'postfixadmin'@'%';
FLUSH PRIVILEGES;
