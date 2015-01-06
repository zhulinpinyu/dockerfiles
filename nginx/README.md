Dockerfile

    # Dockerfile for installing and running Nginx
    
    # Select ubuntu as the base image
    FROM ubuntu
    
    # Install nginx
    RUN apt-get update
    RUN apt-get install -y nginx
    RUN echo "daemon off;" >> /etc/nginx/nginx.conf

    # Publish port 80
    EXPOSE 80
    
    # Start nginx when container starts
    ENTRYPOINT /usr/sbin/nginx


运行：

    sudo docker run --name nginx -d -p 80:80 zhulinpinyu/nginx
