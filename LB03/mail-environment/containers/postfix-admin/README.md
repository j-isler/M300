# Postfixadmin Adminconsole für Benutzerverwaltung

## Umgebungsvariablen

>`POSTFIXADMIN_DB_TYPE` Dies definiert was für einen Datenbanktyp wir verwenden.
---
>`POSTFIXADMIN_DB_HOST` Hier wird die IP des MariaDB Containers eingegeben.
---
>`POSTFIXADMIN_DB_USER` Diese Variable enthält den Benutzer, der von Postfixadmin zum Verbinden auf die Datenbank verwendet wird.
---
>`POSTFIXADMIN_DB_PASSWORD` Das Passwort für den Benutzer ist hier abgespeichert.
---
>`POSTFIXADMIN_DB_NAME` Hier wird der Name der Datenbank angegeben.
---

## Container ausführen

```
docker run \
-e POSTFIXADMIN_DB_TYPE=mysqli \
-e POSTFIXADMIN_DB_HOST=`MYHOST` \
-e POSTFIXADMIN_DB_USER=postfixadmin \
-e POSTFIXADMIN_DB_PASSWORD=`MYPASSWORD`\
-e POSTFIXADMIN_DB_NAME=postfixadmin \
--name postfixadmin \
-p 80:80 \
docker.pkg.github.com/baru5201/m300/postfix-admin:0.1
```
