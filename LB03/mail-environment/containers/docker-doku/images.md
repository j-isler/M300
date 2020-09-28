# Images
Jeder Docker Contaier basiert auf einem Image. Dieses Image kann man direkt ausführen und nutzen, ist aber ansich meisst noch nicht brauchbar.

## Inhalt eines Docke Image

## Docker Layers

## Image Registry
### Docker Hub registry
### Github Repository registry
1. Gthub Token erstellen und in einem File abspeichern. 
2. Mit dem erstellten Token auf Github mit Docker anmelden
```shell
$ cat ~/TOKEN.txt | docker login https://docker.pkg.github.com -u USERNAME --password-stdin
```
3. Image builden mit der korrekten URL im Tag zum Repository
```shell
$ docker build -t docker.pkg.github.com/OWNER/REPOSITORY/IMAGE_NAME:VERSION PATH
```
```shell
$ docker build -t docker.pkg.github.com/baru5201/m300/postfix:1.0 .
```
4. Image auf der Registry publishen 
```shell
$ docker push docker.pkg.github.com/OWNER/REPOSITORY/IMAGE_NAME:VERSION
```
