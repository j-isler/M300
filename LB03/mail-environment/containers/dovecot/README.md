# Dovecot Mail Delivery Agent

## Umgebungsvariablen

>`DOMAIN` Hier wird die Domain definiert, welche für die Mailadressen verwendet wird.
---
>`POSTFIXHOST` Hier wird die IP des MariaDB Containers eingegeben.
---
>`POSTFIXADMINUSER` Diese Variable enthält den Benutzer, der von Postfixadmin zum Verbinden auf die Datenbank verwendet wird.
---
>`POSTFIXADMINPW` Das Passwort für den Benutzer ist hier abgespeichert.
---
>`POSTFIXADMINDB` Hier wird der Name der Datenbank angegeben.
---

## Container ausführen

```
docker run -d \
-e DOMAIN=`MYDOMAIN` \
-e POSTFIXHOST=`MYHOST` \
-e POSTFIXADMINUSER=postfixadmin \
-e POSTFIXADMINPW=`MYPASSWORD`\
-e POSTFIXADMINDB=postfixadmin \
--name dovecot \
dovecot
```
