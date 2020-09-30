# Containers
Hier sind alle Container hinterlegt, welche wir für unsere Emailumgebung erstellt haben.

## Allgemeine Informationen
Die Container wurden auf Basis von Docker erstellt. Hierführ haben wir für jeden Container ein Dockerfile erstellt und den jeweiligen Dienst auf einem bestehenden Ubuntu Image installiert und gestartet oder basierend auf einem bestehenden Image mit Dienst weitere Schichten auf das Image installiert.

## Docker 
Die Docker-Technologie nutzt den Linux-Kernel und Funktionen des Kernels wie Cgroups und Namespaces um Prozesse so zu trennen, dass sie unabhängig voneinander laufen können. Diese Unabhängigkeit ist die Absicht von Containern - die Fähigkeit, mehrere Prozesse und Anwendungen getrennt voneinander auszuführen, um Ihre Infrastruktur besser zu nutzen und gleichzeitig die Sicherheit zu erhalten, die man mit getrennten Systemen erreichen würde.

Container-Tools, einschliesslich Docker, bieten ein Image-basiertes Bereitstellungsmodell. Dadurch ist es einfach, eine Anwendung oder einen Satz von Diensten mit all ihren Abhängigkeiten über mehrere Umgebungen hinweg gemeinsam zu nutzen. Docker automatisiert auch die Bereitstellung der Anwendung (oder kombinierter Sätze von Prozessen, aus denen eine Anwendung besteht) innerhalb dieser Container-Umgebung.

Diese auf Linux-Containern aufbauenden Tools - was Docker benutzerfreundlich und einzigartig macht - bieten Benutzern beispiellosen Zugriff auf Anwendungen, die Möglichkeit der schnellen Bereitstellung und die Kontrolle über Versionen und Versionsverteilung.

## Images
Die fertigen Images sind als Paket im [Repository publiziert](https://github.com/baru5201/M300/packages).

## Unser Wissen 
Unser Wissen welches wir über die verschiedenen Komponente und Aspekte von Docker haben wir hier dokumentiert:

* [Docker container](./docker-doku/container.md)
* [Docker images](./docker-doku/images.md)
* [Docker File](./docker-doku/dockerfile.md)
* [Docker Commands](./docker-doku/commands.md)

