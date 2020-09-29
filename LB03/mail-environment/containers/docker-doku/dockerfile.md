# Dockerfile
Docker kann Images automatisch erstellen, indem die Anweisungen aus einem Dockerfile gelesen werden. Ein Dockerfile ist ein Textdokument, das alle Befehle enthält, die ein Benutzer auf der Befehlszeile aufrufen kann, um ein Bild zusammenzusetzen. Mit einem Docker-Build können Benutzer einen automatischen Build erstellen, der mehrere Befehlszeilenanweisungen nacheinander ausführt.

Anschliessend kann das Image wie folgt gebuildet werden:
```Shell
    $ docker build -t testing .
```

Starten:
```Shell
    $ docker run --rm -d --name testing testing
```

Funktionsfähigkeit überprüfen:
```Shell
    $ docker exec -it testing bash
```

Überprüfung im Container:
```Shell
    $ ps -ef
    $ netstat -tulpen
