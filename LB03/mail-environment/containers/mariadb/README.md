# Mariadb Maildatenbank

## Umgebungsvariablen
>`MYSQL_ROOT_PASSWORD` Dies ist das Passwort welches für den Root User gesetzt wird.
---
>`POSTFIXADMIN_PASSWORD` Dies ist das Passwort welches für den Postfixadmin Datenbank User gesetzt wird. Dieses ist das Passwort, welches ebenfalls beim DB Connect von der Postfixadmin Applikation gebraucht wird. 

## Container Ausführen
```
docker run -d \
  -e MYSQL_ROOT_PASSWORD='myPass'
  -e POSTFIXADMIN_PASSWORD='myOtherPass'
  -p 3306
  docker.pkg.github.com/baru5201/m300/mariadb:0.1
```

