CREATE USER 'postfixadmin'@'0.0.0.0' IDENTIFIED BY 'toor';
CREATE DATABASE postfixadmin;
GRANT ALL PRIVILEGES ON postfixadmin.* TO 'postfixadmin'@'0.0.0.0';
FLUSH PRIVILEGES;