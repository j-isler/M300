# Kubernetes mail-environment
## Kubernetes Dokumentation
- [Cluster Installation](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/kubernetes-clusterinstallation.md)
- [Deployment]()
- [Kubectl](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/kubectl.md)

## Unser Clusteraufbau
![clusteraufbau](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/bilder/logisches-diagramm_kubernetes-cluster.png)

## Mail-environment deployen
Als erstes muss dieser [Ordner](https://github.com/baru5201/M300/tree/master/LB03/mail-environment/kubernetes/deployments) auf dem Master, oder einem Client, welcher wia kubectl auf das Cluster Zugriff hat, heruntergeladen werden. Er beinhaltet alle Manifest Files um die Umgebung aufzusetzen.
### Mariadb
1. Als Erstes muss das Kubernetes Secret "`mysqlpw-secret.yaml`" erstellt werden. Dies ist im Grunde ein normales Configmap, welches zusätzlich mit base64 verschlüsselt ist.
Das File sieht dann so aus:
```
apiVersion: v1
kind: Secret
metadata:
   name: mysql-pass
type: Opaque
data:
   password: dG9vcg==  //base64 verschlüsseltes Passwort "toor"
```
Ist dieses Manifestfile erstellt, kann es wie folgt erstellt werden:
```
kubectl apply -f mysqlpw-secret.yaml
```
Alternativ kann es auch so erstellt werden:
```
kubectl create secret generic mysql-pass --from-literal=password=toor
``` 
2. Nach dem das Secret erstellt wurde, kann Mysql mit dem erstellten Secret als Umgebungsvariable in Kubernetes deployed werden:
```
kubectl apply -f mariadb-deployment.yaml
```
Dieses File erstellt im Grunde zwei Sachen, das Deployment selber und dann auch noch den Service, welcher dann ermöglicht das Deployment im Cluster über einen bestimmten Port erreichbar zu machen. Gleichzeitig wird auch ein Hostname mit dem Namen des Dienstes erstellt. Das Ganze file ist [hier](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/deployments/mariadb-deployment.yaml) abgebildet.

Alternativ kann man das Deployment so erstellen:
```
kubectl create deployment mariadb --image=jeniaisler/m300-mariadb:0.1
```
und anschliessend wie folgt exposed werden:
```
kubectl expose deployment mariadb --name=mariadb
```
### Postfixadmin
1. Postfix benutzt ein lokales Konfigurationsfile mit gehashten Passwörter, um das Setuppasswort festzulegen und die MySQL connection Informationen zu definieren. Da wir dies nicht jedes mal manuell editieren möchten, haben wir dies in einer Configmap abgespeichert. Da aber das MySQL Passwort darin sichtbar ist, müsste man dieses eigentlich in einem Secret speichert. Haben wir aber jetzt in diesem Fall nicht.
um das Configmap zu erstellen, können wir entweeder ein neues Configmap aus einem File erstellen:
```
kubectl create configmap postfixadmin-config config.local.php
```
oder man kann es aus unserem vordefinierten Manifestfile erstellen lassen:
```
kubectl apply -f postfixadmin-configmap.yaml
```

2. Nach dem das Configmap erstellt wurde, können wir postfixadmin deployen. Das Deployment erstellt auch wieder ein Service und ein Deployment selber. 
Im [Deployment](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/deployments/postfixadmin-deployment.yaml) wird die Configmap als volume im Zielverzeichnis gemountet + alle anderen Configurationen als Umgebungsvariablen mitgegeben:
```
kubectl apply -f postfixadmin-deployment.yaml
```

3. Damit das Webinterface von postfixadmin erreichbar ist, muss noch eine [Ingress Ressource](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/deployments/postfixadmin-ressource.yaml) erstellt werden. Diese definiert, mit welchem Pfad oder Hostname der Service von aussen, über den NGINX Ingress-controller erreichbar ist.
```
kubectl apply -f postfixadmin-ressource.yaml
```
Damit aber die ganze Verbindung mit dem Ingress-Controller funktioniert, muss dieser vorerst schon bestehen. Wie man diesen erstellt ist [hier](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/kubernetes-clusterinstallation.md#nginx-ingress-deployment) dokumentiert.

### Postfix
Postfix braucht grundsätzlich keine weiteren Ressourcen. Lediglich die vorgeschriebenen Umgebungsvariablen für allgemeine configs und Passwörter. Sind diese richtig eingetragen, kann postfix hiermit erstellt werden:
```
kubectl apply -f postfix-ressource.yaml
```
Beschreibung über die Umgebungsvariablen sind unter den [Container spezifikationen](https://github.com/baru5201/M300/tree/master/LB03/mail-environment/containers/postfix) dokumentiert.

### Dovecot
Dovecot braucht grundsätzlich keine weiteren Ressourcen. Lediglich die vorgeschriebenen Umgebungsvariablen für allgemeine config und Passwörter. Sind diese richtig eingetragen, kann postfix hiermit erstellt werden:
```
kubectl apply -f postfix-ressource.yaml
```
Beschreibung über die Umgebungsvariablen sind unter den [Container spezifikationen](https://github.com/baru5201/M300/tree/master/LB03/mail-environment/containers/dovecot) dokumentiert.


  

