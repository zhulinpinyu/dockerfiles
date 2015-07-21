
Build Elasticsearch Docker image with Marvel
===
  
  elasticsearch version 1.6

	```
  	docker build -t elasticsearch:1.6 .
	```

##Usage

###Basic

eg. use elasticsearch image create container

    docker run -d -p 9200:9200 -p 9300:9300 elasticsearch:1.6


###Attach persistent/shared directories

1. create container by mount volume and specify elasticsearch config file

    ```
    docker run --name es -d -p 9200:9200 -p 9300:9300 -v "$PWD/logs":/logs -v "$PWD/data":/data elasticsearch:1.6
    ```
2. open `http://host:9200` to visit
