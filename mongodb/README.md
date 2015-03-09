运行：

    sudo docker run --name mongodb -d -p 27017:27017 -v /var/opt/data/mongodb:/var/opt/data/mongodb -v /var/opt/log/mongodb:/var/opt/log/mongodb  zhulinpinyu/mongodb:2.6.8