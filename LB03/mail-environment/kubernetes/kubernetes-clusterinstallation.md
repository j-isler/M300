# Kubernetes-Clusterinstallation
Um ein Kubernetes Cluster zu erstellen für eine Produktionsumgebung, hat man grundsätzlich zwei möglichkeiten:
* Cloudprovider
* Baremetal 
## Cloud
Mittlerweile biten die meissten grossen Cloudanbieter "One-Click" Kubernetes Cluster an, welche sie als PaaS(Platform as a Service) verkaufen. Die Bekanntesten sind folgende:
* GKE (Google Kubernetes Enginge)
* AWS EKS (Amazon Elastic Kubernetes Service)
* AKS (Azure Kubernetes Service)
* ACK (Alibaba Container Service for Kubernetes)
* DigitalOcean Managed Kubernetes Cluster

Dies sind alles eigene Implementationen der Cloudprovider, basierend auf Kubernetes. Sie können vollautomatisiert erstellt und skaliert werden. Man muss lediglich seine eigenen Deployments für seine Applikation schreiben. Unterscheiden tun sich die verschiedenen Implementationen hauptsächlich im Preis und Feautureset. 

## Baremetal 
Schwieriger wird es, wenn man sein Cluster selber Hosten und erstellen möchte. Da muss man auf "Baremetal" implementationen von Kubernetes zurückgreifen. Auch hier hat man grob zwei Möglichkeiten dieses zu implementieren. 

### Kubernetes the hard way
Genauso wie Kubernetes für Mikroservices ersetllt wurde, besteht Kubernetes selber auch aus vielen verschiedenen Mikroservices. Bei "Kubernetes the hard way" wird jeder einzelne Service von Hand installiert und konfiguriert. folgende Komponenten gehören dazu:
* kube-scheduler
* kube-controller-manager
* kube-apiserver
* kubelet
* kube-proxy
* etcd
* CA

So könnte das aussehen:
![sample kubernetes the Hard way](https://github.com/baru5201/M300/blob/master/bilder/Kubernetesthehardway-sample.png)

Zu jedem Service muss auch ein Zertifikat erstellt werden, damit alle verschlüsselt kommunizieren können.

Vorteil bei dieser Implementation, ist dass man individueller die einzelnen Dienste kontrollieren und implementieren kann.

### kubeadm
Kubeadm ist ein tool/Script welches ermöglicht ein Kubernetes Cluster auf einem Linux Host auf "schnellem weg" erstellen kann. 
Kubeadm erstellt alles nötige um einen minimalen Kubernetes Cluster laufen zu lassen, auf welchem man dann selber zusätzliche Add-ons installieren kann.

Folgende Wichtige befehle bietet Kubeadm an:
- `kubeadm init` erstellt ein minimales Cluster mit einem Master
- `kubeadm join` um ein Worker node in das cluster zu joinen
- `kubeadm upgrade` um das Cluster auf eine neue version zu aktualisieren
- `kubeadm config` um Clusterupgrades zu konfigurieren
- `kubeadm token` um tokens für `kubeadm join` zu verwalten
- `kubeadm reset` um alle änderungen auf dem Host zurückzustellen welche mit `kubeadm init` oder `kubeadm join` gemacht wurden.
- `kubeadm version` um die version von kubeadm herauszufinden.

## Installation auf Ubuntu mit Kubeadm
### Installation Container Runtime 
Damit Kubernetes funktioniert, braucht es eine Container Runtime. Folgende werden von Kubernetes unterstützt:
- Docker
- CoreOS rkt "Rocket"
- Mesos Containerizer
- LXC Linux Containers (erste Container implementation, vor Docker)
- OpenVZ
- plain containerd (docker basiert auf containerd)

Aktuell ist Docker der industriestandart, für seine Vielseitigkeit und einfachtheit. Darum laufen 80% der Container auf Docker. Da Docker auch der standart für Kubernetes ist, nutzen wir hier Docker.

#### Set up Repository
1. installation der apt packete für HTTPS:
```
$ sudo apt-get update

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```
2. Offiziellen GPG Key von Docker hinzufügen:
```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
3. Stable release Repository von Docker hinzufügen:
```
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
#### installation Docker Engine
1. aktualiseren der apt packete und installation von Docker
```
 $ sudo apt-get update
 $ sudo apt-get install docker-ce docker-ce-cli containerd.io
```
2. starten des Dockerdeamon und aktivieren des autostarts
``` 
 $ sudo systemctl start docker
 
 $ sudo systemctl enable docker
``` 
3. Testen ob Docker voll funktioniert.
``` 
$ sudo docker run hello-world
``` 
### Kubernetes Cluster installation
#### Vorbereitung
1. Swapmemory wird von kubernetes nicht unterstützt, da es fehler generieren kann. Somit müssen wir es deaktivieren.
``` 
$ sudo swapoff -a
``` 
2. Falls SELinux oder bei Ubuntu AppArmor aktiviert ist, muss diese auch vorgängig deaktiviert werden, da diese nicht unterstützt wird.
3. Jedem Node sollte ein einzigartiger Hostname gesetzt werden
``` 
$ sudo hostnamectl set-hostname master-node
``` 
#### Kubernetes Tools installation
1. hinzufügen des signing key
``` 
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
``` 
2. hinzufügen des Software repository
```
$ sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
```
3. installation der Kubernetes Tools
```
$ sudo apt-get install kubeadm kubelet kubectl
```
4. installation prüfen
```
$ kubeadm version
```
#### Cluster Deployment
1. Auf dem "Master" Node den Cluster initialisieren
```
$ sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```
anschliessend mit dem erstellten tocken auf allen Worker Nodes kubeadm join ausführen.

#### Pod Netzwerk deployment
Das Pod Netzwerk ist ein Virtuelles Netzwerk (Bridge) welches gebraucht wird, damit sich die Pods unter den verschiedenen Nodes kommunizieren können.
Auch hier gibt es veschiedenen Implementationen die gebraucht werden können. Hier brauchen wir aber [Flannel](https://coreos.com/flannel/docs/latest/) von CoreOS

1. kubernetes Flannel deployen
```
$ kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```
2. ein paar Minuten waren und anschliessen kontrollieren ob alle Pods "Ready" sind
```
$ kubectl get pods --all-namespaces
```

#### NGINX Ingress deployment
https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal

Problem und Lösungen von Ingress auf Bare-Medal: https://kubernetes.github.io/ingress-nginx/deploy/baremetal/

## Installation von kubectl
Kubectl ist das tool welches man brauchen kann um über die kubernetes API prozesse auf den Cluster auszuführen. Dokumentation über die Commands welche wir mit kubectl gebraucht haben, sind [hier](https://github.com/baru5201/M300/blob/master/LB03/mail-environment/kubernetes/kubectl.md).
Damit wir aber nicht jedes Mal auf die Shell des Masters connecten müssen, um etwas auf dem Cluster zu machnen, können wir kubectl auch auf dem eigenen Host installieren und das Cluster remote zu kontrollieren.
Wie man kubectl auf dem eigenen Host installieren und konfigurieren ist [hier](https://kubernetes.io/de/docs/tasks/tools/install-kubectl/) dokumentiert. 

