Tomcat 7 with oracle-jdk8

```
sudo docker build -t tomcat:7.0-oracle-jdk8 .
sudo docker run -rm -it -p 8080:8080 tomcat:7.0-oracle-jdk8
```