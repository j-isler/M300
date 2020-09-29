# Reflexion
- [Drion Krasniqi](#Drilon-Krasniqi)
- [Baruyr Bousnaian](#Baruyr-Bousnaian)
- [Jenia Isler](#Jenia-Isler)

## Drilon Krasniqi

### Vorwissen

#### Git
Ich war schon mit Git vertraut. Das VCS habe ich schon für mehrere Projekte benutzt. Die Dokumentation hatte ich voresrt aber meistens in ein Word gemacht, hatte aber schon Ahnung mit Markdown.

#### Docker
Ich hatte Docker einmal im 2. Lehrjahr angeschaut. Dort hatte ich es aber auf Windows installiert gehabt, was meiner Meinung nach nicht sauber fonktioniert hat. Kann sein, dass sich dies mitlerweile geändert hat. Jedoch hatte ich mich da nicht so vertieft. Ich hatte aber von meinen Klassenkameraden viel davon gehört und wie es ungefährt aufgebaut ist. 
Zwar konnte ich damals einen Container starten, aber ein tatsächliches Verständnis wie ich Docker zu bedienen habe, hatte ich nicht.

#### Kubernetes
Bei Kubernetes hatte ich wenig bis zu gar kein Vorwissen. Zwar wurde es unter mienen Kollegen ein paar Mal erwähnt und als was es dient, aber ich hatte es nie für mich selbst angeschaut oder aufgesetzt. Ich wusste etwas von Nodes und dass es mit Docker zusammen arbeitet, weiter jedoch nicht.

### Wissenszuwach

#### Git
Was ich nicht von Git wusste, ist, dass man Docker Images hochladen und diese auch so publischen kann. Alles andere kannte ich aber schon.

#### Docker
Mit diesem Projekt konnte ich mir einiges Wissen Rund um Docker anschaffen. Ich kenne nun die Grund-Commands wie das Erstellen eines Images oder das Builden eines Containers mit dem erstellten Image. Zusätzlich weiss ich wie ein Dockerfile aufgebaut ist und was alles hineingehen kann. Sei es ein Baseimage oder Commands, welche beim Erstellen des Images oder erst beim Hochfahren des Containers, ausgeführt werden sollten. Ich habe auch gelernt wie man Dateien in einen Container mounted / kopiert, oder wie Configfiles in den Containern angepasst werden, ohne sich darauf verbinden zu müssen. Was ich auch nicht wusste, ist dass eine Container herunterfährt sobald der Prozess fertig gelaufen ist. Dies kann man aber verhinden, indem man die Applikation, welche man hauptsächlich im Container laufen lässt, als "Hauptprozess" ausführt und der so im Foreground steht. Als wir die Container zusammen gestellt hatten, habe ich auch gesehen, wie man mit den verschiedenen Containern arbeiten kann indem sich zum Beispiel der Postfixadmin mit der Datenbank auf einem anderen Container verbindet und sie so zusammen kollaborieren.

#### Kubernetes
Auch hier in Kubernetes habe ich erfahren, dass es ein File gibt, welches zusammen gestellt werden kann. Dieses sogenante YAML File beinhaltet Informationen wie zum Beispiel den Namen, welche Ports offen sind und sogar welches Docker images verwendet werden soll, aber noch vieles mehr.

### Reflexion
Insgesamt hat mir dieses Modul viel Spass gemacht, da es meinens Empfinden, ein Thema ist was sehr gut in der Arbeitswelt auftreten und dort auch implementiert kann. Es war mal wieder ein "richtiges Informatik" Modul, was man nicht bei allen Modulen an dieser Schule behaupten kann.

## Baruyr Bousnaian

### Vorwissen

#### Git
Github war für mich definitiv nichts Neues. Ich habe es bereits für mehrere private Projekte, als auch für Projekte an der TBZ genutzt. Demnach habe ich auch bereits mit Markdown gearbeitet und dokumentiert.
#### Docker
Mit Docker habe ich mich ebenfalls bereits ein wenig auseinandergesetzt, doch würde bestimmt nicht behaupten ich kannte mich gut aus. Docker wurde mir unteranderem von anderen Lehrern an der TBZ nahegelegt und als Zukunft der Virtualisierung betitelt. Ich habe bereits einige Container deployed und wusste von der Möglichkeit diese zu Clustern/Skalieren (Docker-Swarm). Dies war aber auch alles was ich über Docker Bescheid wusste.
#### Kubernetes
Kubernetes war mir zwar ein Begriff, jedoch kannte ich es nur als "grossen Bruder" oder als Erweiterung von Docker. Ich hatte bisher noch keine Gelegenheit mit Kubernetes zu arbeiten und habe mich auch nicht wirklich damit auseinandergesetzt.


### Wissenszuwachs

#### Git
Da ich bereits mit Git gearbeitet hatte, habe ich keinen grossen Wissenszuwachs in diesem Bereich erfahren.
#### Docker
Ich habe einiges an Wissen im Bereich Docker dazugelernt. Da wir eine Mailumgebung mit mehreren Services auf mehren Containern gebaut haben, konnte ich lernen, wie die verschiedenen Container miteinander arbeiten können. Ausserdem haben wir für die Mailumgebung keine fertigen Services als Container genommen, sondern haben ein blankes Ubuntu Image verwendet und die Services selbst containisiert. 
#### Kubernetes
Ich konnte einiges zu Kubernetes lernen. Ich musste mir für dieses Projekt erstmal die grundlegendsten Kenntnisse aneignen. Doch nun weiss ich wie Kubernetes arbeitet und welches die einzelnen Komponenten sind und wie diese miteinander arbeiten.


### Reflexion

## Jenia Isler

### Vorwissen
#### Git
Da ich privat schon mehrere kleinere Projekte gemacht habe und diese auf GitHub speicherte, war Git für mich kein Fremdwort. Auch kleinere Dokumentationen habe ich mit MarkDown gemacht gehabt.
#### Containerisierung
Containeriserung, vorallem Docker kannte ich schon und habe auch schon wenige Container, wie ein NGINX Webserver/ReverseProxy oder eine PHP entwicklungsumgebung laufen lassen. Die funktionsweise war mir bekannt und wichtige Befehele in Docker um Container zu inizialiseren hatte ich auch schon fest im Griff. Auch zu tun hatte ich schon mit Containerorchistrierung mit Docker-Compose und auch Docker-Swarm, bei welchen man mit Deklarationsdateien Container Infrastruckturen automatisch aufstarten kann. 
#### Kubernetes
Kubernetes kannte ich vom Begriff. War aber bisher immer sehr abgeschrekt, da es bei genauem anblick weit aus komplizierter scheinte als ein einfaches Swarm.



### Wissenszuwach

#### Git
Da ich Git bis anhin für private Projekte kannte, waren die Grundlagen nichts neues. Was aber neu war und die eigentlich grosse stärke von Git ist das Cooperierte Arbeiten an einem Projekt. Ich habe gelernt wie man mit mehereren Leuten Effizient an dem sleben Projekt arbeiten kann. Branches waren eine Sehr bereichernde addition zum Arbeiten im Team, denn wir konnten mehrere Kopien des Projektes erstellen, diese individuell Bearbeiten, ohne sich gegenseitig die sachen Kaputt zu machen und dann wieder zusammenzuführen.
#### Containerisierung
Da wir in diesem Projekt nicht einfach nur bestehende Container zusammengebunden haben, sondern eine ganze Email umgebung, bestehend aus Postfix als MTA, Dovecot als MDA und weiteren Diensten, die zwar weit auf dem Markt gebraucht werden, jedoch nicht offiziel containerisiert wurden, selber containerisert haben, haben ich enorm viel gelernt, wie man solche applikationen am besten containerisieren kann, obwohl sie nicht dafür gemacht sind. So musste für jeder einzelner Dienst individuell überlegt werden, welche konfigurationen man braucht, wie man diese als Umgebungsvariable einrichten kann und wie man diese ermöglicht. Zusätzlich musste auch eine möglichkeit gefunden werden, jede applikation in Foreground laufen zu lassen, damit der Container nicht einfach stopped wenn nicht mehr auf PID 1 läuft.

#### Kubernetes
Ich behaupte ich kann nun beim Thema Kubernetes gut mitsprechen. Denn ich gabe von Grund auf lernen müssen, wie Kubernetes funktioniert, wie man Applikationen darauf laufen lässt und diese der Öffentlichkeit zur verfügung stellt. Ich weiss nun aus welchen Diensten Kubernetes besteht und wie diese zusammen kommunizieren. Ich weiss nun welche vorherungen es braucht um eine Applikation zu deployen und ich weiss was ich machen muss, falls es nicht funktioniert, denn ich hatte bei der ganzen sache natürlch nicht wenig Probleme. 

### Reflexion
