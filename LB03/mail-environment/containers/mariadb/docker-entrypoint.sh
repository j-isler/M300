set -e

password=$POSTFIXADMIN_PASSWORD

echo "configuring mariadb database..." 
sed -i "s/password/$password/g" /docker-entrypoint-initdb.d/postfixadmin-script.sql

mysqld_safe

# https://stackoverflow.com/questions/46482257/how-to-add-a-startup-script-to-a-mysql-docker-container






