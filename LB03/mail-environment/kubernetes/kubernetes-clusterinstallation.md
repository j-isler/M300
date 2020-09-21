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

Dies sind alles eigene Implementationen der Cloudprovider, basierend auf Kubernetes. Sie können vollautomatisiert erstellt und skaliert werden. Man muss lediglich seine eigenen Deployments für seine Applikation schreiben. 

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

