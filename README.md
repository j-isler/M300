# M300
Git Repository für das Modul 300 im BIST

## Inhalt
 * [Allgemeine Informationen](#allgemeine-informationen)
 * [LB2](#LB2)
 * [LB3](#LB3)
 * [Mail-Environment](#Mail-Environment)
 * [Docker Container](#Docker-Container)
 * [Kubernetes](#Kubernetes)
 * [Weitere Inhalte](#weitere-inhalte)

## Allgemeine Informationen
Dieses Repository dient den Dokumentationszwecken und zur Versionierung des Fortschirtts im Projekt und Reflexion/Lernfortschitt für das Modul 300.

## LB2
Wir haben uns entschieden diese auszulassen. Weil wir dadurch nur die LB3 umsetzen, haben wir als Kompensation entschieden, unsere Containerumgebung auf Kubernetes zu deployen und somit uns mit Kubernetes bekanntzumachen.

## LB3
In der LB3 möchten wir eine Emailumgebung in Kubernetes deployen. Die Umgebung besteht aus einem [Postfix](./LB03/mail-environment/containers/postfix) container, einem [Dovecot](./LB03/mail-environment/containers/dovecot) container, einem [mariadb](./LB03/mail-environment/containers/mariadb) container und [apache](./LB03/mail-environment/containers/apache) container in welchem postfix admin läuft.

## Mail-Environment
Informationen über unsere Mailumgebung sind [hier](./LB03/mail-environment) dokumentiert.

## Docker-Container
Alle Informationen und Dokumentationen über Docker und unsere Container, welche wir für dieses Projekt erstellt haben, befinden sich [hier](./LB03/mail-environment/containers).

## Kubernetes
Das Wissen, welches wir über Kubernetes angeeignet haben, als auch alle Deklarationsdateien, welche wir für das auffahren unserer Umgebung gebraucht haben, sind unter dem [Kubernetes](./LB03/mail-environment/kubernetes) Ordner zu finden.

## Weitere Inhalte
- [Git Commands](https://github.com/baru5201/M300/blob/master/_Dokumentationen/git.md)
- [Linux and SSH](https://github.com/baru5201/M300/blob/master/_Dokumentationen/LinuxundSSH.md)
- [Reflexion](https://github.com/baru5201/M300/blob/master/_Dokumentationen/reflexion.md)


