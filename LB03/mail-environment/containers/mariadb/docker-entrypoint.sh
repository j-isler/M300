set -e

password="toor"

echo "configuring mariadb database..." 
sed -i "s/password/$password/g" /docker-entrypoint-initdb.d/postfixadmin-script.sql


# https://stackoverflow.com/questions/46482257/how-to-add-a-startup-script-to-a-mysql-docker-container






