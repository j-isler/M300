# Mariadb Maildatabase

## Umgebungsvariablen
>`MYSQL_ROOT_PASSWORD` Dies ist das Passwort welches dann für den Root User gesetzt wird.
---
>`POSTFIXADMIN_PASSWORD` Dies ist das Passwort welches dann für den Postfixadmin Datenbank User gesetzt wird. Dieses ist das Passwort, welches dann beim DB Connect von der Postfixadmin Applikation gebraucht wird. 

## Container Ausführen
```
docker run -d \
  -e MYSQL_ROOT_PASSWORD = 'myPass'
  -e POSTFIXADMIN_PASSWORD = 'myOtherPass'
  -p 3306
  postixadmin-mariadb
```

