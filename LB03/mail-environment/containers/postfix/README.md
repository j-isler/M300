
# Postfix Mail Transfer Agent

## Umgebungsvariablen

>`DOVECOTIP` Hier wird die IP des Dovecot Containers angegeben.
---
>`POSTFIXHOST` Hier wird die IP des MariaDB Containers angegeben.
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
-e DOVECOTIP=`MYDOVECOTIP` \
-e POSTFIXHOST=`MYHOST` \
-e POSTFIXADMINUSER=postfixadmin \
-e POSTFIXADMINPW=`MYPASSWORD`\
-e POSTFIXADMINDB=postfixadmin \
--name postfix \
postfix
```
