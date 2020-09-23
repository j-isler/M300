# Kubernetes mail-environment
## Kubernetes Dokumentation
- [Cluster Installation](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/kubernetes-clusterinstallation.md)
- [Deployment]()
- [Kubectl](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/kubectl.md)
- 
## Unser Clusteraufbau
![clusteraufbau](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/bilder/logisches-diagramm_kubernetes-cluster.png)

## Mail-environment deployen
Als erstes muss dieser [Ordner](https://github.com/baru5201/M300/tree/master/LB03/mail-environment/kubernetes/deployments) auf dem Master, oder einem Client, welcher wia kubectl auf das Cluster zugriff hat, heruntergeladen werden. Er binhaltet alle Manifest Files um die Umgebung aufzusetzten.
### Mariadb
1. Als erstes muss das Kubernetes Secret "`mysqlpw-secret.yaml`" erstellt werden. Dies ist im grunde ein normales Configmap, welches zusätzlich mit base64 verschlüsselt ist.
Das file siet dann so aus:
```
apiVersion: v1
kind: Secret
metadata:
   name: mysql-pass
type: Opaque
data:
   password: dG9vcg==  //base64 verschlüsseltes Passwort "toor"
```
Ist dieses Manifestfile erstellt, kann es mit wie folgt erstellt werden:
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
Dieses File erstellt im grunde zwei sachen, das Deployment selber und dann auch noch den Service, welcher dann ermöglicht das Deployment im Cluster erreichbar zu machen, über einen bestimmten Port. Gleichzeitig wird auch ein Hostname mit dem Namen des service erstell. Das Ganze file ist [hier](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/deployments/mariadb-deployment.yaml) abgebildet.

Alternativ kann man das Deployment so erstellen:
```
kubectl create deployment mariadb --image=jeniaisler/m300-mariadb:0.1
```
und anschliessend wie folgt exposed werden:
```
kubectl expose deployment mariadb --name=mariadb
```
### Postfixadmin
1. Postfix benutzt ein lokales konfigurationsfile mit gehashten Passwörter, um das Setuppasswort festzulegen und die MySQL connection informationen zu definieren. Da wir dies nich jedes mal manuell editieren möchten, haben wir dies in einem Configmap abgespeichert. Da aber das MySQL passwort darin sichtbar ist, müsste man dieses eigentlich in einem Secret speichert. Haben wir aber jetzt in diesem fall nicht.
um das Configmap zu erstellen, können wir entwerder ein neues Configmap aus einem File erstellen:
```
kubectl create configmap postfixadmin-config config.local.php
```
oder man kann es aus unserem vordefinierten Manifestfile erstellen lassen:
```
kubectl apply -f postfixadmin.configmap.yaml
```
  

