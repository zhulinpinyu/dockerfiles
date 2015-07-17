Postgis Usage
===

###1. Setup Postgis
Postgres 9.4
postgis 2.1

[Dockerfile](https://github.com/appropriate/docker-postgis/tree/master/9.4-2.1)      
[Postgis docker image](https://registry.hub.docker.com/u/mdillon/postgis/)

Usage:
```shell
sudo docker pull mdillon/postgis:9.4
sudo docker run --name postgis -v /data/postgresql/data:/var/lib/postgresql/data -d -p 5432:5432 mdillon/postgis:9.4
```
> default use postgres username/password is postgres/postgres; Tool is `pgAdmin 3`

###2. Tool phppgadmin
```
sudo docker run --name="phppgadmin" --link=postgis:postgresql -d -p 9001:80 maxexcloo/phppgadmin
```


###3. Postgresql data backup/restore from docker container


**Backup data from docker container**

```
sudo docker run -it -v /data/backup/postgresql:/opt --link postgis:postgres --rm mdillon/postgis:9.4 sh -c 'exec pg_dumpall -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres > /opt/myback.backup'
```

**Restore data to docker container**

```
sudo docker run -it -v /data/backup/postgresql:/opt --link postgis:postgres --rm mdillon/postgis:9.4 sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres < /opt/myback.backup'
```

> Tips: /data/backup/postgresql is host machine dir
