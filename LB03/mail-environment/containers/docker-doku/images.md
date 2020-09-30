# Images
Jeder Docker Container basiert auf einem Image. Dieses Image kann man direkt ausführen und nutzen, ist aber ansich meist noch nicht brauchbar.

## Inhalt eines Docker Image
Als erstes wird ein Base Image definiert + welche Version des Base Image verwendet werden soll.
Zudem kann definiert werden welche Applikationen installiert werden.
Eine weitere Komponente sind mehrere Commands, welche ausgeführt werden können. 
Es können sogar Config-Files bearbeitet werden.

## Docker Layers
Jede Anweisung in einem Dockerfile führt zu einer neuen Imageschicht – einem Layer –, die wieder zum Starten eines neuen Containers genutzt werden kann.
Die neue Schicht wird erzeugt, indem ein Container mit dem Image der vorherigen Schicht gestartet, dann die Dockerfile-Anweisung ausgeführt und schliesslich ein neues Image gespeichert wird.
Ist eine Dockerfile-Anweisung erfolgreich abgeschlossen worden, wird der temporär erzeugte Container wieder gelöscht.

## Image Registry
### Docker Hub registry
### Github Repository registry
1. Gthub Token erstellen und in einem File abspeichern. 
2. Mit dem erstellten Token auf Github mit Docker anmelden
```shell
$ cat ~/TOKEN.txt | docker login https://docker.pkg.github.com -u USERNAME --password-stdin
```
3. Image builden mit der korrekten URL im Tag zum Repository
```shell
$ docker build -t docker.pkg.github.com/OWNER/REPOSITORY/IMAGE_NAME:VERSION PATH
```
```shell
$ docker build -t docker.pkg.github.com/baru5201/m300/postfix:1.0 .
```
4. Image auf der Registry publishen 
```shell
$ docker push docker.pkg.github.com/OWNER/REPOSITORY/IMAGE_NAME:VERSION
```
