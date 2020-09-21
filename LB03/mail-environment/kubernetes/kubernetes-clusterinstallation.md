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


