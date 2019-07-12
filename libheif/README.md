
构建image
```
docker build -t libheif:v1.3.2-r2 .
docker build -t libheif:v1.4.0 .
```

验证镜像
```
docker run -v ${PWD}/photo:/work -it libheif:v1.4.0 sh

/work# heif-convert 1.HEIC 1.jpg
```
