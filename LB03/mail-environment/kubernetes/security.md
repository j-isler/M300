# Security
## Firewall
Bei Kubernetes oder Docker ist standartmässig alles zu. Wird ein Dienst exposed, bearbeitet Docker die IPTables selber um die Ports zu öffen. UFW ist nur eine vereinfachte oberfläche um die IPtables zu bearbeiten, darum wäre dies unnötig.

### Dienste
Alle Dienste sind lediglich innerhalb des Cluster verfügbar und sonst niergens. Einzig der Ingress-Controller ist nach ausses Verfügbar und leitet die Proxyanfragen an das Webinterface weiterleitet.

## Access
Zugegriffen auf das Cluster wird via kubectl. Die daten werden also über HTTPS übertragen. Hierführ wird der Token und das Certrifikat von `.kube/config` gebraucht.

## Passwörter als Umgebungsvariablen 
Passwörter sind base64 und in einem Secret gespeichert. Das Secret ist dann beim Container gemountet um diesen auszulesen.
