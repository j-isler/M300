# Images
Jeder Docker Contaier basiert auf einem Image. Dieses Image kann man direkt ausführen und nutzen, ist aber ansich meisst noch nicht brauchbar.

## Inhalt eines Docke Image

## Docker Layers

## Image Registry
### Docker Hub registry
### Github Repository registry
1. Gthub Token erstellen und in einem File abspeichern. 
2. Mit dem erstellten Token auf Github mit docker anmelden
```shell
$ cat ~/TOKEN.txt | docker login https://docker.pkg.github.com -u USERNAME --password-stdin
```
