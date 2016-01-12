Postgis with Kmeans Usage
===

###1. Setup Postgis-kmeans
Postgres 9.4    
postgis 2.1    
Kmeans 1.1.0    
[Dockerfile](https://github.com/zhulinpinyu/dockerfiles/blob/master/postgis-with-kmeans/Dockerfile)      

Build Image:
```shell
sudo docker build -t postgis-kmeans .
```

Usage:
```shell
sudo docker run --name postgis -v /data/postgresql/data:/var/lib/postgresql/data -d -p 5432:5432 postgis-kmeans
```
> default use postgres username/password is postgres/postgres; Tool is `pgAdmin 3`

###2. Tool phppgadmin
```
sudo docker run --name="phppgadmin" --link=postgis:postgresql -d -p 9001:80 maxexcloo/phppgadmin
```


###3. Postgresql data backup/restore from docker container


**Backup data from docker container**

```
sudo docker run -it -v /data/backup/postgresql:/opt --link postgis:postgres --rm postgis-kmeans sh -c 'exec pg_dumpall -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres > /opt/myback.backup'
```

**Restore data to docker container**

```
sudo docker run -it -v /data/backup/postgresql:/opt --link postgis:postgres --rm postgis-kmeans sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres < /opt/myback.backup'
```

> Tips: /data/backup/postgresql is host machine dir

## DevOps Logs
```shell
sudo docker load < pk.tar
sudo docker stop postgis
sudo docker run --name postgis_t -v /data/postgresql/data:/var/lib/postgresql/data -d -p 5432:5432 postgis-kmeans

// 测试客户端连接 若success
sudo docker rm postgis
sudo docker run --name postgis -v /data/postgresql/data:/var/lib/postgresql/data -d -p 5432:5432 postgis-kmeans

//再次测试

```
