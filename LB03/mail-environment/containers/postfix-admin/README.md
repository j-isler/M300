# Postfixadmin Adminconsole für Benutzerverwaltung

## Container ausführen

```
docker run \
-e POSTFIXADMIN_DB_TYPE=mysqli \
-e POSTFIXADMIN_DB_HOST=172.17.0.2 \
-e POSTFIXADMIN_DB_USER=postfixadmin \
-e POSTFIXADMIN_DB_PASSWORD=toor \
-e POSTFIXADMIN_DB_NAME=postfixadmin \
--name postfixadmin \
-p 80:80 \
postfixadmin
