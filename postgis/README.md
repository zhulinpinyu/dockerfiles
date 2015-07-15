Setup Postgis
===

Postgres 9.4
postgis 2.1

[Dockerfile](https://github.com/appropriate/docker-postgis/tree/master/9.4-2.1)      
[Postgis docker image](https://registry.hub.docker.com/u/mdillon/postgis/)

Usage:
```shell
sudo docker pull mdillon/postgis:9.4
sudo docker run --name postgis -v /data/postgresql/data:/var/lib/postgresql/data -d -p 5432:5432 mdillon/postgis:9.4
```

###Tool phppgadmin
```
sudo docker run --name="phppgadmin" --link=postgis:postgresql -d -p 9001:80 maxexcloo/phppgadmin
```
