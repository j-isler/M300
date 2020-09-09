set -e

password="toor"

echo "configuring mariadb database..." 
mysql -u root -psecret <<EOF
CREATE USER 'postfixadmin'@'%' IDENTIFIED BY $password;
CREATE DATABASE postfixadmin;
GRANT ALL PRIVILEGES ON postfixadmin.* TO 'postfixadmin'@'%';
FLUSH PRIVILEGES;
EOF


# https://stackoverflow.com/questions/46482257/how-to-add-a-startup-script-to-a-mysql-docker-container






