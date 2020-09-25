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
Dieser Repository dient den Dokumentationszwecken und zur Versionier des fortschirtts im Projekt und Reflexion/lernfortschitt für das Modul 300.

## LB2
Wir haben uns entschieden die auszulassen. Da wir somit nur die LB3 umsetzen haben wir als kompensation entschieden unsere Container Umgebung auf Kubernetes zu deployen und somit uns mit kubernetes anzufreunden.

## LB3
In der LB3 möchten wir eine Email umgebung in Kubernetes deployen. Die Umgebung besteht aus einem [Postfix](./LB03/mail-environment/containers/postfix) container, einem [Dovecot](./LB03/mail-environment/containers/dovecot) container, einem [mariadb](./LB03/mail-environment/containers/mariadb) container und [apache](./LB03/mail-environment/containers/apache) container in welchen postfix admin läuft.

## Mail-Environment
Informationen über unsere Mail-Umgebung sind [hier](./LB03/mail-environment) Dokumentiert.

## Docker-Container
Alle Informationen und Dokumentationen über Docker und unsere Cotainer, welche wir für dieses Projekt erstellt haben, befinden sich im [Container](./LB03/mail-environment/containers) Ordner.

## Kubernetes
Das Wissen, welches wir über Kubernetes angeeignet haben, als auch alle Deklarationsdateien, welche wir für das auffahren unserer Umgebung gebraucht haben, sind unter dem [Kubernetes](./LB03/mail-environment/kubernetes) Ordner zu finden.

## Weitere Inhalte
- [Git](https://github.com/baru5201/M300/blob/master/_Dokumentationen/git.md)
- [Linux and SSH](https://github.com/baru5201/M300/blob/master/_Dokumentationen/LinuxundSSH.md)
- [Reflexion](https://github.com/baru5201/M300/blob/master/_Dokumentationen/reflexion.md)


