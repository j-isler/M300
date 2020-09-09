# Mariadb Maildatabase

##Container Ausführen
```
docker run -d \
  -e MYSQL_ROOT_PASSWORD = 'myPass'
  -e $POSTFIXADMIN_PASSWORD = 'myOtherPass'
  -p 3306
  postixadmin-mariadb
```
