# Security
## Firewall
Bei Kubernetes oder Docker ist standartmässig alles zu. Wird ein Dienst exposed, bearbeitet Docker die IPTables selber um die Ports zu öffen. UFW ist nur eine vereinfachte oberfläche um die IPtables zu bearbeiten, darum wäre dies unnötig.

## Access
Zugegriffen auf das Cluster wird via kubectl. Die daten werden also über HTTPS übertragen. Hierführ wird der Token und das Certrifikat von `.kube/config` gebraucht
